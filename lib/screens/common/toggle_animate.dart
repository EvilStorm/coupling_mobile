import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
  final double hight;
  final double width;

  const AnimatedToggle({
    Key? key,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    this.hight = 40,
    this.width = 200,
  }) : super(key: key);
  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.hight,
      margin: const EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              setState(() {});
            },
            child: Container(
              width: widget.width,
              height: widget.hight,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.01),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.values.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: Text(
                      widget.values[index],
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: Get.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xAA000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: widget.width,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.decelerate,
              alignment: initialPosition
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: widget.width / 1.5,
                height: widget.hight,
                decoration: ShapeDecoration(
                  color: widget.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.01),
                  ),
                ),
                child: Text(
                  initialPosition ? widget.values[0] : widget.values[1],
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: Get.width * 0.045,
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
