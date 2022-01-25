import 'package:challenges2022/Modeles/user_model.dart';
import 'package:challenges2022/Modules/MainPage/HomePage/homepage.dart';
import 'package:challenges2022/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/Modules/Profile_screen/profile_cubit.dart';
import 'package:challenges2022/Modules/Profile_screen/profile_states.dart';
import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/shared/Component/appwidgets.dart';
import 'package:challenges2022/shared/Component/loginAndregisterWidgets/loginandregisterwidgets.dart';
import 'package:challenges2022/shared/Styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CompleteInfo extends StatelessWidget {

  final TextEditingController upEmailController = TextEditingController(text: userModel.email);
  final TextEditingController upAddressController = TextEditingController(text: userModel.address);
  final TextEditingController upFullNameController = TextEditingController(text: userModel.fullname);
  final TextEditingController upDateController = TextEditingController(text: userModel.birthday);
  final TextEditingController upPhoneController = TextEditingController(text: userModel.phone);

  CompleteInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
        listener: (context,state) {},
      builder:(context,state)
      {
        var cubit = Appcubit.get(context);
        return Scaffold(
          appBar: AppBar(title: const Text("please Complete Info"),),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 150,
                      width: 250,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: FileImage(userModel.file! ,scale: 0.5 ),
                            backgroundColor: Colors.grey,
                            radius: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 70.5,top:18),
                              child: SizedBox(
                                height: 70,
                                width: 60,
                                child: Stack(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children:
                                    [
                                      const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 15.5,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 31.0, left:11.5),
                                        child: IconButton(onPressed: ()
                                          {
                                            cubit.getCoverImage();
                                          }, icon: const Icon(Icons.camera,size: 30,color: Colors.black,)),
                                      )

                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: upFullNameController,
                        decoration: const InputDecoration(
                          filled: true,
                          labelText: "Full Name",
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: upDateController,
                        decoration: const InputDecoration(
                          filled: true,
                          labelText: "BirthDay",
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now())
                              .then((value) {
                            upDateController.text =
                                DateFormat.yMd().format(value!);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: upPhoneController,
                        decoration: const InputDecoration(
                          filled: true,
                          labelText: "Phone",
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: upEmailController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: upAddressController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Address",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    completeInfoButton(textButton: "UPDATE",functionPressing: ()
                    {
                      if(upAddressController.text.isNotEmpty ||upEmailController.text.isNotEmpty ||upPhoneController.text.isNotEmpty  || upFullNameController.text.isNotEmpty)
                      {
                        cubit.update(
                          listFriends: userModel.listFriends!,
                          profileImage: userModel.profileImage!,
                            upaddr: upAddressController.text,
                            upemail: upEmailController.text.toLowerCase().trim(),
                            upphone: upPhoneController.text,
                            upbirthDay: upDateController.text,
                            upfullname: upFullNameController.text);
                        goToReplace(context, HomePage());
                      }
                     else if(upAddressController.text.isEmpty || upEmailController.text.isEmpty ||upPhoneController.text.isEmpty  || upFullNameController.text.isEmpty)
                        {
                          customAlertDialog(context, title: "title", errorType: "errorType", alertDialogFunction: ()=> goBackMaybe(context), textButton: "Close",);
                        } else
                     {
                       customAlertDialog(context, title: "Connection !", errorType: "Connection Error", alertDialogFunction: ()=> goBackMaybe(context), textButton: "Close",);
                     }

                     }, styleButton:  completeInfoButtonStyle)
                  ],
                ),
              ),
            ),
          ),
        );
      } );
  }
}
