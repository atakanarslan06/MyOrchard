import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimButton extends StatelessWidget {
  const AnimButton({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.handleButtonClick,
  }) : super(key: key);
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final Function handleButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: ClipRRect(
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(buttonColor),
          ),
          onPressed: () {
            handleButtonClick();
          },
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}