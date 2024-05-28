import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SlotsDayCard extends StatelessWidget {
  String? day;
  String? slots;

  SlotsDayCard({this.day, this.slots});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 75,
        width: 150,
        decoration: BoxDecoration(
          color: kLightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Text(
                  day ?? 'Today, 4 Nov',
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Text(
                slots ?? 'no slots available',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
