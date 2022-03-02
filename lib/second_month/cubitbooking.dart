import 'dart:ui';

import 'package:challenges2022/second_month/detailesinfo.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookingstates.dart';
import 'bottomsheetmodel.dart';

class BookingAppCubit extends Cubit<BookingAppStates> {
  BookingAppCubit() : super(Appinitialstate());

  static BookingAppCubit get(context) => BlocProvider.of(context);

  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  int adultePerson = 0;
  int boysPerson = 0;
  int roomsNumber = 0;
  double total = 0;

  Future bookingList(context,
      {required TextEditingController registerEmailController}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 350,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              controller: registerEmailController,
                              onTap: () => {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime.now())
                                    .then((value) {
                                  registerEmailController.text =
                                      DateFormat.yMd().format(value!);
                                })
                              },
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(height: 40, child: TextFormField()),
                      ),
                    ),
                  ],
                ),
                rowBtton(
                    data: "Adult",
                    eventnumber: adultePerson,
                    onAdd: () {
                      adultePerson++;
                      emit(Increment());
                      print(adultePerson);
                    },
                    onminase: () {
                      adultePerson--;
                      emit(Dincrement());
                      print(adultePerson);
                    }),
                rowBtton(
                    data: "Childrens",
                    eventnumber: boysPerson,
                    onAdd: () {
                      boysPerson++;
                      emit(Increment());
                      print(boysPerson);
                    },
                    onminase: () {
                      boysPerson--;
                      emit(Dincrement());
                      print(boysPerson);
                    }),
                rowBtton(
                    data: "Rooms",
                    eventnumber: roomsNumber,
                    onAdd: () {
                      roomsNumber++;
                      emit(Increment());
                      print(roomsNumber);
                    },
                    onminase: () {
                      roomsNumber--;
                      emit(Dincrement());
                      print(roomsNumber);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  handleFABPressed(
    context, {
    required TextEditingController start,
    required TextEditingController end,
  }) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          child: Container(
            height: 370,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: start,
                                onTap: () => {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2070))
                                      .then((value) {
                                    start.text =
                                        DateFormat.yMd().format(value!);
                                  })
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Ex: 09/05/1998",
                                    suffix: Icon(
                                      Icons.calendar_today_rounded,
                                      size: 20,
                                      color: Colors.blue.shade300,
                                    )),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: end,

                                onTap: () => {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2070))
                                      .then((value) {
                                    end.text = DateFormat.yMd().format(value!);
                                  })
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        "Ex: ${DateTime.now().add(Duration(days: 5))}",
                                    suffix: Icon(
                                      Icons.calendar_today_rounded,
                                      size: 20,
                                      color: Colors.blue.shade300,
                                    )),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: rowBtton(
                      data: "Adult",
                      eventnumber: adultePerson,
                      onAdd: () {
                        if (adultePerson <= 100) {
                          emit(Increment());
                          adultePerson++;

                          print(total);
                          emit(Increment());
                          print(adultePerson);
                        }
                        emit(Increment());
                      },
                      onminase: () {
                        if (adultePerson > 0) {
                          emit(Dincrement());
                          adultePerson--;
                          print(total);
                          emit(Dincrement());
                          print(adultePerson);
                        }
                        emit(Dincrement());
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: rowBtton(
                      data: "Childrens",
                      eventnumber: boysPerson,
                      onAdd: () {
                        if (boysPerson <= 100) {
                          emit(Increment());
                          boysPerson++;
                          emit(Increment());
                          print(boysPerson);
                        }
                        emit(Increment());
                      },
                      onminase: () {
                        emit(Dincrement());

                        if (boysPerson > 0) {
                          emit(Dincrement());
                          boysPerson--;
                          emit(Dincrement());
                          print(boysPerson);
                        }
                        emit(Dincrement());
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: rowBtton(
                      data: "Rooms",
                      eventnumber: roomsNumber,
                      onAdd: () {
                        emit(Increment());
                        if (roomsNumber <= 100) {
                          emit(Increment());
                          roomsNumber++;
                          emit(Increment());
                          print(roomsNumber);
                        }
                      },
                      onminase: () {
                        emit(Dincrement());

                        if (roomsNumber > 0) {
                          emit(Dincrement());
                          roomsNumber--;
                          emit(Dincrement());
                          print(roomsNumber);
                        }
                      }),
                ),
                const Spacer(),
                Text(
                  "${total + adultePerson * 100 + boysPerson * 50 + roomsNumber * 80}\$",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: bookingButton(bookNow: () {
                    adultePerson = 0;
                    boysPerson = 0;
                    roomsNumber = 0;
                    startController.clear();
                    endController.clear();
                    emit(Dincrement());
                  }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
