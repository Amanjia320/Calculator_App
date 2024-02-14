import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;

  App({
    required this.title,
    this.color = const Color(0xffa5a5a5),
    required this.onpress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      child: InkWell(
        onTap: onpress,
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
