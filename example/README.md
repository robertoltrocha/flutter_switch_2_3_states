# switch 2 or 3 states
An easy way to implement a switch with 2 or 3 states.

An example of a direct use of a switch with 3 states is a questionnaire. Imagine asking a person if they would vote for President a candidate and questionnaire already filled in with NO, so I am creating the central option in which the person should fill it out.
Another application is in an online test, can you imagine everything is filled with false or true?

And as we have each database filled with values 0 or 1, true or false. I saw this as a problem and would have to convert the initial value to true or false and then convert it again. To avoid this work, the list of values that you have in your database can pass the Widget and it will return the value compatible with your database.

In this package you also have the freedom to configure the list of values that will be used on the switch.

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
                onChange: (x) {
                  print(x);                
                },
              ),
```

## Demo
![Demo](https://github.com/robertoltrocha/flutter_switch_2_3_states/blob/main/images/example1.gif)

## Contributions 
If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/robertoltrocha/flutter_switch_2_3_states/issues).

## Licence
[MIT](https://pub.dev/packages/flutter_switch_2_3_states/license)