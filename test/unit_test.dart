import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:rep_list/feature/repository_list/models/git_repository_model.dart';
import 'package:rep_list/feature/repository_list/models/repository_data_model.dart';
import 'package:rep_list/feature/repository_list/providers/repository_list_provider.dart';

class Listener extends Mock {
  void call(RepositoryData? previous, RepositoryData value);
}

void main() {
  test(
    'Provider Change State Test',
    () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final listener = Listener();

      container.listen<RepositoryData>(
        repositoryListProvider,
        listener.call,
        fireImmediately: true,
      );

      verify(listener(null, NoRepositoryData())).called(1);
      verifyNoMoreInteractions(listener);

      container.read(repositoryListProvider.notifier).state =
          RepositoryDataLoading();

      verify(listener(NoRepositoryData(), RepositoryDataLoading())).called(1);
      verifyNoMoreInteractions(listener);
    },
  );

  test(
    'Provider Change State Test',
    () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final listener = Listener();

      container.listen<RepositoryData>(
        repositoryListProvider,
        listener.call,
        fireImmediately: true,
      );

      verify(listener(null, NoRepositoryData())).called(1);
      verifyNoMoreInteractions(listener);

      container.read(repositoryListProvider.notifier).state =
          ResponseRepositoryData(
        data: const SeccessRepositoryData(
          totalCount: 0,
          incompleteResults: false,
          items: [],
        ),
      );

      verify(listener(
        NoRepositoryData(),
        ResponseRepositoryData(
          data: const SeccessRepositoryData(
            totalCount: 0,
            incompleteResults: false,
            items: [],
          ),
        ),
      )).called(1);
      verifyNoMoreInteractions(listener);
    },
  );
}
