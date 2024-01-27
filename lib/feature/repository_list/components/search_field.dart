import 'package:flutter/material.dart';

/// Name: SearchField
/// Description: 検索フィールド
class SearchField extends StatelessWidget {
  SearchField({super.key, required this.onFixedText});

  /// 検索ボタン押下時,サブミットのコールバック
  final void Function(String) onFixedText;

  /// テキストコントローラー
  final TextEditingController _controller = TextEditingController();

  /// フォーカスノード
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                focusNode: _focusNode,
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  contentPadding: EdgeInsets.all(16),
                ),
                onSubmitted: (text) {
                  onFixedText.call(text);
                  _focusNode.unfocus();
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                onFixedText.call(_controller.text);
                _focusNode.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }
}
