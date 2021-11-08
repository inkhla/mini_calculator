import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
 String result = '0';
 String number = '0';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final double numberFontSize = 22;
  final double resultFontSize = 34;

  void buttonPressed (String text)
  {
   setState(() {
     if(text == 'C'){
       result = '0';
       number = '0';
     }
     else if (text == 'DEL'){
       number = number.substring(0,number.length - 1);
       if(number.isEmpty)
       {
         number = text;
       }
     }
     else if (text == '='){
       var expression = number;
       expression = expression.replaceAll('÷', '/');
       expression = expression.replaceAll('×', '*');
       try{
         Parser p = Parser();
         Expression exp = p.parse(expression);

         ContextModel cm = ContextModel();
         result = '${exp.evaluate(EvaluationType.REAL, cm)}';
       }catch(e){
         result = 'ERROR';
       }
     }
     else {
       if(number == '0'){number = text;}else {
         number = number + text;
       }
     }
   });
  }
  @override
  Widget build(BuildContext context) {
    var leftSide = MediaQuery.of(context).size.width * 0.75;
    var rightSide = MediaQuery.of(context).size.width * 0.25;
    var buttonHeight = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              number,
              style: TextStyle(fontSize: numberFontSize, color: Colors.black),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize, color: Colors.black),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: leftSide,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Button(
                            height: buttonHeight,
                            color: Colors.redAccent,
                            text: 'C'),
                        Button(
                            height: buttonHeight,
                            color: Colors.blueAccent,
                            text: 'DEL'),
                        Button(
                            height: buttonHeight,
                            color: Colors.blueAccent,
                            text: '÷'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '7'),
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '8'),
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '9'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '4'),
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '5'),
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '6'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '1'),
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '2'),
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '3'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '.'),
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '0'),
                        Button(
                            height: buttonHeight,
                            color: Colors.grey.shade600,
                            text: '00'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: rightSide,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Button(height: buttonHeight , color: Colors.blueAccent, text: '×'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(height: buttonHeight , color: Colors.blueAccent, text: '-'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(height: buttonHeight , color: Colors.blueAccent, text: '+'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(height: buttonHeight * 2 , color: Colors.redAccent, text: '='),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget Button({required double height,
    required Color color,
    required String text,}) => Container(
    height: height,
    color: color,
    child: MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: const BorderSide(
            color: Colors.white, width: 1, style: BorderStyle.solid),
      ),
      padding: const EdgeInsets.all(16),
      onPressed: ()=> buttonPressed(text),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    ),
  );
}



