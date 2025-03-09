import 'package:flutter/material.dart';


// Widget for Info Card
  Widget _infoCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Widget for Table Header
  Widget _tableHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("No", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("Time", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("Place", style: TextStyle(fontWeight: FontWeight.bold)),
        Icon(Icons.check_box_outline_blank),
      ],
    );
  }

  // Widget for Table Row
  Widget _tableRow(
      int no, String name, String time, String place, bool checked) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 10, height: 30, child: Text("$no")),
        SizedBox(width: 100, height: 30, child: Text(name)),
        Text(time),
        Text(place),
        Icon(checked ? Icons.check_box : Icons.check_box_outline_blank,
            color: checked
                ? const Color.fromARGB(255, 76, 124, 175)
                : Colors.grey),
      ],
    );
  }

