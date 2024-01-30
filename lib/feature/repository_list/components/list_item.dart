import 'package:flutter/material.dart';

import '../models/repository_data_model.dart';

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
          child: ListTile(
            leading: (repositoryItem.owner?.avatarUrl != null)
                ? CircleAvatar(
                    backgroundImage:
                        NetworkImage(repositoryItem.owner!.avatarUrl!),
                  )
                : const SizedBox.shrink(),
            title: Text(
              'repository: ${repositoryItem.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              'owner: ${repositoryItem.owner!.login}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ));
  }
}
