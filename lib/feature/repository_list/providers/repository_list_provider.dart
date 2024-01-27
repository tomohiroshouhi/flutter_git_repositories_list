import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/git_repository_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

final repositoryListProvider =
    StateNotifierProvider<RepositoryListProvider, RepositoryData>(
        (_) => RepositoryListProvider());

class RepositoryListProvider extends StateNotifier<RepositoryData> {
  RepositoryListProvider() : super(NoRepositoryData());

  Future<void> fetchListData({String query = ''}) async {
    state = RepositoryDataLoading();

    var url = Uri.https('api.github.com', '/search/repositories', {'q': query});
    var response = await http.get(url, headers: {
      'Accept': 'application/vnd.github.v3+json',
      'X-GitHub-Api-Version': '2022-11-28'
    });

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      final successData = SeccessRepositoryData.fromJson(jsonResponse);
      if (successData.items.isEmpty) {
        state = NoRepositoryData();
      } else {
        state = successData;
      }
    } else {
      state = NoRepositoryData();
    }
  }
}
