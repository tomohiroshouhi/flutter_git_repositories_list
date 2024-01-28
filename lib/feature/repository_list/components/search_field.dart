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
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                key: const Key('search_text_field'),
                textInputAction: TextInputAction.search,
                focusNode: _focusNode,
                controller: _controller,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  contentPadding: EdgeInsets.only(
                    right: 16.0,
                    left: 16.0,
                    bottom: 8.0,
                  ),
                ),
                onSubmitted: (text) {
                  onFixedText.call(text);
                  _focusNode.unfocus();
                },
              ),
            ),
            IconButton(
              key: const Key('search_icon_button'),
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
