import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/state.dart';
import 'cubit.dart';
class Addnote extends StatelessWidget {
  var note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteC , cubitState>(
        listener: (context , state){},
        builder: (context , state){
          return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextFormField(
                      controller: note,
                      decoration: const InputDecoration(
                          label: Text("Add Yout Note"),
                          icon: Icon(Icons.speaker_notes)
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(width : double.infinity ,decoration:BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.lightGreenAccent),child: MaterialButton(onPressed: (){
                    if(note.text == "" ||NoteC.get(context).Notes.contains(note.text)){
                    }
                    else {
                      NoteC.get(context).Notes.add(note.text);
                      NoteC.get(context).check.add("0");
                      NoteC.get(context).changetoback();
                      NoteC.get(context).setshared();
                      note.text="";
                    }
                  },child: Text("Add")),)
                ],
              ),
            );
        });
  }
}
