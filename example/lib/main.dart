import 'package:flutter/material.dart';
import 'package:flutter_switch_2_3_states/flutter_switch_2_3_states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch with 2 or 3 states',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Exemple switch with 2 or 3 states'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic value1 = 1;
  dynamic value2;
  dynamic value3 = 1;
  dynamic value4 = 2;
  dynamic value5 = 0;
  dynamic value6 = 'yes';
  dynamic value7 = 'yes';
  dynamic value8 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.9),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Ex.1 Switch 3 states default',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    onChange: (x) {
                      print(x);
                      setState(() {
                        value1 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value1.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Ex.2 Switch 3 states with text and box button',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch3(
                    initValue: value8,
                    textLeft: "NO",
                    textCenter: "?",
                    textRight: "YES",
                    values: ['no', '', 'yes'],
                    onChange: (x) {
                      print(x);
                      setState(() {
                        value8 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value8.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Ex.3 Switch 3 states button size greater than switch height',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    initValue: 0,
                    iconLeft: null,
                    iconRight: null,
                    height: 10,
                    buttonSize: 30,
                    onChange: (x) {
                      print(x);
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ex.4 Switch 3 states and change the size and color of the button',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    buttonSize: 55,
                    initValue: value2,
                    width: 200,
                    colorButton: Colors.blueGrey,

                    ///this is dymamic type list to values user parsed
                    values: [false, null, true],

                    ///values: [0,1,2],
                    ///values: ['0','1','2'],
                    ///values: [0,2,1],
                    onChange: (x) {
                      print(x);
                      setState(() {
                        value2 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value2.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Ex.5 Switch 2 states',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    colorRightBackground: Colors.blue,
                    colorLeftBackground: Colors.orange,
                    iconLeft: Icons.remove_circle,
                    iconRight: Icons.play_arrow,
                    initValue: value3,
                    width: 70,
                    duration: 500,
                    values: [0, 1],
                    onChange: (x) {
                      setState(() {
                        value3 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value3.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Ex.6 Switch 3 states and change duration time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    colorRightBackground: Colors.blue,
                    colorLeftBackground: Colors.orange,
                    iconLeft: Icons.remove_circle,
                    iconRight: Icons.play_arrow,
                    initValue: value4,
                    duration: 1000,
                    values: [0, 2, 1],
                    onChange: (x) {
                      setState(() {
                        value4 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value4.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Ex.7 Switch 3 states with text',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch2(
                    colorRightBackground: Colors.blue,
                    colorLeftBackground: Colors.orange,
                    initValue: value4,
                    values: [0, 2, 1],
                    onChange: (x) {
                      setState(() {
                        value4 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value4.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Ex.8 Switch 2 states with text',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch2(
                    width: 70,
                    initValue: value5,
                    values: [0, 1],
                    onChange: (x) {
                      setState(() {
                        value5 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value5.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Ex.9 Switch 3 states disabled',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    enable: false,
                    initValue: null,
                    values: [false, null, true],
                    onChange: (x) {},
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ex.10 Switch 2 states with custom text',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch2(
                    width: 90,
                    initValue: value6,
                    colorRightBackground: Colors.orange,
                    textLeft: "NO",
                    textRight: "YES",
                    values: ['no', 'yes'],
                    onChange: (x) {
                      setState(() {
                        value6 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value6.toString()),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }
}
