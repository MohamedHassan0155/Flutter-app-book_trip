import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';
import 'onboarding1.dart';

class Splash extends StatefulWidget {  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:2), ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding1(
        image: 'assets/images/Traveling_Monochromatic 1.png',
        text: 'Make your own private travel plan',
      )));
    });
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
         child: Center(
           child: Container(
             margin: const EdgeInsetsDirectional.only(top: 70),
             child: Column(
                 children:
                 [
                   // CircleAvatar ,Text in SizedBox ,CircularProgressIndicator
                    CircleAvatar(
                      radius: 150,
                      child:Image.asset('assets/images/c.png',
                      ),
                    ),
                   const SizedBox(height: 30,),
                 const Text(
                       ' Egypt Travel',
                       style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                           color: Colors.black,
                       ),
                     ),
                   const SizedBox(height: 80,),
                   const CircularProgressIndicator(
                     color: Colors.orange,
                   ),
                 ],
               ),
           ),
         ),
       ),
       );







  }








}
