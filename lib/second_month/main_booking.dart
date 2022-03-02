
import 'package:challenges2022/second_month/ram.dart';
import 'package:flutter/material.dart';

import 'detailesinfo.dart';
import 'diotest.dart';
import 'finder_map.dart';

class MainBooking extends StatefulWidget {
  const MainBooking({Key? key}) : super(key: key);

  @override
  _MainBookingState createState() => _MainBookingState();
}

class _MainBookingState extends State<MainBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            customAppBarBooking(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    searchBarBooking(onTab: (){}),
                    transportItems(context),
                    stackingItem(),
                    searchButton(context),
                    SizedBox(
                      height: 130,
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          physics: const  BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(8.0),
                          scrollDirection: Axis.horizontal,
                          children:
                          [
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                              height: 160,
                              width: 160,
                              child: Stack(
                                children: [
                                Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.network("http://morocco-nomad-excursions.com/wp-content/uploads/2020/02/Morocco-travel.jpg",fit: BoxFit.cover,),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                ),
                                  Positioned.directional(top: 60,textDirection: TextDirection.ltr,child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5),)),
                                    width: 130,
                                    height: 30,
                                    child: Column(
                                        crossAxisAlignment : CrossAxisAlignment.start,
                                      children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Al Hoceima Beach ",style: TextStyle(height: 1,color: Colors.blue,fontWeight: FontWeight.bold),),
                                      ),
                                    ],),
                                  ))

                                ],),

                            ),
                            const SizedBox(width: 6,),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                              height: 160,
                              width: 160,
                              child: Stack(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.network("http://morocco-nomad-excursions.com/wp-content/uploads/2020/02/Morocco-travel.jpg",fit: BoxFit.cover,),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Positioned.directional(top: 60,textDirection: TextDirection.ltr,child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5),)),
                                    width: 130,
                                    height: 30,
                                    child: Column(
                                      crossAxisAlignment : CrossAxisAlignment.start,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text("Al Hoceima Beach ",style: TextStyle(height: 1,color: Colors.blue,fontWeight: FontWeight.bold),),
                                        ),
                                      ],),
                                  ))

                                ],),

                            ),
                            const SizedBox(width: 6,),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                              height: 160,
                              width: 160,
                              child: Stack(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.network("http://morocco-nomad-excursions.com/wp-content/uploads/2020/02/Morocco-travel.jpg",fit: BoxFit.cover,),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Positioned.directional(top: 60,textDirection: TextDirection.ltr,child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5),)),
                                    width: 130,
                                    height: 30,
                                    child: Column(
                                      crossAxisAlignment : CrossAxisAlignment.start,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text("Al Hoceima Beach ",style: TextStyle(height: 1,color: Colors.blue,fontWeight: FontWeight.bold),),
                                        ),
                                      ],),
                                  ))

                                ],),

                            ),

                          ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Container(height: 30, width: 10, decoration: BoxDecoration(color: Colors.blue.shade300,borderRadius: BorderRadius.circular(5)),),
                        const SizedBox(width: 5,),
                         Text("Places", style: TextStyle(color: Colors.blue.shade300,fontWeight: FontWeight.bold,fontSize: 19),),
                      ],),
                    ),
                    SizedBox(
                      height: 130,
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          physics: const  BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(8.0),
                          scrollDirection: Axis.horizontal,
                          children:
                          [
                            InkWell(
                              onTap: ()
                              {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailsInfo(heroTag: "isHero1",imageHero:"https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/142557287.jpg?k=d025c0ad9ef2ba7799a95531ee547d0944da4f3b95c037350f159426ef708124&o=&hp=1" ,)));
                              },
                              child: Hero(
                                tag: "isHero1",

                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                  height: 160,
                                  width: 160,
                                  child: Stack(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.network("https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/142557287.jpg?k=d025c0ad9ef2ba7799a95531ee547d0944da4f3b95c037350f159426ef708124&o=&hp=1",fit: BoxFit.cover,),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                      ),
                                      Positioned.directional(top: 60,textDirection: TextDirection.ltr,child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5),)),
                                          width: 130,
                                          height: 30,
                                          child: const Material(child: Text(" Al Hoceima Beach ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                                      ))






                                    ],),

                                ),
                              ),
                            ),
                            const SizedBox(width: 6,),
                            InkWell(
                              onTap: ()
                              {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailsInfo(heroTag: "isHero2",imageHero: "https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/142557848.jpg?k=1cb1e238a0073aacd8b56a55db35962845d12e7beca33e278fd72e8085f8cc61&o=&hp=1",)));
                              },
                              child: Hero(
                                tag: "isHero2",

                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                  height: 160,
                                  width: 160,
                                  child: Stack(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.network("https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/142557848.jpg?k=1cb1e238a0073aacd8b56a55db35962845d12e7beca33e278fd72e8085f8cc61&o=&hp=1",fit: BoxFit.cover,),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                      ),
                                      Positioned.directional(top: 60,textDirection: TextDirection.ltr,child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5),)),
                                          width: 130,
                                          height: 30,
                                          child: const Material(child: Text(" Al Hoceima Beach ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                                      ))






                                    ],),

                                ),
                              ),
                            ),
                            const SizedBox(width: 6,),
                            InkWell(
                              onTap: ()
                              {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailsInfo(heroTag: "isHero3",imageHero: "https://steemitimages.com/DQmS46PX5q8eRxaoXCYWe4uPT9J5v7uyDJvbptSpue4tYQP/alhouceima.jpg",)));
                              },
                              child: Hero(
                                tag: "isHero3",

                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                  height: 160,
                                  width: 160,
                                  child: Stack(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.network("https://steemitimages.com/DQmS46PX5q8eRxaoXCYWe4uPT9J5v7uyDJvbptSpue4tYQP/alhouceima.jpg",fit: BoxFit.cover,),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                      ),
                                      Positioned.directional(top: 60,textDirection: TextDirection.ltr,child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5),)),
                                        width: 130,
                                        height: 30,
                                        child: const Material(child: Text(" Al Hoceima Beach ",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                                      ))




                                    ],),

                                ),
                              ),
                            ),

                          ],),
                      ),
                    ),
                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}


