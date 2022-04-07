import 'package:flutter/material.dart';

class LootWidget extends StatelessWidget {
  const LootWidget({
    Key? key,
    required this.title,
    required this.platforms,
    required this.thumbnail,
    required this.price,
    required this.date,
  }) : super(key: key);

  final String title;
  final String platforms;
  final String thumbnail;
  final String price;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.yellow.shade700,
        ),
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 380,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.yellow.shade700,
            ),
          ),
          Image.network(thumbnail),
          Text(
            platforms,
            style: TextStyle(
              fontSize: 18,
              color: Colors.yellow.shade700,
            ),
          ),
          Text(
            'Was ' + price + ' now is FREE until ' + date,
            style: TextStyle(
              fontSize: 16,
              color: Colors.yellow.shade700,
            ),
          )
        ],
      ),
    );
  }
}
