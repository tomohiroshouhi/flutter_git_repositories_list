import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/list_item.dart';
import '../components/search_field.dart';
import '../models/git_repository_model.dart';
import '../providers/repository_list_provider.dart';
import 'repository_detail_page.dart';

/// Name: RepositoryListPage
/// Description: リポジトリ一覧ページ
class RepositoryListPage extends StatelessWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Repositories'),
      ),
      body: const _RepositoryListPageScreen(),
    ));
  }
}

/// Name: RepositoryListPage
/// Description: リポジトリ一覧の画面概要コンポーネント
class _RepositoryListPageScreen extends ConsumerWidget {
  const _RepositoryListPageScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SearchField(
          onFixedText: (text) {
            ref
                .read(repositoryListProvider.notifier)
                .fetchListData(query: text);
          },
        ),
        const Expanded(
          child: _BuildSelectorResultView(),
        ),
      ],
    );
  }
}

/// Name: RepositoryListView
/// Description: リポジトリ検索結果の一覧画面
class _RepositoryListView extends StatelessWidget {
  const _RepositoryListView({required this.listRepository});
  final List<Items> listRepository;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listRepository.length,
      itemBuilder: (context, index) {
        final item = listRepository[index];
        return ListItem(
          repositoryItem: item,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RepositoryDetailPage(
                  repositoryItem: item,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// Name: NoItemView
/// Description: リポジトリが見つからなかった場合の画面
class _NoItemView extends StatelessWidget {
  const _NoItemView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Repository not found'),
    );
  }
}

/// Name: BuildSelectorResultView
/// Description: リポジトリ検索結果の一覧画面の表示を切り替えるコンポーネント
class _BuildSelectorResultView extends ConsumerWidget {
  const _BuildSelectorResultView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(repositoryListProvider);

    if (data is NoRepositoryData) {
      return const _NoItemView();
    } else if (data is RepositoryDataLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (data is SeccessRepositoryData) {
      return _RepositoryListView(
        listRepository: data.items,
      );
    }
    return const Placeholder();
  }
}
