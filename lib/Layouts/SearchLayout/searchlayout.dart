import 'package:challenges2022/Layouts/SearchLayout/searchdelegate.dart';
import 'package:challenges2022/Network/local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(child:
                 TextFormField(
                  onTap: ()
                  {
                    },
                  autofocus: true,
                  decoration: const InputDecoration(
                      prefix:SizedBox(width: 20,),
                      hintText: "Search",
                      suffixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.white, width: .5),
                      ),
                      border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 5),borderRadius: BorderRadius.all(const Radius.circular(30)))),
                ),width: double.maxFinite,height: 60,decoration: BoxDecoration(color: Colors.red[200],borderRadius: BorderRadius.circular(30)),),
              ),
              ListView.separated(
                itemCount: 100,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 10,),
                itemBuilder: (context,index)=> const ListTile(leading: CircleAvatar(radius: 20,backgroundColor: Colors.blueAccent , ),title: Text("Testing"),),

              )
            ],
          ),
        ),
      ),

    );
  }
}
