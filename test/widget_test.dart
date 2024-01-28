import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rep_list/feature/repository_list/providers/repository_list_provider.dart';

import 'package:rep_list/main.dart';
import 'fake_providers/fake_repository_list_provider.dart';
import 'test_robot.dart';

void main() {
  testWidgets('Run Default Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(
      overrides: [
        repositoryListProvider.overrideWith(
          (ref) => FakeRepositoryListProvider(mode: Mode.success),
        ),
      ],
      child: const MyApp(),
    ));

    expect(tester.findByListScreen, findsOne);
    expect(tester.findBySearchTextField, findsOne);
    expect(tester.findBySearchIconButton, findsOne);

    await tester.enterTextForSearchField('flutter');
    await tester.tapIconButtun();
    expect(tester.findByFirstListItem, findsOne);

    await tester.tapListItem();
    expect(tester.findByDetailScreen, findsOne);

    await tester.tapBackButton();
    expect(tester.findBySearchTextField, findsOne);
    expect(tester.findBySearchIconButton, findsOne);

    await tester.enterFocusOutForSearchField('flutter');
    expect(tester.findByFirstListItem, findsOne);
  });

  testWidgets('Check Loading Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(
      overrides: [
        repositoryListProvider.overrideWith(
          (ref) => FakeRepositoryListProvider(mode: Mode.loading),
        ),
      ],
      child: const MyApp(),
    ));

    expect(tester.findByListScreen, findsOne);
    expect(tester.findBySearchTextField, findsOne);
    expect(tester.findBySearchIconButton, findsOne);
    await tester.runAsync(() async {
      await tester.enterTextForSearchField('flutter');
      await tester.tap(tester.findBySearchIconButton);
      await tester.pump();
      expect(tester.findByLoadingView, findsOne);
    });
  });

  testWidgets('Check No Data Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(
      overrides: [
        repositoryListProvider.overrideWith(
          (ref) => FakeRepositoryListProvider(mode: Mode.noData),
        ),
      ],
      child: const MyApp(),
    ));

    expect(tester.findByListScreen, findsOne);
    expect(tester.findBySearchTextField, findsOne);
    expect(tester.findBySearchIconButton, findsOne);

    await tester.enterTextForSearchField('flutter');
    await tester.tapIconButtun();

    expect(tester.findByNoDataView, findsOne);
  });
}
