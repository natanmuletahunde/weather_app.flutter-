import 'dart:ui';

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
          systemOverlayStyle: const  SystemUiOverlayStyle(
           statusBarBrightness: Brightness.dark, 
          ),
        ),
        body: Padding(padding: EdgeInsets.fromLTRB(
          40,1.2*kToolbarHeight,40,20
        ),
        child:SizedBox(
          height: MediaQuery.of(context).size.height,
          child:Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -0.3),
                child:Container(
                height:250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,

                ),  
                ),
              ),
               Align(
                alignment: AlignmentDirectional(-3, -0.3),
                child:Container(
                height:250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),  
                ),
              ),
               Align(
                alignment: AlignmentDirectional(0, -1.2),
                child:Container(
                height:250,
                width: 600,
                decoration: BoxDecoration(
                 
                  color: Color(0xFFFFAB40),
                  
                ),  
                ),
              ),
              BackdropFilter(filter: 
              ImageFilter.blur(
                sigmaX: 100.0,sigmaY: 100.0
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent
                ),
              ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:const  Column(
                  children: [
                    Text(' hi piv nati',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300
                    ),)
                  ],
                ),
              )
            ],
          ),
        ) ,
        
        ),
    );  
  }
}