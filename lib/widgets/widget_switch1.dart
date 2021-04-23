import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetSwitch1 extends StatefulWidget {
  ///Key
  Key? key;

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

  ///size button
  late double buttonSize;

  WidgetSwitch1(
      {this.key,
      this.colorLeftIcon = Colors.red,
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
      this.enable = true,
      this.disableOpacity = 0.6,
      this.buttonSize = 20,
      this.values = const [0, 2, 1],
      this.initValue = 2})
      : assert((values.length >= 2 && values.length <= 3),
            'You must provide a list with 2 or 3 values.'),
        assert(width >= 60),
        assert(
            (isTreeStates && values.length == 3 ||
                !isTreeStates && values.length == 2),
            'You must provide a widget for 3 states with a list of 3 values.\n'
            'You must provide a widget for 2 states with a list of 2 values.'),
        assert(disableOpacity >= 0 && disableOpacity <= 1),
        assert(duration >= 200 && duration <= 2000),
        super(key: key);

  @override
  _WidgetSwitch1State createState() => _WidgetSwitch1State();
}

class _WidgetSwitch1State extends State<WidgetSwitch1> {
  ///Color right icon
  late Color _colorRightIcon;

  ///Color left icon
  late Color _colorLeftIcon;

  ///the result actual select state value
  int _toggleIndex = 1;

  ///Set all state to false, not used active states
  late List<bool> _selections;

  ///padding left and right side of button
  double _rPos = 0;

  ///padding left and right side of button
  double _padding = 4;

  ///  Color ColorCenter = Colors.grey;
  Color _background = Colors.grey;

  @override
  void initState() {
    super.initState();
    if (widget.isTreeStates) _selections = List.generate(3, (_) => false);
    if (!widget.isTreeStates) _selections = List.generate(2, (_) => false);
    _colorRightIcon = widget.colorRightIcon;
    _colorLeftIcon = widget.colorLeftIcon;
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
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minHeight: widget.buttonSize + 8),
          duration: Duration(milliseconds: widget.duration),

          /// Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
          width: widget.width,
          decoration: BoxDecoration(
              color: _background, borderRadius: BorderRadius.circular(40)),
          child: LayoutBuilder(builder: (context, constraints) {
            return ToggleButtons(
                borderColor: Colors.transparent,
                selectedColor: Colors.transparent,
                renderBorder: false,
                constraints:
                    BoxConstraints.expand(width: constraints.maxWidth / 3),

                ///number 3 is number of toggle buttons
                children: [
                  Icon(
                    widget.iconLeft,
                    color: _colorLeftIcon,
                    size: widget.buttonSize,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                  ),
                  Icon(
                    widget.iconRight,
                    color: _colorRightIcon,
                    size: widget.buttonSize,
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
              color: _background, borderRadius: BorderRadius.circular(20)),
          child: LayoutBuilder(builder: (context, constraints) {
            return ToggleButtons(
                borderColor: Colors.transparent,
                selectedColor: Colors.transparent,
                renderBorder: false,
                constraints:
                    BoxConstraints.expand(width: constraints.maxWidth / 2),

                ///number 2 is number of toggle buttons
                children: [
                  Icon(
                    widget.iconLeft,
                    color: _colorLeftIcon,
                    size: widget.buttonSize,
                  ),
                  Icon(
                    widget.iconRight,
                    color: _colorRightIcon,
                    size: widget.buttonSize,
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
            color: widget.colorButton,
            border: Border.all(color: Color(0xF0F0F0), width: 2.0),
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
            _rPos = _padding;
            _background = widget.colorLeftBackground;
            _colorRightIcon = Colors.transparent;
            _colorLeftIcon = Colors.transparent;
            break;
          case 1:
            _rPos = widget.width / 2 - widget.buttonSize / 2;
            _background = widget.backgroundCenter;
            _colorRightIcon = widget.colorRightIcon;
            _colorLeftIcon = widget.colorLeftIcon;
            break;
          case 2:
            _rPos = widget.width - widget.buttonSize - _padding;
            _background = widget.colorRightBackground;
            _colorLeftIcon = Colors.transparent;
            _colorRightIcon = Colors.transparent;
            break;
          default:
        }
      } else {
        switch (_toggleIndex) {
          case 0:
            _rPos = _padding;
            _background = widget.colorLeftBackground;
            _colorRightIcon = Colors.transparent;
            _colorLeftIcon = Colors.transparent;
            break;
          case 1:
            _rPos = widget.width - widget.buttonSize - _padding;
            _background = widget.colorRightBackground;
            _colorLeftIcon = Colors.transparent;
            _colorRightIcon = Colors.transparent;
            break;
          default:
        }
      }
    });
  }

  ///return value after selected change
  void _changeSelect(int index) {
    _move(index);
    widget.onChange(widget.values[_toggleIndex]);
  }
}
