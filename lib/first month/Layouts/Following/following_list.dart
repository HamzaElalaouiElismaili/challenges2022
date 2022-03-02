import 'package:challenges2022/first%20month/Layouts/Chats/Chats.dart';
import 'package:challenges2022/first%20month/Layouts/followers/followers.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class FollowingListBuilder extends StatefulWidget {
  const FollowingListBuilder({Key? key}) : super(key: key);

  @override
  _FollowingListBuilderState createState() => _FollowingListBuilderState();
}

class _FollowingListBuilderState extends State<FollowingListBuilder> {
  late  Future<DocumentSnapshot<Map<String, dynamic>>> listFollowing;
  @override
  void initState() {
    super.initState();

    for (var element in userModel.followers!) {
      listFollowing =  FirebaseFirestore.instance.collection("users").doc(element).get();
    }

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('users').get().then((value)=> value),
      builder: (context,AsyncSnapshot snapshot)
      {

        if(snapshot.connectionState == ConnectionState.done)
        {
          final docs = snapshot.data!.docs.toList();

          if(snapshot.hasData)
          {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
                itemCount: docs!.length,
                separatorBuilder: (context,index)=> const SizedBox(height: 3,),
                itemBuilder: (context,index)
                {
                  var data = docs[index].data();
                  print(data);
                  if(userModel.followers!.contains(docs[index].data()["uId"])) {
                    return myFollowers(
                        context: context,
                        data: data,
                        imageProfile: data["profileImage"],
                        fullName: data["fullname"]);
                  }  return const Center(child: SizedBox(),);

                });
          }
          return const Center(child: CircularProgressIndicator(),);

        }
        return const Center(child: CircularProgressIndicator(),);
      },



    );
  }
}



Widget myFollowers({required BuildContext context,required String imageProfile, required String fullName ,required Map<String, dynamic> data}) {
  return GestureDetector(
    onTap: ()=> goTo(context, MyFollowers(friend: data,)),
    child: Container(
      decoration:BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(3),border: Border.all(color: Colors.indigoAccent.withAlpha(100),width: 1)),
      height: 70,
      child: Center(
        child: ListTile(
          trailing: InkWell(onTap: ()
          {
            goTo(context, ChatDetailsScreen(friend: data));
          },
              child: Icon(Icons.message_outlined,color: Colors.indigoAccent[100],)),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(imageProfile),
          ),
          title: Text(fullName),
        ),
      ),
    ),
  );
}