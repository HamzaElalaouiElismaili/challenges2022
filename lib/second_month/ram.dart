import 'package:flutter/material.dart';

class RAM extends StatefulWidget {
  const RAM({Key? key}) : super(key: key);

  @override
  _RAMState createState() => _RAMState();
}

class _RAMState extends State<RAM> {
  double? h;
  double? w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar:  AppBar(centerTitle: true,elevation:0, backgroundColor:Colors.transparent,leading: TextButton(onPressed: ()
      {
        Navigator.of(context).maybePop();
      },child: const  Text("Back", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),),
          title: Image.asset("assets/assetsecondmonth/ram.png",height: 50,)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children:
            [
              const SizedBox(height: 20,),
              const  Text("Casablanca ,Morocco", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              const SizedBox(height: 15,),

              Container(
                height: 420,
                width: w!-50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      colors: [
                        Colors.red.shade100,
                        Colors.redAccent.withOpacity(0.6)
                      ]),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(children:
                  [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("From" , style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                      Icon(Icons.flight_takeoff, color: Colors.white,),
                        Text("To" , style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                    ],),
                  ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                        Text("Casablanca", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("New York", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
                            Text("Casablanca ,Morocco",style: TextStyle(fontSize: 13,height: 1.1),),
                            Text("23:45 ,Thu 15 Oct",style: TextStyle(fontSize: 13,height: 1.1),),
                            Text("terminal",style: TextStyle(fontSize: 13,height: 1.1),),
                          ],),
                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                            children: const[
                              Text("Casablanca ,Morocco",style: TextStyle(fontSize: 13,height: 1.1),),
                              Text("23:45 ,Thu 15 Oct",style: TextStyle(fontSize: 13,height: 1.1),),
                              Text("terminal",style: TextStyle(fontSize: 13,height: 1.1),),
                            ],),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(height: 2,color: Colors.white,),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children:const
                                  [
                                      Text("GATE" , style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                                      Text("C2",style: TextStyle(color:Colors.white)),
                                  ],
                                ),
                                Column(
                                  children:const [

                                    Text("FLIGHT",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                                    Text("C2 EEE4",style: TextStyle(color:Colors.white)),

                                  ],
                                ),
                                Column(
                                  children:const [

                                    Text("SEAT",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                                    Text("C23",style: TextStyle(color:Colors.white)),

                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(height: 2,color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15,vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("TRAVELLER"),
                            Text("Hamza EL ALAOUI EL ISMAILI"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: const [
                            Text("CLASS"),
                            Text("Economy"),
                          ],
                        ),
                      ],),
                    ),
                    const Spacer(),
                    Image.asset("assets/assetsecondmonth/barcode.png", height: 70,)
                  ],),
                ),
              ),
              const SizedBox(height: 15,),
              Container(height: 150,width: w!-50, decoration: BoxDecoration(
              color: Colors.redAccent.shade100,
              borderRadius: BorderRadius.circular(15),),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children:
                  [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("From" , style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                        Icon(Icons.local_airport, color: Colors.white,),
                        Text("To" , style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                      ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Casablanca", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("New York", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: const[
                            Text("Casablanca ,Morocco",style: TextStyle(fontSize: 13,height: 1.1),),
                            Text("23:45 ,Thu 15 Oct",style: TextStyle(fontSize: 13,height: 1.1),),
                            Text("terminal",style: TextStyle(fontSize: 13,height: 1.1),),
                          ],),
                        Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: const[
                            Text("Casablanca ,Morocco",style: TextStyle(fontSize: 13,height: 1.1),),
                            Text("23:45 ,Thu 15 Oct",style: TextStyle(fontSize: 13,height: 1.1),),
                            Text("terminal",style: TextStyle(fontSize: 13,height: 1.1),),
                          ],),
                      ],
                    ),

                    )],),
              )
                ,),
              const SizedBox(height: 15,),
              Container(height: 150,width: w!-50, decoration: BoxDecoration(
                color: Colors.indigoAccent.shade100,
                borderRadius: BorderRadius.circular(15),),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children:
                    [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("From" , style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                            Icon(Icons.local_airport, color: Colors.white,),
                            Text("To" , style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                          ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Casablanca", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("New York", style: TextStyle(fontWeight: FontWeight.bold),),
                          ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: const[
                                Text("Casablanca ,Morocco",style: TextStyle(fontSize: 13,height: 1.1),),
                                Text("23:45 ,Thu 15 Oct",style: TextStyle(fontSize: 13,height: 1.1),),
                                Text("terminal",style: TextStyle(fontSize: 13,height: 1.1),),
                              ],),
                            Column(crossAxisAlignment: CrossAxisAlignment.end,
                              children: const[
                                Text("Casablanca ,Morocco",style: TextStyle(fontSize: 13,height: 1.1),),
                                Text("23:45 ,Thu 15 Oct",style: TextStyle(fontSize: 13,height: 1.1),),
                                Text("terminal",style: TextStyle(fontSize: 13,height: 1.1),),
                              ],),
                          ],
                        ),

                      )],),
                )
                ,),
              const SizedBox(height: 15,),

            ],),
        ),
      ),
    );
  }
}
