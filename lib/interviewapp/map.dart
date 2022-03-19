import 'package:challenges2022/interviewapp/controllerapp.dart';
import 'package:challenges2022/interviewapp/widge.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:camera/camera.dart';


class MapView extends StatefulWidget {
  MapView ({Key? key, required this.camera, }) : super(key: key);
  final CameraDescription camera;
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {


  @override
  void initState() {
    super.initState();
    }

  getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      currentPosition = position;
      print(" ${position.latitude}");
      appInterviewController.mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 18.0,
          ),
        ),
      );

      await appInterviewController.getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  AppInterviewController appInterviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Scaffold(
        key: appInterviewController.scaffoldKey,
        body: Stack(
          children: <Widget>[
            // Map View
            buildMap(),
            zoomWidget(),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            'Places',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          const SizedBox(height: 10),
                          textField(
                              label: 'Start',
                              hint: 'Choose starting point',
                              prefixIcon: const Icon(Icons.looks_one),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.my_location),
                                onPressed: () {
                                  appInterviewController.startAddressController.text = appInterviewController.currentAddress;
                                  appInterviewController.startAddress = appInterviewController.currentAddress;
                                },
                              ),
                              controller: appInterviewController.startAddressController,
                              focusNode: appInterviewController.startAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  appInterviewController.startAddress = value;
                                });
                              }),
                          const SizedBox(height: 10),
                          textField(
                              label: 'Destination',
                              hint: 'Choose destination',
                              prefixIcon: const Icon(Icons.looks_two),
                              controller: appInterviewController.destinationAddressController,
                              focusNode: appInterviewController.desrinationAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  appInterviewController.destinationAddress = value;
                                });
                              }),
                          const SizedBox(height: 10),
                          Visibility(
                            visible: appInterviewController.placeDistance == null ? false : true,
                            child: Text(
                              'DISTANCE: ${appInterviewController.placeDistance} km',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: (appInterviewController.startAddress != '' &&
                                appInterviewController.destinationAddress != '')
                                ? () async
                            {
                              appInterviewController.buttonFunction(context);
                            }
                                : null,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Show Route'.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          ElevatedButton(onPressed: ()
                          {
                            appInterviewController.showPicker(context,widget.camera);
                          }
                            ,child: Text("Take pic"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Show current location button
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.orange.shade100,
                      child: InkWell(
                        splashColor: Colors.orange,
                        child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () {
                          appInterviewController.mapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                 currentPosition.latitude,
                                  currentPosition.longitude,
                                ),
                                zoom: 18.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );


  }

}
 late Position currentPosition;