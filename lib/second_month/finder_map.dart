import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'bottomsheetmodel.dart';
import 'detailesinfo.dart';

class MapFinder extends StatefulWidget {
  const MapFinder({Key? key}) : super(key: key);
  
  @override
  _MapFinderState createState() => _MapFinderState();
}

class _MapFinderState extends State<MapFinder> {

  Set<Marker> mapMarker = HashSet<Marker>();
  late String _mapStyle;
  late GoogleMapController _mapController;

  @override
  initState() {
    super.initState();
    rootBundle.loadString('assets/assetsecondmonth/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }
  void handleFABPressed() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          child: hotelsInfo(context)
        );
      },
    );
  }


  onMapCreated(GoogleMapController controller) {
    if (mounted) {
      setState(() {
        _mapController = controller;
        mapMarker.add(Marker(
          markerId: const MarkerId("1"),
          position: const LatLng(35.2446, -3.9317),
          infoWindow: InfoWindow(
            title: " Hotel Mira Palace ",
            snippet: " Hotel Mira Palace",
            onTap: ()
            {
              handleFABPressed();
            }
          ),
        ));
        //controller.setMapStyle(_mapStyle);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(target: LatLng(35.2446, -3.9317),zoom: 6),
          markers: mapMarker,
          onMapCreated:onMapCreated
        ),),
    );
  }
}


Widget hotelsInfo(BuildContext context)
{
  return Container(
    height: 270,
    color: Colors.white,
    child:  imageList(context: context,image: "https://steemitimages.com/DQmS46PX5q8eRxaoXCYWe4uPT9J5v7uyDJvbptSpue4tYQP/alhouceima.jpg"),
  );
}

Widget imageList({required BuildContext context,required String image}) {
  return Column(
    children: [
      const Text("Hotel Mira Palace",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      Row(
        children: const [
          SizedBox(width: 15,),
          Text("Hotel Image",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        ],
      ),
      const SizedBox(height: 5,),
      SizedBox(
        height: 100,
        width: double.maxFinite,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 5,),
      Row(
        children: const [
          SizedBox(width: 15,),
          Text("Pricing \$ 400",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        ],
      ),
      const SizedBox(height: 5,),
      bookingButtonInMap(context)
    ],
  );
}


Widget bookingButtonInMap(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
    child: SizedBox(
      height: 45,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: ()
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailsInfo(heroTag: "isHero3",imageHero: "https://steemitimages.com/DQmS46PX5q8eRxaoXCYWe4uPT9J5v7uyDJvbptSpue4tYQP/alhouceima.jpg",)));

        },
        child: const Text(
          "BOOK NOW",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.blue.shade300,
            elevation: 0,
            onPrimary: Colors.black,
            shadowColor: Colors.black),
      ),
    ),
  );
}
