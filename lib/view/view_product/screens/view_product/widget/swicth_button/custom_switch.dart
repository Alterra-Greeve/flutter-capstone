import 'package:flutter/material.dart';
import 'package:greeve/utils/constants/colors_constant.dart';

class CustomAnimatedToggleSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomAnimatedToggleSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomAnimatedToggleSwitchState createState() =>
      _CustomAnimatedToggleSwitchState();
}

class _CustomAnimatedToggleSwitchState
    extends State<CustomAnimatedToggleSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  void _toggleSwitch() {
    setState(() {
      _value = !_value;
      widget.onChanged(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 50,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              _value ? ColorsConstant.bg_switch_act : ColorsConstant.neutral600,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              left: _value ? 30 : 0,
              right: _value ? 0 : 30,
              child: Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _value ? ColorsConstant.switch_act : ColorsConstant.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Warna dan opasitas bayangan
                      spreadRadius: 2, // Seberapa luas bayangan tersebar
                      blurRadius: 2, // Seberapa kabur bayangan
                      offset: Offset(
                          0, 1), // Posisi bayangan relatif terhadap kontainer
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
