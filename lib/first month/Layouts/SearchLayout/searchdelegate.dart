
import 'package:challenges2022/first%20month/Layouts/QR/searchbyid.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/SearchWidgets/searchwidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FriendSearch extends StatefulWidget {
  const FriendSearch({Key? key}) : super(key: key);

  @override
  State<FriendSearch> createState() => _FriendSearchState();
}

class _FriendSearchState extends State<FriendSearch> {
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection("users");

  TextEditingController searchController = TextEditingController();

  String query = "";



  @override
  Widget build(BuildContext context) {
    continer =  true;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Row(
                    children: [
                      if(searchController.text.isEmpty)
                        backSearchButton(goBack: ()=>goBackMaybe(context)),
                      if(searchController.text.isNotEmpty)
                        clearSearchBar(clear:()
                        {
                          searchController.clear();
                          setState(() => query = "");
                        }),
                      Expanded(
                        child: TextFormField(
                          textInputAction: TextInputAction.search,
                          autofocus: true,
                          controller: searchController,
                          onChanged: (String val)
                          {
                            setState(() {
                              query = val.toLowerCase().trim();
                            });
                          },

                          decoration:  const InputDecoration(border: InputBorder.none ,hintText:  "Search",suffixIcon: Icon(Icons.search)),
                        ),
                      ),

                      if(searchController.text.isEmpty)// Create uId  and passing as value id
                        searchById(searchById: ()=> goTo(context, const SearchByuId(ID:"1CCRmEFauLXLSyJlKOQu1mQFdOF2")))

                    ],
                  ),
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(color:Colors.grey[200],borderRadius: BorderRadius.circular(5)),
                ),
              ),

               StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("users").snapshots().where((QuerySnapshot<Object?> event)  =>  event.toString().toLowerCase().contains(query.toLowerCase())),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {

                    if(snapshot.hasData)
                    {
                      final docs = snapshot.data!.docs.toList();

                      if(searchController.text.trim().isNotEmpty)  {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: docs!.length,
                            itemBuilder: (context, index) {
                              final data = docs[index].data();
                                if(data["fullname"].toLowerCase().contains(query.toLowerCase())){
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical:  5.0 ,horizontal: 20),
                                    child: suggestionsFriends(
                                        context: context,
                                        data: data,
                                        imageProfile: data["profileImage"],
                                        fullName: data["fullname"]),
                                  );
                                }

                              {
                                print(index);
                                return   const Center(child:  SizedBox(height: 1,width: 20,child: Text(""),));
                              }
                            }
                        );
                      }
                    }
                      return const Padding(
                        padding:  EdgeInsets.symmetric(vertical:50.0),
                        child:  Text("Get New Friends"),
                      );

                  })
            ],
          ),
        ),
      ),
    );
  }
}

getStream(query)
{
  return  FirebaseFirestore.instance.collection("users").snapshots().where((QuerySnapshot<Object?> event)  =>  event.toString().toLowerCase().contains(query.toLowerCase()));
}




Widget searchById({required void Function() searchById})
{

  return  InkWell(onTap:searchById,
    child: Container( height: 50,
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(Icons.qr_code ,),
      ),
      ),
  );

}