import 'package:flutter/material.dart';

class AlarmTimeCard extends StatefulWidget {
  final double height;
  final double width;
  final String time;
  final bool isSelected;
  final VoidCallback? onSelect;

  AlarmTimeCard({
    required this.height,
    required this.width,
    required this.time,
    required this.isSelected,
    this.onSelect,
  });

  @override
  _AlarmTimeCardState createState() => _AlarmTimeCardState();
}

class _AlarmTimeCardState extends State<AlarmTimeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelect,
      child: Card(
        color: widget.isSelected ? Colors.blue : Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.time,
            style: TextStyle(
              fontSize: 12.0,
              color: widget.isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
