
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetSwitch1 extends StatefulWidget {
  /// return the value on change tap
  final ValueChanged<dynamic> onChange;

  /// background colorRight state
  late Color colorRightBackground;

  /// color rightIcon state
  late Color colorRightIcon;

  /// IconRight state
  final IconData iconRight;

  /// colorLeftBackground state
  late Color colorLeftBackground;

  /// colorLeftIcon state
  late Color colorLeftIcon;

  /// colorLeftBackground state
  final IconData iconLeft;

  /// Background off state
  final Color colorButton;

  ///Set disable opacity
  late double disableOpacity;

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

  ///Icon size
  late double iconSize;

  ///button diameter
  late double buttonDiameter;

  WidgetSwitch1(
      {this.colorLeftIcon = Colors.red,
      this.isTreeStates = true,
      this.colorLeftBackground = Colors.red,
      this.iconLeft = Icons.close,
      this.colorRightIcon = Colors.green,
      this.colorRightBackground = Colors.green,
      this.iconRight = Icons.check,
      this.colorButton = const Color(0xffF0F0F0),
      this.width = 100,
      this.backgroundCenter = const Color(0xFFF0F0F0),
      required this.onChange,
      this.duration = 200,
      this.buttonDiameter = 25,
      this.enable = true,
      this.disableOpacity = 0.6,
      this.iconSize = 20,
      this.values = const [0, 1, 2],
      this.initValue = 1});

  @override
  _WidgetSwitch1State createState() => _WidgetSwitch1State();
}

class _WidgetSwitch1State extends State<WidgetSwitch1> {
  late Color colorRightBackground;
  late Color colorRightIcon;
  late Color colorLeftIcon;
  late Color colorLeftBackground;
  late Color backgroundDefault;

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

  @override
  void initState() {
    super.initState();
    if (widget.isTreeStates) _selections = List.generate(3, (_) => false);
    if (!widget.isTreeStates) _selections = List.generate(2, (_) => false);
    colorRightIcon = widget.colorRightIcon;
    colorLeftIcon = widget.colorLeftIcon;
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
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minHeight: widget.buttonDiameter + 8),
          duration: Duration(milliseconds: widget.duration),
          /// Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
          width: widget.width,
          decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(40)),
          child: LayoutBuilder(builder: (context, constraints) {
            return ToggleButtons(
                borderColor: Colors.transparent,
                selectedColor: Colors.transparent,
                renderBorder: false,
                constraints: BoxConstraints.expand(width: constraints.maxWidth / 3),
                ///number 3 is number of toggle buttons
                children: [
                  Icon(
                    widget.iconLeft,
                    color: colorLeftIcon,
                    size: widget.iconSize,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                  ),
                  Icon(
                    widget.iconRight,
                    color: colorRightIcon,
                    size: widget.iconSize,
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
                  Icon(
                    widget.iconLeft,
                    color: colorLeftIcon,
                    size: widget.iconSize,
                  ),
                  Icon(
                    widget.iconRight,
                    color: colorRightIcon,
                    size: widget.iconSize,
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
            color: widget.colorButton,
            border: Border.all(color: Color(0xF0F0F0), width: 2.0),
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
            colorRightIcon = Colors.transparent;
            colorLeftIcon = Colors.transparent;
            break;
          case 1:
            rPos = widget.width / 2 - widget.buttonDiameter / 2;
            background = widget.backgroundCenter;
            colorRightIcon = widget.colorRightIcon;
            colorLeftIcon = widget.colorLeftIcon;
            break;
          case 2:
            rPos = widget.width - widget.buttonDiameter - padding;
            background = widget.colorRightBackground;
            colorLeftIcon = Colors.transparent;
            colorRightIcon = Colors.transparent;
            break;
          default:
        }
      } else {
        switch (toggleIndex) {
          case 0:
            rPos = padding;
            background = widget.colorLeftBackground;
            colorRightIcon = Colors.transparent;
            colorLeftIcon = Colors.transparent;
            break;
          case 1:
            rPos = widget.width - widget.buttonDiameter - padding;
            background = widget.colorRightBackground;
            colorLeftIcon = Colors.transparent;
            colorRightIcon = Colors.transparent;
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
