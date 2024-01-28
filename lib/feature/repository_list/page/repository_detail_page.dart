import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/animated_icon.dart';
import '../models/git_repository_model.dart';

enum RepositoryContent {
  name,
  ownerName,
  description,
  language,
  stargazersCount,
  watchersCount,
  forksCount,
  openIssuesCount,
}

/// Name: RepositoryDetailPage
/// Description: リポジトリ詳細ページ
class RepositoryDetailPage extends StatelessWidget {
  const RepositoryDetailPage({super.key, required this.repositoryItem});
  final Items repositoryItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repository Detail'),
      ),
      body: _RepositoryDetailScreen(repositoryItem: repositoryItem),
    );
  }
}

///りポジトリ詳細ページの画面
class _RepositoryDetailScreen extends StatelessWidget {
  const _RepositoryDetailScreen({required this.repositoryItem});
  final Items repositoryItem;

  @override
  Widget build(BuildContext context) {
    final children = RepositoryContent.values
        .map<Widget>(
          (e) => _TitleConentWidget(
            keyName: e.name,
            title: e.title,
            content: e.buildContent(repositoryItem),
          ),
        )
        .toList();
    children.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          key: const Key('open_web_button'),
          onPressed: (repositoryItem.htmlUrl != null)
              ? () async {
                  final url = Uri.parse(repositoryItem.htmlUrl!);
                  if (!await launchUrl(url)) {}
                }
              : null,
          child: const Text('Open URL'),
        ),
      ),
    );
    return SingleChildScrollView(
      key: const Key('repository_detail_screen'),
      child: Column(
        children: children,
      ),
    );
  }
}

class _TitleConentWidget extends StatelessWidget {
  const _TitleConentWidget({
    required this.keyName,
    required this.title,
    required this.content,
  });
  final String keyName;
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      key: Key('title_content_widget_$keyName'),
      children: [
        Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            )),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: content,
            ),
          ),
        ),
      ],
    );
  }
}

extension RepositoryContentExtension on RepositoryContent {
  String get name {
    switch (this) {
      case RepositoryContent.name:
        return 'name';
      case RepositoryContent.ownerName:
        return 'owner_name';
      case RepositoryContent.description:
        return 'description';
      case RepositoryContent.language:
        return 'language';
      case RepositoryContent.stargazersCount:
        return 'stargazers_count';
      case RepositoryContent.watchersCount:
        return 'watchers_count';
      case RepositoryContent.forksCount:
        return 'forks_count';
      case RepositoryContent.openIssuesCount:
        return 'open_issues_count';
    }
  }

  String get title {
    switch (this) {
      case RepositoryContent.name:
        return 'リポジトリ名';
      case RepositoryContent.ownerName:
        return 'オーナー';
      case RepositoryContent.description:
        return 'リポジトリの説明';
      case RepositoryContent.language:
        return '開発言語';
      case RepositoryContent.stargazersCount:
        return 'スター数';
      case RepositoryContent.watchersCount:
        return 'ウォッチャー数';
      case RepositoryContent.forksCount:
        return 'フォーク数';
      case RepositoryContent.openIssuesCount:
        return 'イシュー数';
    }
  }

  Widget buildContent(Items repositoryItem) {
    switch (this) {
      case RepositoryContent.name:
        return Text('${repositoryItem.name}');
      case RepositoryContent.ownerName:
        return Column(
          children: [
            Container(
              width: 60.0,
              height: 60.0,
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
            const SizedBox(height: 8.0),
            Text(repositoryItem.owner?.login ?? ''),
          ],
        );
      case RepositoryContent.description:
        return Text(repositoryItem.description ?? '未設定');
      case RepositoryContent.language:
        return Text(repositoryItem.language ?? '未設定');
      case RepositoryContent.stargazersCount:
        return Row(
          children: [
            const AnimationIcon(icon: Icons.star, size: 60.0),
            Text(' x ${repositoryItem.stargazersCount}'),
          ],
        );
      case RepositoryContent.watchersCount:
        return Row(
          children: [
            const Icon(Icons.remove_red_eye),
            Text(' x ${repositoryItem.watchersCount}'),
          ],
        );
      case RepositoryContent.forksCount:
        return Row(
          children: [
            const Icon(Icons.call_split),
            Text(' x ${repositoryItem.forksCount}'),
          ],
        );
      case RepositoryContent.openIssuesCount:
        return Row(
          children: [
            const Icon(Icons.error),
            Text(' x ${repositoryItem.openIssuesCount}'),
          ],
        );
    }
  }
}
