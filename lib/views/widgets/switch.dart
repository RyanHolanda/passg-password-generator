import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({
    Key? key,
    required this.value,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              trackColor: Theme.of(context).primaryColor.withOpacity(0.1),
              activeColor: Colors.blue,
              value: value,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
