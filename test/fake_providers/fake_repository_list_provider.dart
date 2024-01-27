import 'package:rep_list/feature/repository_list/models/git_repository_model.dart';
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

SeccessRepositoryData get sampleData => SeccessRepositoryData(
      totalCount: 1,
      incompleteResults: false,
      items: [
        Items(
          id: 1,
          nodeId: '1',
          name: 'name',
          fullName: 'fullName',
          private: false,
          owner: Owner(
            login: 'login',
            id: 1,
            nodeId: '1',
            avatarUrl: 'https://avatars.githubusercontent.com/u/43435518?v=4',
            gravatarId: 'gravatarId',
            url: 'url',
            htmlUrl: 'htmlUrl',
            followersUrl: 'followersUrl',
            followingUrl: 'followingUrl',
            gistsUrl: 'gistsUrl',
            starredUrl: 'starredUrl',
            subscriptionsUrl: 'subscriptionsUrl',
            organizationsUrl: 'organizationsUrl',
            reposUrl: 'reposUrl',
            eventsUrl: 'eventsUrl',
            receivedEventsUrl: 'receivedEventsUrl',
            type: 'type',
            siteAdmin: false,
          ),
          htmlUrl: 'htmlUrl',
          description: 'description',
          fork: false,
          url: 'url',
          forksUrl: 'forksUrl',
          keysUrl: 'keysUrl',
          collaboratorsUrl: 'collaboratorsUrl',
          teamsUrl: 'teamsUrl',
          hooksUrl: 'hooksUrl',
          issueEventsUrl: 'issueEventsUrl',
          eventsUrl: 'eventsUrl',
          assigneesUrl: 'assigneesUrl',
          branchesUrl: 'branchesUrl',
          tagsUrl: 'tagsUrl',
          blobsUrl: 'blobsUrl',
          gitTagsUrl: 'gitTagsUrl',
          gitRefsUrl: 'gitRefsUrl',
          treesUrl: 'treesUrl',
          statusesUrl: 'statusesUrl',
          languagesUrl: 'languagesUrl',
          stargazersUrl: 'stargazersUrl',
          contributorsUrl: 'contributorsUrl',
          subscribersUrl: 'subscribersUrl',
          subscriptionUrl: 'subscriptionUrl',
          commitsUrl: 'commitsUrl',
          gitCommitsUrl: 'gitCommitsUrl',
          commentsUrl: 'commentsUrl',
          issueCommentUrl: 'issueCommentUrl',
          contentsUrl: 'contentsUrl',
          compareUrl: 'compareUrl',
          mergesUrl: 'mergesUrl',
          archiveUrl: 'archiveUrl',
          downloadsUrl: 'downloadsUrl',
          issuesUrl: 'issuesUrl',
          pullsUrl: 'pullsUrl',
          milestonesUrl: 'mile',
          notificationsUrl: 'notificationsUrl',
          labelsUrl: 'labelsUrl',
          releasesUrl: 'releasesUrl',
          deploymentsUrl: 'deploymentsUrl',
          createdAt: 'createdAt',
          updatedAt: 'updatedAt',
          pushedAt: 'pushedAt',
          gitUrl: 'gitUrl',
          sshUrl: 'sshUrl',
          cloneUrl: 'cloneUrl',
          svnUrl: 'svnUrl',
          homepage: 'homepage',
          size: 1,
          stargazersCount: 1,
          watchersCount: 1,
          language: 'language',
          hasIssues: false,
          hasProjects: false,
          hasDownloads: false,
          hasWiki: false,
          hasPages: false,
          forksCount: 1,
          mirrorUrl: 'mirrorUrl',
          archived: false,
          disabled: false,
          openIssuesCount: 1,
          license: {},
          forks: 1,
          openIssues: 1,
          watchers: 1,
          defaultBranch: 'defaultBranch',
          score: 1,
        ),
      ],
    );
