# switch 2 or 3 states

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

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

![exemple](https://github.com/robertoltrocha/flutter_switch_2_3_states/blob/main/images/example1.gif?raw=true)

## Licence
MIT