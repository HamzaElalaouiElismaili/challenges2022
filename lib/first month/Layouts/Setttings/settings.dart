
import 'package:challenges2022/first%20month/Layouts/Profile_screen/profile_ui.dart';
import 'package:challenges2022/first%20month/Localization/localization.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Settings extends StatelessWidget {
   Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
        listener: (context ,state) {},
        builder: (context , state)
        {
          var cubit = Appcubit.get(context);
          return Scaffold(
            appBar: AppBar( elevation: 0,backgroundColor:Colors.indigoAccent[100] ,title:   Text("${getLang(context , "settings")}"),),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.indigoAccent.shade100,width: 1, ),
                          borderRadius: const BorderRadius.all(Radius.circular(5),
                          )),

                      child: ListTile(onTap: ()
                      {
                        goTo(context,ProfileSetting());
                      },
                        leading:   Text("${getLang(context , "profilesetting")}"),
                        trailing: const Icon(Icons.settings),),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.indigoAccent.shade100,width: 1, ),
                          borderRadius: const BorderRadius.all(Radius.circular(5),)),
                      child: Padding(
                        padding: const  EdgeInsets.only(left: 40 ,right: 20),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: cubit.langValue,
                          items:
                          cubit.langList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue)
                          {
                            cubit.langValue = newValue!;
                            cubit.settingLang(context);

                          },
                          underline: Container(),
                          // icon: DropdownIcon,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
