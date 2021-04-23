import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetSwitch2 extends StatefulWidget {
  ///Key
  Key? key;

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

  ///button size
  late double buttonSize;

  WidgetSwitch2(
      {this.key,
      this.isTreeStates = true,
      this.colorLeftBackground = Colors.red,
      this.disableOpacity = 0.6,
      this.colorRightBackground = Colors.green,
      this.colorButton = const Color(0xffF0F0F0),
      this.width = 100,
      this.backgroundCenter = const Color(0xFFF0F0F0),
      required this.onChange,
      this.duration = 200,
      this.buttonSize = 25,
      this.enable = true,
      this.textLeft = "Off",
      this.textRight = "On",
      this.values = const [0, 2, 1],
      this.initValue = 2})
      : assert((values.length >= 2 && values.length <= 3),
            'You must provide a list with 2 or 3 values.'),
        assert(
            (isTreeStates && values.length == 3 ||
                !isTreeStates && values.length == 2),
            'You must provide a widget for 3 states with a list of 3 values.\n'
            'You must provide a widget for 2 states with a list of 2 values.'),
        assert(width >= 60),
        assert(disableOpacity >= 0 && disableOpacity <= 1),
        assert(duration >= 200 && duration <= 2000),
        super(key: key);

  @override
  _WidgetSwitch2State createState() => _WidgetSwitch2State();
}

class _WidgetSwitch2State extends State<WidgetSwitch2> {
  ///value text right
  late String _textRight;

  ///value text left
  late String _textLeft;

  ///the result actual select state value
  int _toggleIndex = 1;

  ///Set all state to false, not used active states
  late List<bool> _selections;

  ///padding left and right side of button
  double _rPos = 0;

  ///padding left and right side of button
  double padding = 4;

  ///  Color ColorCenter = Colors.grey;
  Color background = Colors.grey;

  ///Text color right
  Color textRightColor = Colors.black;

  ///Text color left
  Color textLeftColor = Colors.black;

  @override
  void initState() {
    super.initState();
    if (widget.isTreeStates) _selections = List.generate(3, (_) => false);
    if (!widget.isTreeStates) _selections = List.generate(2, (_) => false);

    _textLeft = widget.textLeft;
    _textRight = widget.textRight;

    _toggleIndex = widget.values.indexOf(widget.initValue) == -1
        ? 0
        : widget.values.indexOf(widget.initValue);
    _move(_toggleIndex);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isTreeStates ? _switch3Pos() : _switch2Pos();
  }

  ///build switch with 3 states
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
              color: background, borderRadius: BorderRadius.circular(20)),
          child: LayoutBuilder(builder: (context, constraints) {
            return ToggleButtons(
                borderColor: Colors.transparent,
                selectedColor: Colors.transparent,
                renderBorder: false,
                constraints:
                    BoxConstraints.expand(width: constraints.maxWidth / 3),
                //number 3 is number of toggle buttons
                children: [
                  Text(
                    _textLeft,
                    style: TextStyle(color: textLeftColor),
                  ),
                  Container(),
                  Text(
                    _textRight,
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
        AnimatedPositioned(
            top: 4,
            left: _rPos,
            child: _iconButton(),
            duration: Duration(milliseconds: widget.duration)),
      ]),
    );
  }

  ///build switch with 2 states
  Widget _switch2Pos() {
    return Opacity(
      opacity: widget.enable ? 1 : widget.disableOpacity,
      child: Stack(children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),

          /// Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
          constraints: BoxConstraints(minHeight: widget.buttonSize + 8),
          width: widget.width,
          decoration: BoxDecoration(
              color: background, borderRadius: BorderRadius.circular(20)),
          child: LayoutBuilder(builder: (context, constraints) {
            return ToggleButtons(
                borderColor: Colors.transparent,
                selectedColor: Colors.transparent,
                renderBorder: false,
                constraints:
                    BoxConstraints.expand(width: constraints.maxWidth / 2),

                ///number 2 is number of toggle buttons
                children: [
                  Text(
                    _textLeft,
                    style: TextStyle(color: textLeftColor),
                  ),
                  Text(
                    _textRight,
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
        AnimatedPositioned(
            top: 4,
            left: _rPos,
            child: _iconButton(),
            duration: Duration(milliseconds: widget.duration)),
      ]),
    );
  }

  ///build button
  Widget _iconButton() {
    return Material(
        elevation: 2,
        type: MaterialType.button,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(1000),
        child: Container(
          height: widget.buttonSize,
          width: widget.buttonSize,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xF0F0F0), width: 2.0),
            color: widget.colorButton,
            borderRadius: BorderRadius.circular(1000),
          ),
        ));
  }

  ///move button
  void _move(int index) {
    _toggleIndex = index;
    setState(() {
      if (!(!widget.isTreeStates && index == 1)) {
        switch (_toggleIndex) {
          case 0:
            _rPos = padding;
            background = widget.colorLeftBackground;
            _textRight = widget.textLeft;
            textRightColor = Colors.white;
            textLeftColor = Colors.transparent;
            break;
          case 1:
            _rPos = widget.width / 2 - widget.buttonSize / 2;
            background = widget.backgroundCenter;
            _textRight = widget.textRight;
            _textLeft = widget.textLeft;
            textRightColor = Colors.black;
            textLeftColor = Colors.black;
            break;
          case 2:
            _rPos = widget.width - widget.buttonSize - padding;
            background = widget.colorRightBackground;
            _textLeft = widget.textRight;
            textRightColor = Colors.transparent;
            textLeftColor = Colors.white;
            break;
          default:
        }
      } else {
        switch (_toggleIndex) {
          case 0:
            _rPos = padding;
            background = widget.colorLeftBackground;
            _textRight = widget.textLeft;
            textRightColor = Colors.white;
            textLeftColor = Colors.transparent;
            break;
          case 1:
            _rPos = widget.width - widget.buttonSize - padding;
            background = widget.colorRightBackground;
            _textLeft = widget.textRight;
            textRightColor = Colors.transparent;
            textLeftColor = Colors.white;
            break;
          default:
        }
      }
    });
  }

  ///return value on change
  void _changeSelect(int index) {
    _move(index);
    widget.onChange(widget.values[_toggleIndex]);
  }
}
