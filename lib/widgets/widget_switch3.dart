import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetSwitch3 extends StatefulWidget {
  /// return the value on change tap
  final ValueChanged<dynamic> onChange;

  ///Right text
  late String textRight;

  ///Left Text
  late String textLeft;

  ///Left Text
  late String textCenter;

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

  ///button size
  late double buttonSize;

  WidgetSwitch3(
      {this.isTreeStates = true,
      this.colorLeftBackground = Colors.red,
      this.disableOpacity = 0.6,
      this.colorRightBackground = Colors.green,
      this.colorButton = const Color(0xffF0F0F0),
      this.width = 120,
      this.backgroundCenter = const Color(0xFFF0F0F0),
      required this.onChange,
      this.duration = 200,
      this.buttonSize = 40,
      this.enable = true,
      this.textLeft = "Off",
      this.textRight = "On",
      this.textCenter = "?",
      this.values = const [0, 1, 2],
      this.initValue = 1});

  @override
  _WidgetSwitch3State createState() => _WidgetSwitch3State();
}

class _WidgetSwitch3State extends State<WidgetSwitch3> {
  late Color colorRightBackground;
  late Color colorLeftBackground;
  late Color backgroundDefault;
  String textRight = "";
  String textLeft = "";
  String textButton = "";

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

  ///Text color / left, right, center e button text
  Color textRightColor = Colors.black;
  Color textLeftColor = Colors.black;
  Color textCenterColor = Colors.black;
  Color textButtonColor = Colors.black;

  ///Text button color active
  Color textButtonColorActive = Colors.white;

  @override
  void initState() {
    super.initState();
    if (widget.isTreeStates) _selections = List.generate(3, (_) => false);
    if (!widget.isTreeStates) _selections = List.generate(2, (_) => false);

    textLeft = widget.textLeft;
    textRight = widget.textRight;

    toggleIndex = widget.values.indexOf(widget.initValue) == -1
        ? 0
        : widget.values.indexOf(widget.initValue);
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
          constraints: BoxConstraints(minHeight: widget.buttonSize + 8),
          duration: Duration(milliseconds: widget.duration),

          /// Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
          width: widget.width,
          decoration: BoxDecoration(
            color: Color(0XFFF0F0F0),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return ToggleButtons(
                selectedColor: Colors.transparent,
                color: Colors.transparent,
                renderBorder: false,

                ///number 3 is number of toggle buttons
                constraints:
                    BoxConstraints.expand(width: constraints.maxWidth / 3),
                children: [
                  Text(
                    textLeft,
                    style: TextStyle(
                      color: textLeftColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(),
                  Container(
                    child: Text(
                      textRight,
                      style: TextStyle(color: textRightColor),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.zero,
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
        AnimatedPositioned(
            top: 4,
            left: rPos,
            child: _iconButton(),
            duration: Duration(milliseconds: widget.duration)),
      ]),
    );
  }

  Widget _switch2Pos() {
    return Opacity(
      opacity: widget.enable ? 1 : widget.disableOpacity,
      child: Stack(children: [
        AnimatedContainer(
          constraints: BoxConstraints(minHeight: widget.buttonSize + 8),
          duration: Duration(milliseconds: widget.duration),

          /// Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
          width: widget.width,
          decoration: BoxDecoration(
            color: Color(0XFFF0F0F0),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return ToggleButtons(
                selectedColor: Colors.transparent,
                color: Colors.transparent,
                renderBorder: false,

                ///number 3 is number of toggle buttons
                constraints:
                    BoxConstraints.expand(width: constraints.maxWidth / 2),
                children: [
                  Text(
                    textLeft,
                    style: TextStyle(
                      color: textLeftColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    child: Text(
                      textRight,
                      style: TextStyle(color: textRightColor),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.zero,
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
        AnimatedPositioned(
            top: 4,
            left: rPos,
            child: _iconButton(),
            duration: Duration(milliseconds: widget.duration)),
      ]),
    );
  }

  Widget _iconButton() {
    double bevel = 4;
    Offset blurOffset = new Offset(2, 2);

    return Container(
      height: widget.buttonSize,
      width: widget.buttonSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(bevel),
          color: background,
          boxShadow: [
            BoxShadow(
              blurRadius: bevel,
              offset: -blurOffset,
              color: background,
            ),
            BoxShadow(
                blurRadius: bevel,
                offset: blurOffset,
                color: Colors.grey.shade400)
          ]

          // borderRadius: BorderRadius.circular(12.0),
          ),
      child: Center(
        child: Text(
          textButton,
          style: TextStyle(color: textButtonColorActive),
        ),
      ),
    );
  }

  void _move(int index) {
    toggleIndex = index;
    setState(() {
      if (!(!widget.isTreeStates && index == 1)) {
        switch (toggleIndex) {
          case 0:
            rPos = padding;
            background = widget.colorLeftBackground;
            textRightColor = Colors.black;
            textLeftColor = Colors.white;
            textButton = widget.textLeft;
            textButtonColorActive = Colors.white;
            break;
          case 1:
            rPos = widget.width / 2 - widget.buttonSize / 2;
            background = widget.backgroundCenter;
            textRight = widget.textRight;
            textLeft = widget.textLeft;
            textRightColor = Colors.black;
            textLeftColor = Colors.black;
            textButtonColorActive = Colors.black;
            textButton = widget.textCenter;
            break;
          case 2:
            rPos = widget.width - widget.buttonSize - padding;
            background = widget.colorRightBackground;
            textRightColor = Colors.white;
            textLeftColor = Colors.black;
            textButton = widget.textRight;
            textButtonColorActive = Colors.white;

            break;
          default:
        }
      } else {
        switch (toggleIndex) {
          case 0:
            rPos = padding;
            background = widget.colorLeftBackground;
            textRightColor = Colors.black;
            textLeftColor = Colors.white;
            textButton = widget.textLeft;
            break;
          case 1:
            rPos = widget.width - widget.buttonSize - padding;
            background = widget.colorRightBackground;
            textRightColor = Colors.white;
            textLeftColor = Colors.black;
            textButton = widget.textRight;
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
