import 'package:flutter/material.dart';

import '../models/git_repository_model.dart';

/// Name: ListItem
/// Description: リポジトリ一覧のリストアイテム
class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.onTap,
    required this.repositoryItem,
  });

  /// タップ時のコールバック
  final VoidCallback onTap;

  /// リポジトリ詳細情報
  final Items repositoryItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: InkWell(
          onTap: onTap,
          child: Card(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('name: ${repositoryItem.name ?? ''}'),
                      Text('owner name: ${repositoryItem.owner?.login ?? ''}'),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_right_alt_rounded),
              ],
            ),
          ),
        ));
  }
}
