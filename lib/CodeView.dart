import 'package:flutter/material.dart';

import 'const.dart';

class CodeView extends StatelessWidget {
   CodeView({Key? key, this.result}) : super(key: key);
  final result;
  String te='';
  List<Map> te2=[];
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < result.length; i++) {
      result[i].forEach((key, value) {
        te2.add({key:value});
        // te+=;
      });
    }
    return Scaffold(
      backgroundColor: Color(0xF4000000),
      appBar: AppBar(
          backgroundColor: primary,
          title: Text('NAM Compiler'),
        ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: ListView(
         children: te2.map((e) => Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             RichText(
    text: TextSpan(
    text: 'The next token is :  ',
    style: TextStyle(color: Colors.white, fontSize: 20),
    children: <TextSpan>[
    TextSpan(text: "${e.keys}  ",
    style: TextStyle(color: Color(0xF4B22424), fontSize: 20,fontWeight: FontWeight.bold),

    ) ] ), ),
             RichText(
               text: TextSpan(
                   text: '    And the next lexeme is :',
                   style: TextStyle(color: Colors.white, fontSize: 20),
                   children: <TextSpan>[
                     TextSpan(text: "   ${e.values}\n",
                       style: TextStyle(color: Colors.orange.withOpacity(.8), fontSize: 20,fontWeight: FontWeight.bold),

                     ) ] ), )
           ],
         )).toList()
             // Text('  The next token is :   ${e.keys} ,\n             And the next lexeme is :   ${e.values}\n\n')).toList(),
       )
     ),
    );
  }
}