Widget customAppBarBooking() {
  return   Padding(
    padding: const EdgeInsets.all(10),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_rounded)),

        Row(
          children: const [
            Text("Location : AL Houcima", style: TextStyle(fontWeight: FontWeight.bold),),
            Icon(Icons.location_pin),
          ],
        ),
        CircleAvatar(radius:30,backgroundColor: Colors.redAccent.shade200,backgroundImage: const AssetImage("assets/images/me.jpg")),

      ],
    ),
  );
}

Widget searchBarBooking({required void Function() onTab}) {
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    child: Row(
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child:ElevatedButton(onPressed: onTab,child:Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.start ,
              children:const [
                Icon(Icons.search),
                SizedBox(width: 10,),
                Text("Search"),

              ],
            ) ,style: ElevatedButton.styleFrom(
                primary:  Colors.white,
                elevation: 0,
                onPrimary: Colors.black,
                shadowColor: Colors.black
            ),)
            ,height: 50,
            decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(5)),
          ),
        ),
        const SizedBox(width: 20,),
        Container(
          child: ElevatedButton(onPressed: (){},child: const Center(child: Icon(Icons.filter_alt_sharp)),style: ElevatedButton.styleFrom(
              primary:  Colors.white,
              elevation: 0,
              onPrimary: Colors.black,
              shadowColor: Colors.black,
            onSurface: Colors.teal
          ),),
          height: 50,
          width: 50,
         decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(5)),
        )
      ],
    ),
  );

}

Widget transportItems(context) {

  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      height: 90,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RAM()));              },
              child: Container(
                decoration: BoxDecoration( color: Colors.redAccent.shade100,borderRadius: BorderRadius.circular(3)),
                height: 70,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const  [
                    Icon(Icons.flight_takeoff,color: Colors.white,),
                    Text("FLIGHT" , style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                  ],
                ) ,),
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:   [

                  Icon(Icons.train,color: Colors.blue.shade300,),
                  Text("TRAIN", style: TextStyle(color: Colors.blue.shade300,fontWeight: FontWeight.bold),)

                ],
              ) ,),
            SizedBox(
              height: 80,
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:   [

                  Icon(Icons.local_taxi,color: Colors.blue.shade300,),
                  Text("TAXI", style: TextStyle(color: Colors.blue.shade300,fontWeight: FontWeight.bold),)

                ],
              ) ,),
            SizedBox(
              height: 80,
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Icon(Icons.directions_bus_rounded,color: Colors.blue.shade300,),
                  Text("BUS", style: TextStyle(color: Colors.blue.shade300,fontWeight: FontWeight.bold),)

                ],
              ) ,),
          ],),
      ),
    ),
  );
}

Widget stackingItem() {
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    child: SizedBox(
      height:240,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 190,
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
            child: Image.network("http://morocco-nomad-excursions.com/wp-content/uploads/2020/02/Morocco-travel.jpg",fit: BoxFit.cover,),),
          Positioned(
            top: 30,
            left: 15,
            right: 15,
            bottom: 5,
            child: Container(
              width: 80,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                  [
                    Row(children: [
                      Container(height: 30,width: 80,child: const Center(child: Text("Text", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(color: Colors.blue.shade300,borderRadius: BorderRadius.circular(15)),
                      ),
                      const SizedBox(width: 12,),
                      Container(height: 30,width: 80,child: Center(child: Text("Text", style: TextStyle(color: Colors.blue.shade300,fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 2,color: Colors.blue.shade300,)),
                      ),
                    ],),
                    SizedBox(height: 140,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10,top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                          [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text("From" , style: TextStyle(color:Colors.blue.shade300,fontWeight: FontWeight.bold),),
                                  Icon(Icons.local_airport, color: Colors.blue.shade300,),
                                  Text("To" , style: TextStyle(color:Colors.blue.shade300,fontWeight: FontWeight.bold),),
                                ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Casablanca", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,height: 1),),
                                  Text("New York", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,height: 1),),
                                ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 9),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                                    children: const[
                                      Text("Casablanca ,Morocco",style: TextStyle(fontSize: 13,height: 1.1),),
                                      Text("23:45 ,Thu 15 Oct",style: TextStyle(fontSize: 13,height: 1.1),),
                                      Text("terminal",style: TextStyle(fontSize: 13,height: 1.1),),
                                    ],),
                                  Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisSize: MainAxisSize.min,
                                    children: const[
                                      Text("Casablanca ,Morocco",style: TextStyle(fontSize: 13,height: 1.1),),
                                      Text("23:45 ,Thu 15 Oct",style: TextStyle(fontSize: 13,height: 1.1),),
                                      Text("terminal",style: TextStyle(fontSize: 13,height: 1.1),),
                                    ],),
                                ],
                              ),

                            )],
                        ),
                      )
                      ,),
                  ],),
              ),
            ),

          ),
        ],
      ),
    ),);
}

Widget searchButton(context) {
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: SizedBox(
      height: 50,
      width: double.maxFinite,
      child: ElevatedButton(onPressed:(){

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MapFinder()));


      },
        child: const Text("SEARCH FLIGHTS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 18),),
        style: ElevatedButton.styleFrom(
            primary:  Colors.blue.shade300,
            elevation: 0,
            onPrimary: Colors.black,
            shadowColor: Colors.black
        ),),
    ),
  );
}