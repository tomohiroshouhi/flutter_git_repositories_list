import 'package:flutter/material.dart';

import 'repository_list_screen.dart';

class RepositoryListPage extends StatelessWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Repositories'),
      ),
      body: const RepositoryListPageScreen(
        listRepository: [
          'Repository 1',
          'Repository 2',
          'Repository 3',
          'Repository 4',
          'Repository 5',
          'Repository 6',
          'Repository 7',
          'Repository 8',
          'Repository 9',
          'Repository 10',
          'Repository 11',
          'Repository 12',
          'Repository 13',
          'Repository 14',
          'Repository 15',
          'Repository 16',
          'Repository 17',
          'Repository 18',
          'Repository 19',
          'Repository 20',
        ],
      ),
    ));
  }
}
