
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/shared.dart';
import 'package:noteapp/state.dart';

import 'Add.dart';
import 'Home.dart';

class NoteC extends Bloc<NoteC, cubitState> {
  NoteC() :super(Initialstate());

  static NoteC get(context) => BlocProvider.of(context);
  int i = 0;

  void changetoback() {
    Current = 0;
    emit(Successbackatate());
  }
  List<MaterialColor> C = [Colors.green,Colors.amber,Colors.cyan,Colors.teal,Colors.lightGreen] ;

  void Changee(index) {
    if (check[index] == "0") {
      check[index] = "1";
      emit(Sucesschange());
    } else
      check[index] = "0";
    emit(Sucesschange());
  }

  List<String> Notes = []; /////////////
  List<String> check = []; /////////////
  void nn() {
    emit(Remove());
  }
  void getdatafrmshared() {
    emit(getdatafrmshare());
  }
  void addelement(element) {
    Notes.add(element);
    emit(Successaddstate());
  }
  int Current = 0;
  List<Widget> page = [Homepage(), Addnote()];
  void Change(index) {
    Current = index;
    emit(Successstate());
  }
  void setshared() {
    CacheHelper.sharedPrefrences?.setBool("amr", true);
    CacheHelper.sharedPrefrences?.setStringList("Noteshared", Notes);
    CacheHelper.sharedPrefrences?.setStringList("checkshared", check);
    print("setshared successssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
  }
  void getshared() {
    print(CacheHelper.getData(key: "notes"));
    print((CacheHelper.getData(key: "Check")));
    print((CacheHelper.getData(key: "amr")));
    print("getshared successddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
  }
}
