import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           Text("Coming", style: TextStyle(fontSize: 31, fontWeight: FontWeight.w500, color: Colors.black),),
            Text(" Soon..", style: TextStyle(fontSize: 31, fontWeight: FontWeight.w500, color: Colors.blueAccent),),
           ],
         ),
        ],
      ),
    );
  }
}
