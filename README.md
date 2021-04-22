# switch 2 or 3 states

An easy way to implement a switch with 2 or 3 states.
In this package you also have the freedom to configure the list of values that will be used on the switch
The list of values is dynamic and returns the selected value without having to do the conversion.
Example of the list of values:
```
[false,true]
[false,null,true]
[0,2,1]
['no','','yes']
```

## Getting Started


```
   WidgetSwitch1(
                iconRight: Icons.check,
                initValue: value2,
                width: 200,
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
```

##Demo

![exemple](https://github.com/robertoltrocha/flutter_switch_2_3_states/blob/main/images/example1.gif?raw=true)

## Licence
MIT