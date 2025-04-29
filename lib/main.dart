// ignore_for_file: non_constant_identifier_names

import 'dart:async';
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
      home:FirstPage(), 
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FirstPage();
  }
}
int time = 20;

class _FirstPage extends State<FirstPage>{

  var level = 'easy';
  var bgeasy = const Color.fromARGB(255, 48, 190, 52);
  var bgmedium = Colors.grey;
  var bghard = Colors.grey;
  var bgplus = Colors.yellow;
  var bgminus = Colors.yellow;
  var bgtimes = Colors.yellow;
  var bgdivide = Colors.yellow;
  var description = 'the quizes wil be use +, -, *, /';
  var correct_data = true; 
  var color_data = Colors.black;
  var description_time = 'For every quiz will be given $time seconds';

  void start(){
    if (correct_data == false){
      setState(() {
        color_data = const Color.fromARGB(255, 199, 28, 16);

      });  
    }
    else{
      List<String>new_symbols = [];
      if(bgplus == Colors.yellow){
        new_symbols.add('+');
      }
      if(bgminus == Colors.yellow){
        new_symbols.add('-');
      }
      if(bgtimes == Colors.yellow){
        new_symbols.add('*');
      }
      if(bgdivide == Colors.yellow){
        new_symbols.add('/');
      }
      Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context)=>Function_screen(level, new_symbols)
      )
      );
   
    }
  }
  
  void all_functions (String symbol, MaterialColor current_color){
    var color =  current_color == Colors.yellow ? Colors.grey : Colors.yellow;
    setState(() {
      color_data = Colors.black;
      if (symbol == '+'){
      bgplus = color;
    }
    else if (symbol == '-'){
      bgminus = color;
    }
    else if (symbol == '*'){
      bgtimes = color;
    }
    else if (symbol == '/'){
      bgdivide = color;
    }

    
    description = 'the quizes will be use ';
    if (bgplus == Colors.yellow){
      description += '+, ';
    }
    if (bgminus == Colors.yellow){
      description += '-, ';
    }
    if (bgtimes == Colors.yellow){
      description += '*, ';
    }
    if (bgdivide == Colors.yellow){
      description += '/, ';
    }
    description = description.substring(0, description.length - 2);
    if (bgplus == Colors.grey && bgminus == Colors.grey && bgtimes == Colors.grey && bgdivide == Colors.grey){
      description = 'choose minimum 1 item';
      correct_data = false; 
    }
    else{
      correct_data = true;
    }

        }

    );
    
  }


  void change_level(String new_level){
    level = new_level;
    setState(() {
      bgeasy = Colors.grey;
      bgmedium = Colors.grey;
      bghard = Colors.grey;
      if (level == 'easy'){
        bgeasy = const Color.fromARGB(255, 48, 190, 52);
        time = 20;
      }
      else if (level == 'medium'){
        bgmedium = Colors.orange;
        time = 15;
      }
      else if(level == 'hard'){
        bghard = Colors.red;
        time = 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('knowledge', style: TextStyle(backgroundColor: const Color.fromARGB(255, 16, 102, 200)),),
        backgroundColor: Color.fromARGB(255, 16, 102, 200),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ ElevatedButton(onPressed: ()=>change_level('easy'), child: Text('easy'),style: ElevatedButton.styleFrom(backgroundColor: bgeasy),),],
          ),
         
          ElevatedButton(onPressed: ()=>change_level('medium'), child: Text('medium'),style: ElevatedButton.styleFrom(backgroundColor: bgmedium),),
          ElevatedButton(onPressed: ()=>change_level('hard'), child: Text('hard'),style: ElevatedButton.styleFrom(backgroundColor: bghard)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ElevatedButton(onPressed: ()=>all_functions('+', bgplus), style: ElevatedButton.styleFrom(backgroundColor: bgplus),
              child: Text('+', style: TextStyle(fontSize: 25),),),
              ElevatedButton(onPressed: ()=>all_functions('-', bgminus), style: ElevatedButton.styleFrom(backgroundColor: bgminus),
              child: Text('-', style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed: ()=>all_functions('*', bgtimes), style: ElevatedButton.styleFrom(backgroundColor: bgtimes),
              child: Text('*', style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed: ()=>all_functions('/', bgdivide), style: ElevatedButton.styleFrom(backgroundColor: bgdivide),
              child: Text('/', style: TextStyle(fontSize: 25),)),
          ],),
          ElevatedButton(onPressed:start, child: Text('start')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Text(
                  'For every quiz will be given $time seconds',
                  style: TextStyle(color: color_data ),
                  ),
                Text(
                  description, 
                  style: TextStyle(color: color_data),
                  )
            ],)
          ],)
        ],
      ),
    );
  }
}

class Function_screen extends StatefulWidget{
  var lvl = 'easy';
  List<String> Symbols = [];

  Function_screen(String level, List<String> new_symbols){
    lvl = level;
    Symbols = new_symbols;
  }
  @override
  _Function_screen createState() {
    return _Function_screen(lvl, Symbols);
  }
}

class _Function_screen extends State<Function_screen>{
  var seconds = 20;
  var all_seconds = 20;
  String answer = 'Your answer';
  var bgplus = Colors.green;
  var bgminus =  Colors.grey;
  var bgtimes =  Colors.grey;
  var bgdivide =  Colors.grey;
  var number1 = Random().nextInt(1000);
  var number2 = Random().nextInt(1000);
  var symbol = '+';
  var symbols = [];
  var colors_quest = Colors.amber;
  late Timer timerquist;

_Function_screen(String level, List<String> ss){
  if(level == 'easy'){
    seconds = 30;
  }
  else if(level == 'medium'){
    seconds = 25;
  }
  else if(level == 'hard'){
    seconds = 20;
  }
  else{
    print('Unknow level $level');
  }
  all_seconds = seconds;
  symbols = ss;
  print(symbols);
}

void start_timer(){
  timerquist = Timer.periodic(Duration(seconds: 1),(timer){
    setState(() {
      if(seconds < 1){
        seconds = all_seconds;
        createNextQuest();
      }
      else{
        seconds--;
      }
      
    });
  });
}


@override
void initState(){
  super.initState();
  start_timer();

}



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
    seconds = all_seconds;
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
    return Scaffold(
        appBar: AppBar(
          title: Text('knowledge', style: TextStyle(backgroundColor: const Color.fromARGB(255, 16, 102, 200)),),
          backgroundColor: Color.fromARGB(255, 16, 102, 200),
          ),
        body:  Column(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$seconds', style: TextStyle(fontSize: 25),)
            ],
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
        ),
      );
  }
}