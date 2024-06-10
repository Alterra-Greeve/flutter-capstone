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
  CustomAnimatedToggleSwitchState createState() =>
      CustomAnimatedToggleSwitchState();
}

class CustomAnimatedToggleSwitchState
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
        duration: const Duration(milliseconds: 300),
        width: 50,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              _value ? ColorsConstant.bgSwitchAct : ColorsConstant.neutral600,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              left: _value ? 30 : 0,
              right: _value ? 0 : 30,
              child: Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _value ? ColorsConstant.switchAct : ColorsConstant.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Warna dan opasitas bayangan
                      spreadRadius: 2, // Seberapa luas bayangan tersebar
                      blurRadius: 2, // Seberapa kabur bayangan
                      offset: const Offset(
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
