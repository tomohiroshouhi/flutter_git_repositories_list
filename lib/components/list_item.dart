import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 150,
        child: Card(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('Title'),
                    Text('Description'),
                  ],
                ),
              ),
              Icon(Icons.star),
            ],
          ),
        ));
  }
}
