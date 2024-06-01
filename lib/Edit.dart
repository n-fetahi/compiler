import 'package:flutter/material.dart';

import 'CodeView.dart';
import 'const.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
    String text='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor: primary,
        title: Text('NAM Compiler'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 700,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF3A3A3B),
borderRadius: BorderRadius.circular(15)
                ),
                child: TextFormField(
                  onChanged: (v){
                    text=v.toString();
                    setState((){
                      v='noooooooooooor';
                    });
                  },
                  decoration: InputDecoration(
                    // hintText: 'Enter the code',
                    labelText:'Enter the code',
                    labelStyle: const TextStyle(
                      fontSize: 25,
                      color: Color(0xFFFFFFFF),

                    ),
                    hintStyle: TextStyle(

                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xFFC5C7C7)
                        )
                    ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xFFB6B0B0),
                          )
                      )
                  ),
                  style: TextStyle(
                    color: Color(0xFFADADB0)
                  ),
                  maxLines: 123,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Map Key_Word = {
            'T_Int': 'int',
            'T_Float': 'float',
            'T_Char': 'char',
            'T_Doubole': 'double',
            'T_String': 'string',
            'T_Bool': 'bool',
            'T_For': 'for',
            'T_If': 'if',
            'T_Elif': 'elif',
            'T_Else': 'else',
            'T_Show': 'show'
          };
          int flag = 0;
          String tempNum = '';
          List<Map> result = [];
          String tempStr = '';
          RegExp T_Str=RegExp(r"^\D");
          RegExp T_Num=RegExp(r"^\d");
          RegExp T_Symbol =RegExp(r'\W');
          int found_dou_cot=0;
          // int found_back_slash=0;
          for (int i = 0; i < text.length; i++) {
            try{
              flag = 0;
              if(text[i]+text[i+1]=='//'){
                i+=2;
                result.add({'T_comment': '//'});
                while(text[i]!='\n'){
                  i++;
                }
                i++;
              }

              else if(text[i]=='"' ){
                result.add({'T_Symbole': text[i]});
                found_dou_cot++;
                if(found_dou_cot%2==1){
                  String original_text='';
                  int j=i+1;
                  while(text[j]!='"' ){
                    original_text+=text[j];
                    j++;
                  }
                  result.add({'T_Ori_text': original_text});
                }
              }
              else if (text[i] == ' ' || T_Symbol.hasMatch(text[i]) || text[i]=='\n') {
                if (tempStr != '') {
                  Key_Word.forEach((key, value) {
                    if (tempStr == value) {
                      result.add({key: value});
                      flag = 1;
                      tempStr = '';
                    }
                  });

                  if (flag == 0) {
                    result.add({'T_Ident': tempStr});
                    tempStr = '';
                  }
                }  if (tempNum != '') {
                  result.add({'T_Number': tempNum});
                  tempNum = '';
                }
                if(text[i] !=' '&&text[i] !='\n'){
                  result.add({'T_Symbole': text[i]});
                }
              }

              else if (T_Num.hasMatch(text[i]) && found_dou_cot%2==0) {
                tempNum += text[i];
              }
              else if (T_Str.hasMatch(text[i])  && found_dou_cot%2==0) {
                tempStr += text[i];
              }
            }catch(e){

            }
          }
          for (int i = 0; i < result.length; i++) {
            result[i].forEach((key, value) {
              print('The next token is : ${key} , And the next lexeme is : ${value}');
            });
          }

          Navigator.push(context,
              MaterialPageRoute(
                  builder:(context)=>CodeView(result: result,)
              )
          );
        },
        backgroundColor: Color(0xABFFFFFF),
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow,color: primary,),
      ),
    );
  }

    bool isValueFound(String value,String list){
      for(int i=0;i<list.length;i++){
        if(value==list[i]){
          return true;
        }
      }
      return false;
    }
}
