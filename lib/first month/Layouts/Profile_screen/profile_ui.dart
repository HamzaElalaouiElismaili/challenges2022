
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/Component/appwidgets.dart';
import 'package:challenges2022/first%20month/shared/Component/constent/constent.dart';
import 'package:challenges2022/first%20month/shared/Component/loginAndregisterWidgets/loginandregisterwidgets.dart';
import 'package:challenges2022/first%20month/shared/Styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProfileSetting extends StatelessWidget {
  ProfileSetting({Key? key}) : super(key: key);

  final TextEditingController profileEmailController = TextEditingController(text: userModel.email);
  final TextEditingController profileBioController = TextEditingController(text: userModel.bio);
  final TextEditingController profileAddressController = TextEditingController(text: userModel.address);
  final TextEditingController profileFullNameController = TextEditingController(text: userModel.fullname);
  final TextEditingController profileDateController = TextEditingController(text: userModel.birthday);
  final TextEditingController profilePhoneController = TextEditingController(text: userModel.phone);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<Appcubit,Appstates>(
      listener: (context, state) {
        if (state is UpdateSuccessflly)
        {
          customAlertDialog(context, textButton: 'Close', alertDialogFunction: ()
          {
            goBackMaybe(context);
          }, title: 'Successfully', errorType: 'Update has been Successfully');
        }
        if (state is UpdateError) {}
        if (state is ProfileImageUploadErrorState)
        {
          customAlertDialog(context, textButton: 'Close', alertDialogFunction: ()
          {
            goBackMaybe(context);
          }, title: 'Error', errorType: 'Error on  Upload');

        }

        if(state is CoverImagePicckedSuccessState)
        {
          Appcubit.get(context).uploadProfileImage(email: userModel.email,name: userModel.fullname,upbirthDay: userModel.birthday,phone: userModel.phone,upaddr: userModel.address,);
        }
        if(state is UpdateLoading) {}
         if(state is ChangeDrawer) {}


      },
      builder: (context, state) {
        var cubit = Appcubit.get(context);
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.indigoAccent.shade100,title: const Text("Profile Setting"),centerTitle: true, elevation: 0,),
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
                            backgroundImage:  userModel.profileImage == imageProfileDefault ? FileImage(userModel.file! ,scale: 0.5 ): NetworkImage(userModel.profileImage!) as ImageProvider<Object>?,
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
                                      const CircleAvatar(backgroundColor: Colors.white,  radius: 15.5,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 31.0, left:11.5),
                                        child: IconButton(onPressed: ()
                                        {
                                          cubit.getCoverImage();
                                          print("change photo");
                                        }, icon: const Icon(Icons.camera,size: 30,color: Colors.black,)),
                                      )

                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),),
                    if (state is CoverImagePicckedLoadingState || state is UploadingLoadingState) const LinearProgressIndicator(),

                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: profileFullNameController,
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
                        controller: profileDateController,
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
                            profileDateController.text =
                                DateFormat.yMd().format(value!);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: profilePhoneController,
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
                        controller: profileAddressController,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: profileBioController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Bio",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    (state is UpdateLoading)? LinearProgressIndicator():
                    updateProfileButton(textButton: "UPDATE",functionPressing:  ()
                     {
                       cubit.update(
                         token: userModel.token!,
                           bio: profileBioController.text,
                           followers:userModel.followers!,
                           listFriends: userModel.listFriends!,
                           profileImage: userModel.profileImage!,
                          upaddr: profileAddressController.text,
                          upemail: profileEmailController.text.toLowerCase().trim(),
                          upphone: profilePhoneController.text,
                          upbirthDay: profileDateController.text,
                          upfullname: profileFullNameController.text);
                       if(state is UpdateSuccessflly)
                       {
                               cubit.emitAndGetInfo();
                                goBackMaybe(context);
                              }
                            }, styleButton: updateProfileButtonStyle),

        ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}