import 'package:flutter/material.dart';

///
class StatsColumn extends StatelessWidget {
  ///
  const StatsColumn({
    Key? key,
    required this.label,
    required this.number,
  }) : super(key: key);

  ///
  final String label;

  ///
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          number.toString(),
          style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
