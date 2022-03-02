
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';


class MyQrCreator extends StatefulWidget {
   final String id ;
   const MyQrCreator({Key? key ,required this.id}) : super(key: key);

  @override
  _MyQrCreatorState createState() => _MyQrCreatorState();
}

class _MyQrCreatorState extends State<MyQrCreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          // Generate QR
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children:   [

            const  SizedBox(height: 20,),
            Container(
                width: MediaQuery.of(context).size.width- 130,
              height: MediaQuery.of(context).size.width- 110,

              decoration: BoxDecoration(color: Colors.indigoAccent.withOpacity(0.4),borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width- 190,
                        height: MediaQuery.of(context).size.width - 200,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: BarcodeWidget(data: widget.id, barcode: Barcode.qrCode(),
                            color: Colors.black87,),
                        ),
                      ),
                    ),
                  const Text("Scan Me ",style: TextStyle(color: Colors.white,fontSize: 25, height: 1, fontWeight: FontWeight.bold),),
                  ],
                ),
            )
          ],
          // Create QR
        ),
      ) ,
    );
  }
}
