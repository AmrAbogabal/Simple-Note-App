import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/shared.dart';
import 'package:noteapp/state.dart';

import 'cubit.dart';
class Homenote extends StatelessWidget {
  const Homenote({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NoteC(),
        child: BlocConsumer<NoteC, cubitState>(
            listener: (context, state) {},
            builder: (context, state) {
              if(NoteC.get(context).i==0){
                NoteC.get(context).i=NoteC.get(context).i+1 ;
                //NoteC.get(context).getdatafrmshared();
                CacheHelper.sharedPrefrences?.getStringList("Noteshared")?.forEach((element) {
                  NoteC.get(context).Notes.add(element);
                  print("successNote");
                });
                CacheHelper.sharedPrefrences?.getStringList("checkshared")?.forEach((element) {
                  NoteC.get(context).check.add(element);
                  print("successCheck");
                });

                return  Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.lightGreen,
                    title: Text("My Notes",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    centerTitle: true ,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                  ),
                  //backgroundColor: Colors.black26,
                  body: NoteC.get(context).page[NoteC.get(context).Current] ,
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: NoteC.get(context).Current,
                    selectedItemColor: Colors.red,
                    onTap: (index){
                      NoteC.get(context).Change(index);
                      print(index);
                    },
                    items: const [
                      BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blue,),backgroundColor: Colors.white,label: "Home"),
                      BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.blue,),backgroundColor: Colors.white,label: "Add Note"),

                    ],
                  ),

                );
              }
              else {
                return  Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.lightGreenAccent,
                  title: const Text("Note App ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  centerTitle: true ,
                ),
                body: NoteC.get(context).page[NoteC.get(context).Current] ,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: NoteC.get(context).Current,
                  selectedItemColor: Colors.red,
                  selectedIconTheme: IconThemeData(color: Colors.lightGreenAccent,size: 40,opacity: .7),
                  onTap: (index){
                    NoteC.get(context).Change(index);
                    print(index);
                  },
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.lightGreen,),backgroundColor: Colors.white,label: "Home"),
                    BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.lightGreen,),backgroundColor: Colors.white,label: "Add Note"),

                  ],
                ),

              );
              }
            }));
  }
}
