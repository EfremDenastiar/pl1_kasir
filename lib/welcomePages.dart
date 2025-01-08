import 'package:flutter/material.dart';

class Welcomepages extends StatefulWidget {
  const Welcomepages({super.key});
  @override
  _Welcomepagesstate createState() => _Welcomepagesstate(); 
}

class _Welcomepagesstate extends State<Welcomepages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
            )
          ],
        )
      ),
    );
  }

}