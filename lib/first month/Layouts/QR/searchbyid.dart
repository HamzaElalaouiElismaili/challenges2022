
import 'package:challenges2022/first%20month/Layouts/followers/followers.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/main_cubit_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../friendLayout.dart';


class SearchByuId extends StatefulWidget {
  final String ID ;
  const SearchByuId({Key? key ,required this.ID}) : super(key: key);

  @override
  _SearchByuIdState createState() => _SearchByuIdState();
}

class _SearchByuIdState extends State<SearchByuId> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit = Appcubit.get(context);
          return Scaffold(
            body: SafeArea(

              child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: getStreamByQR(),
                builder: (context, snapshot)
                {
                  if(snapshot.connectionState == ConnectionState.done)
                  {
                    if(snapshot.hasData)
                    {
                      if(snapshot.data!.data() != null)
                      {
                        return Column(
                          children: [
                            appBarFriend(context, id: snapshot.data!.data()!["uId"]),
                            Column(
                              children: [
                                Container(
                                  height: 210,
                                  width: double.maxFinite,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10)),
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            height: 90,
                                            width: 90,
                                            child: Image.network(snapshot.data!.data()!["profileImage"]),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data!.data()!["fullname"].toUpperCase(),
                                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(left: 2.0, right: 2),
                                                  child: Text(
                                                    snapshot.data!.data()!["address"],
                                                    style: const TextStyle(),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(left: 2.0, right: 2),
                                                  child: Text(
                                                    snapshot.data!.data()!["phone"],
                                                    style: const TextStyle(height: 1),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //bottomFriendButton(),
                                        ],
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(snapshot.data!.data()!["bio"]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 116,
                                  width: double.maxFinite,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        if(userModel.followers!.contains(snapshot.data!.data()!["uId"]) && userModel.uId != snapshot.data!.data()!["uId"])
                                          InkWell(
                                            onTap: ()
                                            {
                                              var id = userModel.uId!;
                                              cubit.removeFriend(friendId: snapshot.data!.data()!["uId"]);
                                              cubit.removeFollowers(friendId: id,list: snapshot.data!.data()!["listFriends"]);
                                              cubit.update(
                                                token: userModel.token!,
                                                  upemail: userModel.email!,
                                                  upphone: userModel.phone!,
                                                  upbirthDay: userModel.birthday!,
                                                  upfullname: userModel.fullname!,
                                                  upaddr: userModel.address!,
                                                  profileImage: userModel.profileImage!,
                                                  listFriends: userModel.listFriends!,
                                                  followers: userModel.followers!,
                                                  bio: userModel.bio!);
                                              cubit.addUpdate(friendUid: snapshot.data!.data()!["uId"] ,list: snapshot.data!.data()!["listFriends"]);
                                            },
                                            child: Card(
                                              color: Colors.indigoAccent[100],
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: const [
                                                    Icon(Icons.person_remove),
                                                    Text("Add"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                        Card(
                                          color: Colors.indigoAccent[100],
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text("${snapshot.data!.data()!["listFriends"]!.length}"),
                                                const Text("Followers"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: Colors.indigoAccent[100],
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text("${snapshot.data!.data()!["followers"]!.length}"),
                                                const Text("Following"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if(!userModel.followers!.contains(snapshot.data!.data()!["uId"]) && userModel.uId != snapshot.data!.data()!["uId"])
                                          InkWell(
                                            onTap: ()
                                            {
                                              var id = userModel.uId!;
                                              cubit.addNewFriend(friendId: snapshot.data!.data()!["uId"]);
                                              cubit.addNewFollowers(friendId: id,list: snapshot.data!.data()!["listFriends"]);
                                              cubit.update(
                                                token: userModel.token!,
                                                  upemail: userModel.email!,
                                                  upphone: userModel.phone!,
                                                  upbirthDay: userModel.birthday!,
                                                  upfullname: userModel.fullname!,
                                                  upaddr: userModel.address!,
                                                  profileImage: userModel.profileImage!,
                                                  listFriends: userModel.listFriends!,
                                                  followers: userModel.followers!,
                                                  bio: userModel.bio!);
                                              cubit.addUpdate(friendUid: snapshot.data!.data()!["uId"] ,list: snapshot.data!.data()!["listFriends"]);
                                              cubit.getMyInfo();
                                            },
                                            child: Card(
                                              color: Colors.indigoAccent[100],
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: const [
                                                    Icon(Icons.person_add),
                                                    Text("Add"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );

                      }

                      return const Center(child: Text("No User"));

                    }
                  }
                  return const Center(child:   CircularProgressIndicator());
                },
              ),
            ),
          );
        }
    );
  }
}

Future<DocumentSnapshot<Map<String, dynamic>>> getStreamByQR()  async {
   String id  = "79VT4E5acObYS4SR3VDypU5CRzq2";
 try
 {

   id  = await FlutterBarcodeScanner.scanBarcode("#2A99CF", "cancel", true, ScanMode.QR);
 }catch(e)
 {
    id = "79VT4E5acObYS4SR3VDypU5CRzq2";
   print(e);

 }

  return  await FirebaseFirestore.instance.collection("users").doc(id).get();
}
