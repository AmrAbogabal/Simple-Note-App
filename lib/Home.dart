import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/state.dart';

import 'cubit.dart';
class Homepage extends StatelessWidget {
  bool rr = false ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteC, cubitState>(
        listener: (context , state){},
        builder: (context , state){
          return  NoteC.get(context).Notes.isEmpty ? Center(child: Text("No Notes To Show"),) : ListView.separated(itemBuilder: (context,index)=>Modelnote(NoteC.get(context).Notes,index,context), separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: NoteC.get(context).Notes.length) ;
        }
    );
  }
  Widget Modelnote(notes,index,context)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child:   Container(
      decoration: BoxDecoration(
        color: NoteC.get(context).C[index%5],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // تحديد اتجاه الظل
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
          Expanded(
            child: Container(
              //width: MediaQuery.of(context).size.width*0.7,
              child: Text(notes[(notes.length-1)-index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,
                  decoration: NoteC.get(context).check[(notes.length-1)-index]=="1"?TextDecoration.lineThrough : null,
                  decorationColor : Colors.red ,
                  decorationStyle : TextDecorationStyle.wavy,
                  decorationThickness:  5 ,
                ),),
            ),
          ),
          MaterialButton(onPressed: (){
            num x = (NoteC.get(context).Notes.length-1)-index ;
            NoteC.get(context).Notes.removeAt(x.toInt());
            print("delete Note");
            NoteC.get(context).check.removeAt(x.toInt());
            print("Delete check");
            NoteC.get(context).nn();
            print("DElete");
            NoteC.get(context).setshared();

            print(index);

          },child: Icon(Icons.delete),),
          MaterialButton(onPressed: (){
            NoteC.get(context).Changee((notes.length-1)-index);
            NoteC.get(context).setshared();
            print(notes);
          },child:Icon(NoteC.get(context).check[(notes.length-1)-index]=="1"?Icons.check_circle : Icons.check_circle_outline),),
        ],),
      ),
    ),
  );
}
