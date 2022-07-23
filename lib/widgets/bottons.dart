import 'package:flutter/material.dart';

import '../Style/colors.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double iconSize;
  final paddingReduce;
  final Color color;

  CircleButton(
      {required this.onPressed,
      required this.icon,
      this.iconSize = 30,
      required this.color,
      this.paddingReduce = 0});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minWidth: 0,
      elevation: 5,
      color: color,
      onPressed: onPressed,
      padding: EdgeInsets.all((iconSize / 2) - paddingReduce),
      child: Icon(icon, size: iconSize),
      shape: CircleBorder(),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  RoundedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        disabledColor: kAccentColor.withOpacity(0.25),
        padding: EdgeInsets.symmetric(vertical: 14),
        highlightElevation: 0,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: onPressed,
        child: Text(text, style: Theme.of(context).textTheme.button),
      ),
    );
  }
}
