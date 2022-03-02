import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookingstates.dart';
import 'cubitbooking.dart';

class DetailsInfo extends StatefulWidget {
  final String heroTag;

  final String imageHero;

   DetailsInfo({Key? key, required this.heroTag, required this.imageHero}) : super(key: key);

  @override
  _DeteilInfoState createState() => _DeteilInfoState();
}




class _DeteilInfoState extends State<DetailsInfo> {
  Color favoritColor = Colors.white;
  IconData favoritIcon = Icons.favorite_outline_rounded;
  bool isFavorit = false;





  @override
  Widget build(BuildContext context) {

    return BlocConsumer<BookingAppCubit,BookingAppStates>(
        listener:  (context,state){},
        builder: (context,state)
        {
          var cubit = BookingAppCubit.get(context);
         return  Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    color: Colors.white.withOpacity(0),
                    height: MediaQuery.of(context).size.width - 80,
                    width: double.maxFinite,
                    child: Hero(
                      tag: widget.heroTag,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.network(
                            widget.imageHero,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade300,
                                            borderRadius: BorderRadius.circular(5)),
                                        height: 50,
                                        width: 50,
                                        child: const Icon(
                                          Icons.arrow_back_ios_rounded,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isFavorit = !isFavorit;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade300,
                                            borderRadius: BorderRadius.circular(5)),
                                        height: 50,
                                        width: 50,
                                        child: Icon(
                                          isFavorit
                                              ? Icons.favorite
                                              : Icons.favorite_outline_rounded,
                                          color: isFavorit
                                              ? Colors.redAccent
                                              : Colors.white,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          infoPositioned(context)
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    "Hotel Mira Palace",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: imageList(image: widget.imageHero,bookingButton : bookingButton(bookNow: ()
                      {
                        cubit.handleFABPressed(context, start: cubit.startController,end: cubit.endController);
                      })),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget buttonPlus({required int eventnumber, void Function()? onAdd}) {
  return InkWell(
    onTap: onAdd,
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.blue.shade300,
          borderRadius: BorderRadius.circular(10)),
      child: const Icon(Icons.exposure_plus_1,size: 20,color: Colors.white,),
    ),
  );
}
Widget buttonMinas({required int eventnumber,  void Function()? onMinase}) {
  return InkWell(
    onTap: onMinase ,
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.blue.shade300,
          borderRadius: BorderRadius.circular(10)),
      child: const Icon(Icons.exposure_minus_1,size: 20,color: Colors.white),
    ),
  );
}
Widget rowBtton({required String data, required int eventnumber,required void Function() onAdd,required void Function() onminase}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(data),
        Row(
          children: [
            buttonPlus(eventnumber: eventnumber,onAdd: onAdd),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$eventnumber",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            buttonMinas(eventnumber: eventnumber,onMinase: onminase),
          ],
        )
      ],

    ),
  );
}
Widget bookingButton({required void Function() bookNow}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: SizedBox(
      height: 50,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed:bookNow,
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
Widget imageList({required String image,required Widget bookingButton}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(5)),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Places",
                style: TextStyle(
                    color: Colors.blue.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          width: double.maxFinite,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                height: 280,
                width: 280,
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
                height: 280,
                width: 280,
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
                height: 280,
                width: 280,
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
        SizedBox(height: 60,),
        Padding(
          padding: const EdgeInsets.all(10),
          child: bookingButton,
        ),
      ],
    ),
  );
}
Widget infoPositioned(context) {
  return Positioned(
      top: MediaQuery.of(context).size.width - 170,
      left: 20,
      right: 20,
      bottom: 15,
      child: Opacity(
        opacity: 0.9,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(5)),
          child: SingleChildScrollView(
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4.6",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "(500)",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Text(
                          "Pricing ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          "\$200 ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ));
}





