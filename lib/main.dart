import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  var my_app = Math();
  runApp(my_app);
}



class Math extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('knowledge', style: TextStyle(backgroundColor: const Color.fromARGB(255, 16, 102, 200)),),
          backgroundColor: Color.fromARGB(255, 16, 102, 200),
          ),
        body: Function_screen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Function_screen extends StatefulWidget{
  @override
  Function_screen_ createState() {
    return Function_screen_();
  }
}

class Function_screen_ extends State<Function_screen>{
  String answer = 'Your answer';
  var bgplus = Colors.green;
  var bgminus =  Colors.grey;
  var bgtimes =  Colors.grey;
  var bgdivide =  Colors.grey;
  var number1 = Random().nextInt(1000);
  var number2 = Random().nextInt(1000);
  var symbol = '+';
  var colors_quest = Colors.amber;




 void setDefualtValue(){
  setState(() {
    bgminus = Colors.grey;
    bgplus = Colors.grey;
    bgdivide = Colors.grey;
    bgtimes = Colors.grey;
    answer = '';
    create_max_num();
  });
 }

 void create_max_num() {
   int max_num = 5;
   if (symbol == '+' || symbol == '-'){
     max_num = 1000;
   }
   else if(symbol == '*'){
     max_num = 20;
   }
   else if(symbol == '/'){
     max_num = 500;
   }
   number1 = Random().nextInt(max_num);
   number2 = Random().nextInt(max_num);
 } 

void clickMinus(){
  setState(() {
    symbol = '-';
    setDefualtValue();
    bgminus = Colors.green;
  });
}
void clicktimes(){
  setState(() {
    symbol = '*';    
    setDefualtValue();
    bgtimes = Colors.green;
  });
}
void clickdivide(){
  setState(() {
    symbol = '/';
    setDefualtValue();
    bgdivide = Colors.green;
    if(number1 < number2){
      var x = number1;
      number1 = number2;
      number2 = x;
    }
    if(number1 % number2 != 0){
      while(number1 % number2 != 0){
        number2--;
      }
    }
  });
}
void clickPlus(){
  setState(() {
    symbol = '+';
    setDefualtValue();    
    bgplus = Colors.green;
  });
}



void clickNumber(String number){
  setState(() {
    if(answer == 'Your answer'){
    answer = number;
  }
  else{
    answer += number;
  }
  }
  );
  checkResult();
}
void deleteNumber(){
  setState(() {
    if(answer.length == 0){
      return;
    }
    else if(answer == 'Your answer'){
      answer = '';
    }
    else{
      answer = answer.substring(0, answer.length-1);
    }
  });
  checkResult();
}
void changePlusMinus(){
  setState(() {
    if(answer == 'Your answer' || answer.length == 0){
    answer = '-';
  }
  else if(answer[0] == '-'){
    answer = answer.substring(1, answer.length);
  }
  else{
    answer = '-$answer';
  }
  });
  checkResult();
  
}

void mode(String symbol){
  //do mode for all of buttons, change one of them to green, then write them function
}

void checkResult(){
var correctAnswer = 1000000;
if(symbol == '+'){
  correctAnswer = number1 + number2;
}
else if(symbol == '-'){
  correctAnswer = number1 - number2;
}
else if(symbol == '/'){
  correctAnswer =(number1 / number2).floor();
}
else if(symbol == '*'){
  correctAnswer = number1 * number2;
}

if(correctAnswer == int.parse(answer)){
  setState(() {
    colors_quest = Colors.green;
  });

Future.delayed(Duration(milliseconds: 1000), 
(){
  setState(() {
    colors_quest = Colors.amber;
    createNextQuest();
  });
}
);

}

}

void createNextQuest(){
  setState(() {
    create_max_num();
    answer = '';
    if(symbol == '/'){
      if(number1 < number2){
      var x = number1;
      number1 = number2;
      number2 = x;
    }
    if(number1 % number2 != 0){
      while(number1 % number2 != 0){
        number2--;
      }
    }
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            ElevatedButton(onPressed: clickPlus, style: ElevatedButton.styleFrom(backgroundColor: bgplus),
             child: Text('+', style: TextStyle(fontSize: 25),),),
            ElevatedButton(onPressed: clickMinus, style: ElevatedButton.styleFrom(backgroundColor: bgminus),
             child: Text('-', style: TextStyle(fontSize: 25),)),
            ElevatedButton(onPressed: clicktimes, style: ElevatedButton.styleFrom(backgroundColor: bgtimes),
            child: Text('*', style: TextStyle(fontSize: 25),)),
            ElevatedButton(onPressed: clickdivide, style: ElevatedButton.styleFrom(backgroundColor: bgdivide),
            child: Text('/', style: TextStyle(fontSize: 25),)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50,horizontal: 80),
              child: 
                Text('$number1 $symbol $number2', 
                  style: TextStyle(fontSize: 25),
                ),
              decoration: BoxDecoration(color: colors_quest, borderRadius: BorderRadius.circular(15)),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(answer,
              style: TextStyle(
                fontSize: 25,

              ),)
        ],
        ),

        Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()=>clickNumber('1'), child: Text('1', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: ()=>clickNumber('2'), child: Text('2', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: ()=>clickNumber('3'), child: Text('3', style: TextStyle(fontSize: 25),)),
    
                 ],
                ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()=>clickNumber('4'), child: Text('4', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: ()=>clickNumber('5'), child: Text('5', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: ()=>clickNumber('6'), child: Text('6', style: TextStyle(fontSize: 25),)),
          
                ],
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()=>clickNumber('7'), child: Text('7', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: ()=>clickNumber('8'), child: Text('8', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: ()=>clickNumber('9'), child: Text('9', style: TextStyle(fontSize: 25),)),
          
                ],
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()=>clickNumber('0'), child: Text('0', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: changePlusMinus, child: Text('+/-', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: deleteNumber, child: Text('x', style: TextStyle(fontSize: 25),)),
          
                ],
              ), 
          ],
       )

      
      ],
    );
  }
}