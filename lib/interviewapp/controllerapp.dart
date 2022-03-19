


import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:challenges2022/interviewapp/map.dart';
import 'package:challenges2022/interviewapp/secrets.dart';
import 'package:challenges2022/interviewapp/takepicture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../first month/shared/Component/constent/constent.dart';
import 'dart:math' show cos, sqrt, asin;

class AppInterviewController extends GetxController
{
  final CameraPosition initialLocation = const CameraPosition(target: LatLng(0.0, 0.0));
  late GoogleMapController mapController;



  String currentAddress = '';

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String startAddress = '';
  String destinationAddress = '';
  String? placeDistance;

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription? subscription;
  var picker = ImagePicker();
  File? profileImage;

  getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = p[0];

        currentAddress =
        "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = currentAddress;
        startAddress = currentAddress;
     update();
    } catch (e) {
      print(e);
    }
  }


  Future<bool> calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Location> startPlacemark = await locationFromAddress(startAddress);
      List<Location> destinationPlacemark =
      await locationFromAddress(destinationAddress);


      double startLatitude = startAddress == currentAddress
          ? currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = startAddress == currentAddress
          ? currentPosition.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      // Start Location Marker
      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: startAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Adding the markers to the list
      markers.add(startMarker);
      markers.add(destinationMarker);

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );


      await createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }
      update();
        placeDistance = totalDistance.toStringAsFixed(2);
        print('DISTANCE: $placeDistance km');
        update();
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  double coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  createPolylines(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude,
      ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY,
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }


  buttonFunction(context)
  {
    startAddressFocusNode.unfocus();
    desrinationAddressFocusNode.unfocus();
   update();
      if (markers.isNotEmpty) markers.clear();
      if (polylines.isNotEmpty)
      {
        polylines.clear();
      }
      if (polylineCoordinates.isNotEmpty)
      {
        polylineCoordinates.clear();
      }
      placeDistance = null;
    update();

    calculateDistance().then((isCalculated) {
      if (isCalculated) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
                'Distance Calculated Sucessfully'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
                'Error Calculating Distance'),
          ),
        );
      }
    });
  }

  void showPicker(context,CameraDescription camera ){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child:  Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                      getCoverImage();
                        print("fromgalary");
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      print("fromcamera");
                      //  _imgFromCamera();
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TakePictureScreen(
                              camera:camera
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Future<void> getCoverImage() async {

    picker.pickImage(source: ImageSource.gallery).then((value)
    {
      if (value != null)
      {
        profileImage = File(value.path);
        test2 = profileImage;
        print(value.path);
        uploadImage();
      } else {
        print('No image selected.');
      }

    });

  }

  void uploadImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('prototypeapp/${Uri.file(test2!.path).pathSegments.last}')
        .putFile(test2!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // value is image path
        debugPrint(value);
      }).catchError((error)
      {

      });
    }).catchError((error) {
    });
  }

  @override
  void onInit()
  {
   // getCurrentLocation();

  }
}

