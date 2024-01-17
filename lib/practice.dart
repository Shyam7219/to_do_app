

import 'package:flutter/material.dart';
import 'package:to_do_app/authentication/authform.dart';



void main (){
  runApp(const Practice());
}

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) {
                  return const Scaffold(
                      body: AuthForm(),
                    );
                }));
            },
             icon:const  Icon(Icons.audiotrack))
          ],),
        body: Container(
          decoration: const BoxDecoration(color: Colors.amber),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
        ),
      ),
    );
  }
}