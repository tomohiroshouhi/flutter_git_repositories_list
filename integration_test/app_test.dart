import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:rep_list/main.dart';

import '../test/test_robot.dart';

void main() {
  testWidgets('Run Default Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

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
}
