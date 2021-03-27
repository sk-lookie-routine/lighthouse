import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
         leading: IconButton(
           icon: const Icon(Icons.arrow_back),
           tooltip: '이전 페이지',
           color: Colors.black,
           onPressed: () {
           },
         ),
      ),
      body: const Center(
        child: Text(
          'This is my first page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
