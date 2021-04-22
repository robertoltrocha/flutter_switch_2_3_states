
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetSwitch2 extends StatefulWidget {
  /// return the value on change tap
  final ValueChanged<dynamic> onChange;

  ///Right text
  late String textRight;

  ///Left Text
  late String textLeft;

  /// background colorRight state
  late Color colorRightBackground;

  /// colorLeftBackground state
  late Color colorLeftBackground;

  ///Set disable opacity
  late double disableOpacity;

  /// Background off state
  final Color colorButton;

  /// width switch
  final double width;

  /// Background center state
  late Color backgroundCenter;

  /// set if is tree or two state, true is 3 states;
  late bool isTreeStates;

  /// Init value/default
  late dynamic initValue;

  ///List of values to 3 states
  final List<dynamic> values;

  ///set duration transition between states
  late int duration;

  ///switch enable
  late bool enable;

  ///button diameter
  late double buttonDiameter;

  WidgetSwitch2(
      {this.isTreeStates = true,
      this.colorLeftBackground = Colors.red,
      this.disableOpacity = 0.6,
      this.colorRightBackground = Colors.green,
      this.colorButton = const Color(0xffF0F0F0),
      this.width = 100,
      this.backgroundCenter = const Color(0xFFF0F0F0),
      required this.onChange,
      this.duration = 200,
      this.buttonDiameter = 25,
      this.enable = true,
      this.textLeft = "Off",
      this.textRight = "On",
      this.values = const [0, 1, 2],
      this.initValue = 1});

  @override
  _WidgetSwitch2State createState() => _WidgetSwitch2State();
}

class _WidgetSwitch2State extends State<WidgetSwitch2> {
  late Color colorRightBackground;
  late Color colorLeftBackground;
  late Color backgroundDefault;
  late String textRight;
  late String textLeft;

  ///the result actual select state value
  int toggleIndex = 1;

  ///Set all state to false, not used active states
  late List<bool> _selections;

  ///padding left and right side of button
  double rPos = 0;

  ///padding left and right side of button
  double padding = 4;

  ///  Color ColorCenter = Colors.grey;
  Color background = Colors.grey;

  ///Text color / left and right
  Color textRightColor = Colors.black;
  Color textLeftColor = Colors.black;

  @override
  void initState() {
    super.initState();
    if (widget.isTreeStates) _selections = List.generate(3, (_) => false);
    if (!widget.isTreeStates) _selections = List.generate(2, (_) => false);

    textLeft = widget.textLeft;
    textRight = widget.textRight;

    toggleIndex = widget.values.indexOf(widget.initValue) == -1 ? 0 : widget.values.indexOf(widget.initValue);
    _move(toggleIndex);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isTreeStates ? _switch3Pos() : _switch2Pos();
  }

  Widget _switch3Pos() {
    return Opacity(
      opacity: widget.enable ? 1 : widget.disableOpacity,
      child: Stack(children: [
        AnimatedContainer(
          constraints: BoxConstraints(minHeight: widget.buttonDiameter + 8),
          duration: Duration(milliseconds: widget.duration),
          /// Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
          width: widget.width,
          decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(20)),
          child: LayoutBuilder(builder: (context, constraints) {
            return ToggleButtons(
                borderColor: Colors.transparent,
                selectedColor: Colors.transparent,
                renderBorder: false,
                constraints: BoxConstraints.expand(width: constraints.maxWidth / 3),
                //number 3 is number of toggle buttons
                children: [
                  Text(
                    textLeft,
                    style: TextStyle(color: textLeftColor),
                  ),
                  Container(),
                  Text(
                    textRight,
                    style: TextStyle(color: textRightColor),
                  ),
                ],
                onPressed: widget.enable
                    ? (int index) {
                        _changeSelect(index);
                      }
                    : null,
                borderRadius: BorderRadius.circular(20),
                borderWidth: 3,
                isSelected: _selections);
          }),
        ),
        AnimatedPositioned(top: 4, left: rPos, child: iconButton(), duration: Duration(milliseconds: widget.duration)),
      ]),
    );
  }

  Widget _switch2Pos() {
    return Opacity(
      opacity: widget.enable ? 1 : widget.disableOpacity,
      child: Stack(children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          /// Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
          constraints: BoxConstraints(minHeight: widget.buttonDiameter + 8),
          width: widget.width,
          decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(20)),
          child: LayoutBuilder(builder: (context, constraints) {
            return ToggleButtons(
                borderColor: Colors.transparent,
                selectedColor: Colors.transparent,
                renderBorder: false,
                constraints: BoxConstraints.expand(width: constraints.maxWidth / 2),
                ///number 2 is number of toggle buttons
                children: [
                  Text(
                    textLeft,
                    style: TextStyle(color: textLeftColor),
                  ),
                  Text(
                    textRight,
                    style: TextStyle(color: textRightColor),
                  ),
                ],
                onPressed: widget.enable
                    ? (int index) {
                        _changeSelect(index);
                      }
                    : null,
                borderRadius: BorderRadius.circular(20),
                borderWidth: 3,
                isSelected: _selections);
          }),
        ),
        AnimatedPositioned(top: 4, left: rPos, child: iconButton(), duration: Duration(milliseconds: widget.duration)),
      ]),
    );
  }

  Widget iconButton() {
    return Material(
        elevation: 2,
        type: MaterialType.button,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(1000),
        child: Container(
          height: widget.buttonDiameter,
          width: widget.buttonDiameter,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xF0F0F0), width: 2.0),
            color: widget.colorButton,
            borderRadius: BorderRadius.circular(1000),
          ),
        ));
  }

  void _move(int index) {
    toggleIndex = index;
    setState(() {
      if (!(!widget.isTreeStates && index == 1)) {
        switch (toggleIndex) {
          case 0:
            rPos = padding;
            background = widget.colorLeftBackground;
            textRight = widget.textLeft;
            textRightColor = Colors.white;
            textLeftColor = Colors.transparent;
            break;
          case 1:
            rPos = widget.width / 2 - widget.buttonDiameter / 2;
            background = widget.backgroundCenter;
            textRight = widget.textRight;
            textLeft = widget.textLeft;
            textRightColor = Colors.black;
            textLeftColor = Colors.black;
            break;
          case 2:
            rPos = widget.width - widget.buttonDiameter - padding;
            background = widget.colorRightBackground;
            textLeft = widget.textRight;
            textRightColor = Colors.transparent;
            textLeftColor = Colors.white;
            break;
          default:
        }
      } else {
        switch (toggleIndex) {
          case 0:
            rPos = padding;
            background = widget.colorLeftBackground;
            textRight = widget.textLeft;
            textRightColor = Colors.white;
            textLeftColor = Colors.transparent;
            break;
          case 1:
            rPos = widget.width - widget.buttonDiameter - padding;
            background = widget.colorRightBackground;
            textLeft = widget.textRight;
            textRightColor = Colors.transparent;
            textLeftColor = Colors.white;
            break;
          default:
        }
      }
    });
  }

  void _changeSelect(int index) {
    _move(index);
    widget.onChange(widget.values[toggleIndex]);
  }
}
