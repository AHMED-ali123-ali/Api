import 'package:api_applications/screnns/Home_Screens.dart';
import 'package:flutter/material.dart';
main(){

  runApp(myApp());

}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomeScreen()
    );
  }
}
