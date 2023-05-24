
import 'package:flutter/material.dart';
import 'package:noteapp/shared.dart';

import 'HomeP.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homenote(),
    );
  }
}
