import 'package:challenges2022/interviewapp/controllerapp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

AppInterviewController appInterviewController = Get.find();

Widget textField({
  required TextEditingController controller,
  required FocusNode focusNode,
  required String label,
  required String hint,
  required double width,
  required Icon prefixIcon,
  Widget? suffixIcon,
  required Function(String) locationCallback,
}) {
  return SizedBox(
    width: width * 0.8,
    child: TextField(
      onChanged: (value) {
        locationCallback(value);
      },
      controller: controller,
      focusNode: focusNode,
      decoration:  InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: Colors.blue.shade300,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
        hintText: hint,
      ),
    ),
  );
}


Widget zoomWidget()
{
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Material(
              color: Colors.blue.shade100, // button color
              child: InkWell(
                splashColor: Colors.blue, // inkwell color
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.add),
                ),
                onTap: () {
                  appInterviewController.mapController.animateCamera(
                    CameraUpdate.zoomIn(),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          ClipOval(
            child: Material(
              color: Colors.blue.shade100, // button color
              child: InkWell(
                splashColor: Colors.blue, // inkwell color
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.remove),
                ),
                onTap: ()
                {
                  appInterviewController.mapController.animateCamera(
                    CameraUpdate.zoomOut(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ),
  );
}


Widget buildMap()
{
  return  GoogleMap(
    markers: Set<Marker>.from(appInterviewController.markers),
    initialCameraPosition: appInterviewController.initialLocation,
    myLocationEnabled: true,
    myLocationButtonEnabled: false,
    mapType: MapType.normal,
    zoomGesturesEnabled: true,
    zoomControlsEnabled: false,
    polylines: Set<Polyline>.of(appInterviewController.polylines.values),
    onMapCreated: (GoogleMapController controller) {
      appInterviewController.mapController = controller;
    },
  );
}
