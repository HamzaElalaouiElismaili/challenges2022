import 'package:challenges2022/Localization/localization.dart';
import 'package:challenges2022/Modules/login_screen/login_screen_ui.dart';
import 'package:challenges2022/Modules/register_screen/register_cubit.dart';
import 'package:challenges2022/Modules/register_screen/register_states.dart';
import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:challenges2022/shared/Component/loginAndregisterWidgets/loginandregisterwidgets.dart';
import 'package:challenges2022/shared/Styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class RegistrationPage extends StatelessWidget {

  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();
  final TextEditingController registerFullNameController = TextEditingController();
  final TextEditingController registerDateController = TextEditingController();
  final TextEditingController registerPhoneController = TextEditingController();

  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state)
            {
              if (state is RegisterErrorState)
              {
                RegisterCubit.get(context).isError = true;
                if(state.error == errorPasswordWrong)
                {
                  errorType ="${getLang(context , "passwordIncorrect")}";
                }
                else if(state.error == errorEmailFormat)
                {
                  errorType ="${getLang(context , "notEmail")}";
                }
                else if(state.error == errorUserNotFound )
                {
                  errorType ="${getLang(context , "notAccount")}";
                }
                else if(state.error == errorNetworkFailed)
                {
                  errorType ="${getLang(context , "noNetwork")}";
                }
                else if(state.error == errorDataEmpty)
                {
                  errorType ="${getLang(context , "noDataEntered")}";
                }
                else if(state.error == errorEmailUsed)
                {
                  errorType ="${getLang(context , "emailExist")}";
                }
                else
                {
                  errorType = "Error Try Again";
                }
              }
              if (state is CreateUserSuccessState)  goTo(context, LoginPage());
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: SingleChildScrollView(
                    physics:const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0,left: 30),
                      child: Form(
                        key: formKeyRegister,
                        child: SafeArea(
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(logoMoroccoNow)),
                              Text(
                                '${getLang(context , "signupNow")}',
                                style:
                                const TextStyle(color: Colors.black, fontSize: 30),),


                              RegisterCubit.get(context).isError ?
                              errorBar(context: context,errorType: errorType,onTap: ()
                              {
                                debugPrint("remove it");
                                RegisterCubit.get(context).removeErrorBar();
                              }): const SizedBox(height: 20,),

                              Padding(
                                padding: const EdgeInsets.only(top: registerTopPadding),
                                child: myFormField(
                                  controller: registerFullNameController,
                                  hintText:"${getLang(context , "fullName")}" ,
                                  type: TextInputType.name,
                                  suffixIcon: Icons.person,
                                  validate: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "${getLang(context , "emptyFailed")}";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:registerTopPadding),
                                child: myFormField(
                                  controller: registerDateController,
                                  hintText: "${getLang(context , "Birthday")}",
                                  type: TextInputType.datetime,
                                  suffixIcon: Icons.date_range,
                                  onTap: () => {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime.now())
                                        .then((value) {
                                      registerDateController.text =
                                          DateFormat.yMd().format(value!);
                                    })
                                  },
                                  validate: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "${getLang(context , "emptyFailed")}";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: registerTopPadding),
                                child: myFormField(
                                  controller: registerPhoneController,
                                  validate: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "${getLang(context , "emptyFailed")}";
                                    }
                                  },
                                  type: TextInputType.phone,
                                  suffixIcon: Icons.phone,
                                  hintText: "${getLang(context , "phone")}"
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: registerTopPadding),
                                child: myFormField(
                                  controller: registerEmailController,
                                  validate: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "${getLang(context , "emptyFailed")}";
                                    }
                                  },
                                  type: TextInputType.emailAddress,
                                  suffixIcon: Icons.email_outlined,
                                  hintText: "${getLang(context , "email")}"
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: registerTopPadding),
                                child: myFormField(
                                    controller: registerPasswordController,
                                    validate: (String? value) {
                                      if (value == null || value.isEmpty)
                                      {
                                        return "${getLang(context , "emptyFailed")}";
                                      }
                                    },
                                    type: TextInputType.text,
                                    hintText: "${getLang(context , "password")}",
                                    isPass: RegisterCubit.get(context).isPassword,
                                    suffixIcon: RegisterCubit.get(context).suffix,
                                    suffixPressed: () {
                                      RegisterCubit.get(context)
                                          .changePasswordVisibility();
                                    }),
                              ),
                              state is RegisterLoadingState
                                  ? const Center(
                                   child: CircularProgressIndicator())
                                  : Padding(
                                     padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                                     child: registerButton(textButton: "${getLang(context , "signup")}",functionPressing:  () {
                                  if (formKeyRegister.currentState?.validate() != null)
                                  {
                                    RegisterCubit.get(context).register(
                                        email: registerEmailController.text.trim().toLowerCase(),
                                        phone: registerPhoneController.text.trim(),
                                        password: registerPasswordController.text,
                                        fullname: registerFullNameController.text.trim().toLowerCase(),
                                        birthday: registerDateController.text.trim());
                                  }
                                },styleButton:  registerButtonStyle),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}