import 'package:challenges2022/first%20month/Layouts/followers/followers.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/first%20month/shared/Component/MessageWidgets/messageswidgets.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/SearchWidgets/searchwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:buildcondition/buildcondition.dart';



class ChatDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> friend;
  ChatDetailsScreen({Key? key, required this.friend,}) : super(key: key);
  TextEditingController messageController = TextEditingController();
  final ItemScrollController sc = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context)
    {
      Appcubit.get(context).getMessages(receiverId: friend["uId"]);
      return BlocConsumer<Appcubit, Appstates>(
        listener: (context, state)
        {
          if (state is SocialSendMessageSuccessState)
          {
            if (Appcubit.get(context).messageimage != null)
            {
              Appcubit.get(context).removeMessageImage();
            }

            sc.scrollTo(
                duration: const  Duration(seconds: 1),
                curve: Curves.easeInOut,
                index: Appcubit.get(context).messages.length);

            messageController.clear();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.indigoAccent.shade100,
              leading: IconButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black)),
              title: Row(
                children: [
                  GestureDetector(
                    onTap: ()
                    {
                      goTo(context, MyFollowers(friend: friend,));
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(friend["profileImage"]),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    friend["fullname"],overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black),
                  )
                ],
              ),
              actions:  [
                InkWell(
                  onTap: ()
                  {
                    joinMeeting(serverUrl:"", roomId: "uidchallenge" ,isCallVoice:true,isVideoCall: true);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.video_call_sharp),
                  ),
                ),
                const SizedBox(width: 1,),
                InkWell(
                  onTap: ()
                  {
                    joinMeeting(serverUrl:"", roomId: "uidchallenge" ,isCallVoice:true,isVideoCall: true);
                  },
                  child: const  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.call),
                  ),
                )
              ],
            ),
            body:
            BuildCondition(
              condition: State is! SocialgetMessageLoadingState,
              fallback: (context) => const Center(child: CircularProgressIndicator()),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [

                      Expanded(
                        child: ScrollablePositionedList.separated(
                          physics: const BouncingScrollPhysics(),
                          itemScrollController: sc,
                          itemBuilder: (context, index)
                          {
                            if (friend["uId"] == Appcubit.get(context).messages[index].senderId)
                            {
                              return bubbleOtherMessage(Appcubit.get(context).messages[index]);

                            }
                            else
                            {
                              return bubbleMyMessage(Appcubit.get(context).messages[index]);
                            }
                          },
                          separatorBuilder: (context, index) => const  SizedBox(height: 10,),
                          itemCount: Appcubit.get(context).messages.length,
                          initialScrollIndex: Appcubit.get(context).messages.length,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      if (Appcubit.get(context).messageimage != null)
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(Appcubit.get(context)
                                          .messageimage!),
                                    ))),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.indigoAccent.shade100,
                              child: IconButton(
                                  iconSize: 16,
                                  onPressed: () {
                                    Appcubit.get(context)
                                        .removeMessageImage();
                                  },
                                  icon: const Icon(Icons.stream)),
                            ),
                          ],
                        ),
                      if (state is SocialCreateMessageImageLoadingState)
                        const Center(child: LinearProgressIndicator()),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.indigoAccent.shade100, width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(

                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLength: 385,
                                          controller: messageController,
                                          decoration:   InputDecoration(
                                            counterStyle: const TextStyle(
                                              height: double.minPositive,
                                            ),
                                            counterText: "",
                                            border: InputBorder.none,
                                            hintText: 'Type your message here',
                                            hintStyle: TextStyle(
                                                height: 1,
                                                color: Colors.indigoAccent.shade100,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: TextButton(
                                          onPressed: ()
                                          {
                                            Appcubit.get(context).getMessageImage();
                                          },
                                          child:  Icon(Icons.image, color: Colors.indigoAccent.withOpacity(0.4),size: 27,),


                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: InkWell(
                                  onTap: ()
                                  {
                                    if (Appcubit.get(context)
                                        .messageimage != null)
                                    {
                                      Appcubit.get(context).uploadMessageImage(
                                          receiverId: friend["uId"],
                                          datetime:
                                          DateTime.now().toString(),
                                          text: messageController.text);

                                      Appcubit.get(context).sendNotify(
                                          title: userModel.fullname!,
                                          body: "send a Image",
                                          id: friend["uId"].toString(),
                                          fcmToken: friend["token"].toString(),
                                          name: friend["fullname"].toString());

                                    } else {
                                      Appcubit.get(context).sendMessage(
                                          receiverId: friend["uId"],
                                          dateTime:
                                          DateTime.now().toString(),
                                          text: messageController.text);

                                      Appcubit.get(context).sendNotify(
                                          title: userModel.fullname!,
                                          body: messageController.text,
                                          id: friend["uId"].toString(),
                                          fcmToken: friend["token"].toString(),
                                          name: friend["fullname"].toString());
                                    }
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.indigoAccent.shade100,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: const  Icon(
                                        Icons.send,
                                        size: 20,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      );
    });
  }

}
