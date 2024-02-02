import 'package:flutter/material.dart';
import 'package:todos/pages/homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization logic here
    // Example: Future.delayed(Duration(seconds: 3), () => navigateToNextScreen());
    // In this example, we navigate to the next screen after 3 seconds.
    Future.delayed(Duration(seconds: 3), () => navigateToHomePage());
  }

  void navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [
        Color(0xffd9afd9),
    Color(0xff97d9e1),
    ],)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              Image.asset("images/img_11.png"),
          SizedBox(height: 40,),
          Center(
            child: Text(
              'Todos',
              style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
            ),
          ),
              SizedBox(height: 200,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Made by", style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),),
                  Text(" Raj Darvai", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),)
              ],)
            ],
          ),
        ),
      ),
    );
  }
}



