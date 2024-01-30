import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/list_item.dart';
import '../components/search_field.dart';
import '../models/git_repository_model.dart';
import '../models/repository_data_model.dart';
import '../providers/repository_list_provider.dart';
import 'repository_detail_page.dart';

/// Name: RepositoryListPage
/// Description: リポジトリ一覧ページ
class RepositoryListPage extends StatelessWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositories'),
      ),
      body: const _RepositoryListPageScreen(),
    );
  }
}

/// Name: RepositoryListPage
/// Description: リポジトリ一覧の画面概要コンポーネント
class _RepositoryListPageScreen extends ConsumerWidget {
  const _RepositoryListPageScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      key: const Key('repository_list_page_screen'),
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
    return ListView.separated(
      key: const Key('repository_list'),
      itemCount: listRepository.length,
      itemBuilder: (context, index) {
        final item = listRepository[index];
        return ListItem(
          key: Key('repository_list_item_$index'),
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
      separatorBuilder: (context, index) {
        return const Divider();
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
      key: Key('no_repository_data'),
      child: SizedBox(
        height: 150.0,
        child: Column(
          children: [
            Text('Repository not found.'),
            Text('Please enter the search word and search.')
          ],
        ),
      ),
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
        key: Key('loading_repository_data'),
        child: CircularProgressIndicator(),
      );
    } else if (data is ResponseRepositoryData) {
      return _RepositoryListView(
        listRepository: data.data.items,
      );
    }
    return const Placeholder();
  }
}
