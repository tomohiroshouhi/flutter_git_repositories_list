import 'package:flutter/material.dart';

import '../models/git_repository_model.dart';

/// Name: RepositoryDetailPage
/// Description: リポジトリ詳細ページ
class RepositoryDetailPage extends StatelessWidget {
  const RepositoryDetailPage({super.key, required this.repositoryItem});
  final Items repositoryItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Repository Detail'),
        ),
        body: _RepositoryDetailScreen(repositoryItem: repositoryItem),
      ),
    );
  }
}

///りポジトリ詳細ページの画面
class _RepositoryDetailScreen extends StatelessWidget {
  const _RepositoryDetailScreen({super.key, required this.repositoryItem});
  final Items repositoryItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('リポジトリ名: ${repositoryItem.name}'),
          Row(
            children: [
              Text('オーナー名: ${repositoryItem.owner?.login}'),
              Container(
                width: 110.0,
                height: 110.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: (repositoryItem.owner?.avatarUrl != null)
                      ? DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(repositoryItem.owner!.avatarUrl!))
                      : null,
                ),
                child: (repositoryItem.owner?.avatarUrl == null)
                    ? const Center(child: Icon(Icons.person))
                    : null,
              ),
            ],
          ),
          Text('リポジトリの説明: ${repositoryItem.description}'),
          Text('開発言語: ${repositoryItem.language}'),
          Text('スター数: ${repositoryItem.stargazersCount}'),
          Text('ウォッチャー数: ${repositoryItem.watchersCount}'),
          Text('フォーク数: ${repositoryItem.forksCount}'),
          Text('イシュー数: ${repositoryItem.openIssuesCount}'),
        ],
      ),
    );
  }
}
