import 'package:flutter/material.dart';

List<Widget> _generateDots(int dots, int position) {
  List<Widget> items = <Widget>[];

  for (int i = 0; i < dots; i++) {
    items.add(Expanded(
      child: Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == position ? Colors.white : Colors.grey),
      ),
    ));
  }
  return items;
}

class Indicator extends StatelessWidget {
  final int position;
  final int dots;
  const Indicator({Key? key, required this.position, required this.dots})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _generateDots(dots, position),
      ),
    );
  }
}
