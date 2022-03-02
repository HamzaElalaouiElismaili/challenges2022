
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'cte_wallet.dart';


class WalletAppMain extends StatelessWidget {
  const WalletAppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            height: height,
            width: 80,
            color: Color(kNavigationBarColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/wallet.png", height: 30,width: 30,),
                  ),
                  const SizedBox(height: 30,),
                  coustomNavigationBar(),
                  const Spacer(flex: 3,),
                  Container(
                    height: 40,
                    width: 40,
                    child: const Tooltip(message: "Add",child: Icon(Icons.add,color: Colors.white,)),
                    decoration: BoxDecoration(
                        color: Color(kFloatingActionButton),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(offset: const Offset(1,5),color: Color(kFloatingActionButtonShadow),blurRadius: 3)
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: height,
            width: 2,
            color: Color(kDividerColor),
          ),
          Container(
            height: height,
            width: width * 0.2+10,
            color: Color(kNavigationBarColor),
            child: Column(
              children:
              [
                infoProfile(),
                const SizedBox(height: 20,),
                myListTile(bgColor:  const Color(0xfffff0e7),title: "Goals", icon: const Icon(Icons.map, color: Color(0xfffd7a36),)),
                myListTile(bgColor: const Color(0xffeceaff) ,title: "Monthly Plane", icon: const Icon(Icons.calendar_today_rounded,color: Color(0xff876dfc),)),
                myListTile(bgColor: const Color(0xffe5f6fe) ,title: "Settings", icon: const Icon(Icons.settings_outlined,color: Color(0xff3bc1fd),)),
                chart(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("    Today"),
                        money(icon: const Icon(Icons.local_taxi,color: Colors.white,),color: const Color(0xff3629b7), title: "Taxi", subtitle: "Successfully", money: "\$-1234"),
                        const SizedBox(height: 25,),
                        const Text("    Yesterday"),
                        const SizedBox(height: 10,),
                        money(icon: const Icon(Icons.school,color: Colors.white,),color: const Color(0xffff4268), title: "School", subtitle: "Successfully", money: "\$-1234"),
                        money(icon: const Icon(Icons.electrical_services_rounded,color: Colors.white,),color: const Color(0xff0890fe), title: "Electrical", subtitle: "Unsuccessfully", money: "\$-1234"),
                        money(icon: const Icon(Icons.local_taxi,color: Colors.white,),color: const Color(0xff3629b7), title: "Taxi", subtitle: "Successfully", money: "\$-1234"),
                        money(icon: const Icon(Icons.electrical_services_rounded,color: Colors.white,),color: const Color(0xff0890fe), title: "Electrical", subtitle: "Unsuccessfully", money: "\$-1234"),
                        money(icon: const Icon(Icons.electrical_services_rounded,color: Colors.white,),color: const Color(0xff0890fe), title: "Electrical", subtitle: "Unsuccessfully", money: "\$-1234"),
                        const SizedBox(height: 10,),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("Welcome Back Hamza",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          cards(icon: const Icon(Icons.filter), title: "Filter"),
                          cards(icon: const Icon(Icons.filter), title: "Filter"),
                          cards(icon: const Icon(Icons.filter), title: "Filter"),
                          cards(icon: const Icon(Icons.filter), title: "Filter"),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical:  15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              test(icon: const Icon(Icons.transform_outlined, color: Color(0xff1f57af),), color: const Color(0xffe0e6f2), title: "Wifi network", subtitle: "\$0.0"),
                              test(icon: const Icon(Icons.network_cell , color: Color(0xff477e12),), color: const Color(0xffecf2e8), title: "Cell network", subtitle: "\$4332")
                            ],
                          ),
                          const SizedBox(width: 120,),
                          Column(
                            children: [
                              test(icon: const Icon(Icons.network_wifi, color: Color(0xfff3672d) ,), color:const Color(0xfffeece7), title: "Wifi network", subtitle: "\$0.0"),
                              test(icon: const Icon(Icons.grid_goldenratio, color: Color(0xff614dc0),), color: const Color(0xffeeecf7), title: "Cell network", subtitle: "\$4332")
                            ],
                          ),

                        ],),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: width*0.2 +100,
            color: Colors.brown,
          )


        ],
      ),
    );
  }
}


Widget coustomNavigationBar() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(onPressed: (){}, icon: const Icon(Icons.dashboard,color: Colors.black54,size: 25,)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(onPressed: (){}, icon: const Icon(Icons.stairs_rounded,color: Colors.black54,size: 25,)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(onPressed: (){}, icon: const Icon(Icons.star,color: Colors.black54,size: 25,)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(onPressed: (){}, icon: const Icon(Icons.delete_sharp,color: Colors.black54,size: 25,)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(onPressed: (){}, icon: const Icon(Icons.call_to_action,color: Colors.black54,size: 25,)),
      ),
    ],
  );
}
Widget infoProfile() {
  return Padding(
    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
    child: Row(
      children: [
        CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 2.0,
          animation: true,
          percent: 0.7,
          center:  CircleAvatar(backgroundImage: AssetImage(me),radius: 20,),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor:  Color(kCircularPercentIndicator),
          backgroundColor: Color(kNavigationBarColor),
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  const [
            SizedBox(
              width: 120,
              child: Text("Hamza EL ALAOUI EL ISMAILI",overflow: TextOverflow.ellipsis,style: TextStyle(height: 1,color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 5,),
            SizedBox(
              width:120,
              child: Text("Morocco ,El Jadida",overflow: TextOverflow.ellipsis,style:  TextStyle(color: Colors.grey,height: 1),),
            ),
          ],)
      ],
    ),
  );

}
Widget myListTile({ required String title, required Widget icon, required Color bgColor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
    child: ListTile(
      //
        leading: CircleAvatar(radius: 25,backgroundColor : bgColor,child: icon,),
        title:  Text(title),
        trailing: SizedBox(
          height: 50,
          width: 50,
          child: ElevatedButton(onPressed: (){}, child:  const Center(child: Icon(Icons.arrow_forward_ios,color: Colors.black,)),style: ElevatedButton.styleFrom(
              primary: const Color(0xfffafbff),
              shadowColor: const Color(0xffeef1f8),
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          ),),
        )
    ),
  );
}

Widget chart() {



  return Container(
    color: Colors.white,
    height: 100,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Activity Graph"),
            Text("\$ 1223"),


          ],
        ),

      ],
    ),
  );
}

Widget money({required Widget icon,required Color color, required String title,required String subtitle, required String money}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: SizedBox(height: 40,child: ListTile(leading: Container(height:35,width:35, decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(6)),child: icon),title: Text(title),subtitle: Text(subtitle),trailing: Text(money),)),
  );
}

Widget cards({required Widget icon , required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Card(
      elevation: 20,
      shadowColor: const Color(0xffe3e7f2),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            icon,
            const SizedBox(height: 30,),
            Text(title),
            const Spacer(),
          ],
        ),
      ),
    ),
  );
}

Widget test({required Widget icon ,required Color color, required String title, required String subtitle}) {

  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Container(height: 60,width: 60, child: icon, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey , fontSize: 13, fontWeight: FontWeight.bold),),
            const SizedBox(height: 6,),
            Text(subtitle, style: const TextStyle(color: Colors.black , fontSize: 18, fontWeight: FontWeight.bold),)

          ],
        )
      ],
    ),
  );
}