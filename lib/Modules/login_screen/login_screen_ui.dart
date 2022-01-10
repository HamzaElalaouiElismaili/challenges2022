import 'package:challenges2022/Localization/localization.dart';
import 'package:challenges2022/Modules/register_screen/register_screen_ui.dart';
import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:challenges2022/shared/Component/loginAndregisterWidgets/loginandregisterwidgets.dart';
import 'package:challenges2022/shared/Styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_controller_state.dart';
import 'login_cubit.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LogInCubit()),
        ],
        child: BlocConsumer<LogInCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginErrorState) {}
            if (state is LoginSucsessState)
            {
             // goToReplace(context, const HomeScreen());
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0, left: 30),
                      child: Form(
                        key: formKeyLogin,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset(logoMoroccoNow)),
                             Text(
                              '${getLang(context , "signInNow")}',
                              style:
                                 const TextStyle(color: Colors.black, fontSize: 30),
                            ),
                            const SizedBox(height: 30),
                            myFormField(
                              controller: emailController,
                              validate: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "${getLang(context , "emptyFailed")}";
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.emailAddress,
                              suffixIcon: Icons.email_outlined,
                              hintText: '${getLang(context , "email")}',
                            ),
                            const SizedBox(height: 10),
                            myFormField(
                              suffixpressed: () {
                                LogInCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              onSubmit: (value) {
                                if (formKeyLogin.currentState?.validate() != null) {
                                  LogInCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              controller: passwordController,
                              validate: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "${getLang(context , "emptyFailed")}";
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.text,
                              isPass: LogInCubit.get(context).isPassword,
                              hintText: '${getLang(context , "password")}',
                              suffixIcon: LogInCubit.get(context).suffix,
                            ),
                            const SizedBox(height: 25),
                            state is LoginLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : loginButton(
                                    textButton: "${getLang(context , "login")}",
                                    functionPressing: ()
                                    {
                                      if (formKeyLogin.currentState?.validate() != null) {
                                        LogInCubit.get(context).userLogin(
                                            email: emailController.text.trim().toLowerCase(),
                                            password: passwordController.text);
                                      }
                                    },
                                    styleButton: loginButtonStyle),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Expanded(
                                  child: loginWithXButton(
                                    styleButton: loginWithXButtonStyle,
                                    textButton: "Google",
                                    functionPressing: () {},
                                    pathAsses: logoGoogle,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: loginWithXButton(
                                    styleButton: loginWithXButtonStyle,
                                    textButton: "Apple",
                                    functionPressing: () {},
                                    pathAsses: logoAppel,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 60.0),
                            const Divider(
                              color: Colors.black,
                              height: 2,
                            ),
                            const SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  '${getLang(context , "noAccount")}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () => goTo(context,RegistrationPage(),),
                                    child:  Text(
                                      '${getLang(context , "signup")}' ,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    )),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
