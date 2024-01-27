import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key, required this.onFixedText});

  final void Function(String) onFixedText;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  contentPadding: EdgeInsets.all(16),
                ),
                onSubmitted: (text) {
                  onFixedText.call(text);
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                onFixedText.call(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
