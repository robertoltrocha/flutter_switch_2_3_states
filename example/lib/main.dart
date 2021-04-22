import 'package:flutter/material.dart';
import 'package:flutter_switch_2_3_states/widgets/widget_switch1.dart';
import 'package:flutter_switch_2_3_states/widgets/widget_switch2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  dynamic value1;
  dynamic value2;
  dynamic value3 = 1;
  dynamic value4 = 2;
  dynamic value5;
  dynamic value6='yes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Switch 3 states default',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    initValue: value1,
                    values: [false, null, true],
                    onChange: (x) {
                      setState(() {
                        value1 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value1.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Switch 3 states and change the size and color of the button',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    iconRight: Icons.check,
                    initValue: value2,
                    width: 200,
                    colorButton: Colors.blueGrey,
                    buttonDiameter: 55,
                    iconSize: 60,

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
                    'Switch 2 states',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    colorRightBackground: Colors.blue,
                    colorLeftBackground: Colors.orange,
                    iconLeft: Icons.remove_circle,
                    iconRight: Icons.play_arrow,
                    initValue: value3,
                    isTreeStates: false,
                    width: 70,
                    duration: 500,
                    ///this is dymamic type list to values user parsed
                    values: [0, 1],
                    ///values: [0,1,2],
                    ///values: ['0','1','2'],
                    ///values: [0,2,1],
                    onChange: (x) {
                      setState(() {
                        value3 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value3.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Switch 3 states and change duration time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    colorRightBackground: Colors.blue,
                    colorLeftBackground: Colors.orange,
                    iconLeft: Icons.remove_circle,
                    iconRight: Icons.play_arrow,
                    initValue: value4,
                    duration: 1000,

                    ///this is dymamic type list to values user parsed
                    values: [0, 2, 1],

                    ///values: [0,1,2],
                    ///values: ['0','1','2'],
                    ///values: [0,2,1],
                    onChange: (x) {
                      setState(() {
                        value4 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value4.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Switch 3 states with text',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch2(
                    colorRightBackground: Colors.blue,
                    colorLeftBackground: Colors.orange,
                    initValue: value4,

                    ///this is dymamic type list to values user parsed
                    values: [0, 2, 1],

                    ///values: [0,1,2],
                    ///values: ['0','1','2'],
                    ///values: [0,2,1],
                    onChange: (x) {
                      setState(() {
                        value4 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value4.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Switch 2 states with text',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch2(
                    isTreeStates: false,
                    width: 70,
                    initValue: value4,

                    ///this is dymamic type list to values user parsed
                    values: [0, 2, 1],

                    ///values: [0,1,2],
                    ///values: ['0','1','2'],
                    ///values: [0,2,1],
                    onChange: (x) {
                      setState(() {
                        value4 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value4.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Switch 3 states disabled',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch1(
                    enable: false,
                    initValue: null,
                    values: [false, null, true],
                    onChange: (x) {},
                  ),
                  Text('the actual value is ' + value5.toString()),
                  SizedBox(height: 20),
                  Text(
                    'Switch 2 states with custom text',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSwitch2(
                    isTreeStates: false,
                    width: 90,
                    initValue: value6,
                    colorRightBackground: Colors.orange,
                    textLeft: 'NO',
                    textRight: 'YES',

                    ///this is dymamic type list to values user parsed
                    values: ['no', 'yes'],

                    ///values: [0,1,2],
                    ///values: ['0','1','2'],
                    ///values: [0,2,1],
                    onChange: (x) {
                      setState(() {
                        value6 = x;
                      });
                    },
                  ),
                  Text('the actual value is ' + value6.toString()),
                ],
              ),
            ),
          ),
        ));
  }
}
