import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor:Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
           statusBarBrightness: Brightness.dark, 
          ),


        ),
    );  
  }
}