import 'package:flutter/material.dart';

class NewWidgetButton extends StatelessWidget {
  const NewWidgetButton({
    Key? key,
    required this.color,
    required this.voidCallback,
    required this.string,
  }) : super(key: key);

  final Color color;
  final VoidCallback voidCallback;
  final String string;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: voidCallback,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            string,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
