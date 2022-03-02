
import 'package:challenges2022/first%20month/Layouts/Chats/Chats.dart';
import 'package:challenges2022/first%20month/Layouts/SearchLayout/searchdelegate.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/shared/Component/HomeScreenWidgets/homescreenwidgets.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/SearchWidgets/searchwidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../appcubit.dart';
import '../main_cubit_controller.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit, Appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Appcubit.get(context);
          Size size = MediaQuery
              .of(context)
              .size;
          cubit.height = size.height;
          cubit.width = size.width;
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInCirc,
            top: cubit.isDrawer ? 0 : 0.1 * cubit.height!,
            bottom: cubit.isDrawer ? 0 : 0.17 * cubit.width!,
            left: cubit.isDrawer ? 0 : 0.7 * cubit.width!,
            // this for drawer2  left:  isDrawer ? 0: 0.12* width!,
            right: cubit.isDrawer ? 0 : -0.6 * cubit.width!,

            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(cubit.myRadius),
                  ),
                  child: Column(
                    children: [
                      customAppBar(titlePage: "Messages",
                          menuPressed: () => cubit.openDrawer()),
                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: searchBar(onTab: () =>
                                    goTo(context, const FriendSearch()),),),
                              Expanded(
                                child: StreamBuilder<
                                    QuerySnapshot<Map<String, dynamic>>>(
                                    stream: FirebaseFirestore.instance
                                        .collection("chats")
                                        .doc(userModel.uId)
                                        .collection("messages")
                                        .where(
                                        "senderId", isEqualTo: userModel.uId)
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot<
                                            Map<String, dynamic>>> snapshot) {
                                      if (snapshot.hasData) {
                                        List listUid = [];
                                        Map<String, dynamic> myChats = {};
                                        List<Widget> listOfMyChats = [];
                                        final docs = snapshot.data!.docs
                                            .toList();
                                        if (docs.isNotEmpty) {
                                          listOfMyChats = [
                                            ...docs.map((e) {
                                              myChats = e.data();
                                              if (!listUid.contains(
                                                  myChats["receiverId"])) {
                                                listUid.add(
                                                    myChats["receiverId"]);
                                                return StreamBuilder<
                                                    DocumentSnapshot<
                                                        Map<String, dynamic>>>(
                                                    stream: FirebaseFirestore
                                                        .instance.collection(
                                                        "users")
                                                        .doc(
                                                        myChats["receiverId"])
                                                        .snapshots(),
                                                    builder: (context,
                                                        AsyncSnapshot<
                                                            DocumentSnapshot<
                                                                Map<
                                                                    String,
                                                                    dynamic>>> snapshout2) {
                                                      if (snapshout2.hasData) {
                                                        final data2 = snapshout2
                                                            .data!.data();
                                                        return Padding(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 10,
                                                              vertical: 5),
                                                          child: goToChat(
                                                              context: context,
                                                              data: data2!,
                                                              imageProfile: data2["profileImage"],
                                                              fullName: data2["fullname"]),
                                                        );
                                                      }
                                                      return const SizedBox();
                                                    }
                                                );
                                              }
                                              return const SizedBox();
                                            })
                                          ];

                                          if (snapshot.hasData) {
                                            return ListView.builder(
                                                physics: const BouncingScrollPhysics(),
                                                itemCount: listOfMyChats.length,
                                                itemBuilder: (context, index) {
                                                  // var listOfMyChatsReversed = listOfMyChats.reversed.toList();
                                                  return listOfMyChats[index];
                                                });
                                          }
                                        }

                                        return const Center(child: Text(
                                          "Welcome To The App ",
                                          style: TextStyle(fontSize: 30),));
                                      }
                                      return Text("No Data");
                                    }

                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }



}

Widget goToChat({ required BuildContext context,required String imageProfile, required String fullName ,required Map<String, dynamic> data}) {
  return GestureDetector(
    onTap: ()=> goTo(context, ChatDetailsScreen(friend: data,)),
    child: Container(
      decoration:BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(3),border: Border.all(color: Colors.indigoAccent.withAlpha(100),width: 1)),
      height: 70,
      child: Center(
        child: ListTile(
          leading: GestureDetector(
              onTap: ()
              {
                alertInfo(context,imageProfile: imageProfile,fullName: fullName,data: data);
              },
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(imageProfile),
              )),
          title: Text(fullName),
        ),
      ),
    ),
  );
}