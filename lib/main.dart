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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ElevatedButton(onPressed: (){}, child: Text('+', style: TextStyle(fontSize: 25),)),
            ElevatedButton(onPressed: (){}, child: Text('-', style: TextStyle(fontSize: 25),)),
            ElevatedButton(onPressed: (){}, child: Text('*', style: TextStyle(fontSize: 25),)),
            ElevatedButton(onPressed: (){}, child: Text('/', style: TextStyle(fontSize: 25),)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50,horizontal: 80),
              child: 
                Text('2 + 2', 
                  style: TextStyle(fontSize: 25),
                ),
              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          
        ),

        Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('1', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: (){}, child: Text('2', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: (){}, child: Text('3', style: TextStyle(fontSize: 25),)),
    
                 ],
                ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('4', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: (){}, child: Text('5', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: (){}, child: Text('6', style: TextStyle(fontSize: 25),)),
          
                ],
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('7', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: (){}, child: Text('8', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: (){}, child: Text('9', style: TextStyle(fontSize: 25),)),
          
                ],
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('0', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: (){}, child: Text('+/-', style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: (){}, child: Text('x', style: TextStyle(fontSize: 25),)),
          
                ],
              ), 
          ],
       )

      
      ],
    );
  }
}