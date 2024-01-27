import 'package:flutter/material.dart';

import 'components/list_item.dart';
import 'components/search_field.dart';

class RepositoryListPageScreen extends StatelessWidget {
  const RepositoryListPageScreen({super.key, required this.listRepository});
  final List<String> listRepository;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(
          onFixedText: (text) {
            print(text);
          },
        ),
        Expanded(
          child: (listRepository.isEmpty)
              ? const NoItemView()
              : RepositoryListView(listRepository: listRepository),
        ),
      ],
    );
  }
}

class RepositoryListView extends StatelessWidget {
  const RepositoryListView({super.key, required this.listRepository});
  final List<String> listRepository;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listRepository.length,
      itemBuilder: (context, index) {
        return const ListItem();
      },
    );
  }
}

class NoItemView extends StatelessWidget {
  const NoItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Repository not found'),
    );
  }
}
