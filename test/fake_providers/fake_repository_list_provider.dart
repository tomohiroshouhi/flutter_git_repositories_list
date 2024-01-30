import 'package:rep_list/feature/repository_list/models/git_repository_model.dart';
import 'package:rep_list/feature/repository_list/models/repository_data_model.dart';
import 'package:rep_list/feature/repository_list/providers/repository_list_provider.dart';

enum Mode {
  success,
  loading,
  noData,
}

class FakeRepositoryListProvider extends RepositoryListProvider {
  FakeRepositoryListProvider({required this.mode});
  final Mode mode;

  @override
  Future<void> fetchListData({String? query}) async {
    state = RepositoryDataLoading();
    await Future<void>.delayed(const Duration(seconds: 1));

    switch (mode) {
      case Mode.success:
        state = sampleData;
        break;
      case Mode.loading:
        state = RepositoryDataLoading();
        break;
      case Mode.noData:
        state = NoRepositoryData();
        break;
    }
  }
}

ResponseRepositoryData get sampleData => ResponseRepositoryData(
      data: const SeccessRepositoryData(
        totalCount: 1,
        incompleteResults: false,
        items: [
          Items(
            id: 1,
            name: 'name',
            owner: Owner(
              login: 'login',
              avatarUrl: 'https://avatars.githubusercontent.com/u/43435518?v=4',
            ),
            htmlUrl: 'htmlUrl',
            description: 'description',
            stargazersCount: 1,
            watchersCount: 1,
            language: 'language',
            forksCount: 1,
            openIssues: 1,
            score: 1,
          ),
        ],
      ),
    );
