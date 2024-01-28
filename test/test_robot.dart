import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rep_list/feature/repository_list/page/repository_detail_page.dart';

extension TesterRobot on WidgetTester {
  Finder get findByListScreen =>
      find.byFavoriteKey('repository_list_page_screen');
  Finder get findByRepositoryList => find.byFavoriteKey('repository_list');
  Finder get findBySearchTextField => find.byFavoriteKey('search_text_field');
  Finder get findBySearchIconButton => find.byFavoriteKey('search_icon_button');
  Finder get findByNoDataView => find.byFavoriteKey('no_repository_data');
  Finder get findByLoadingView => find.byFavoriteKey('loading_repository_data');
  Finder get findByFirstListItem =>
      find.byFavoriteKey('repository_list_item_0');
  Finder get findByDetailScreen =>
      find.byFavoriteKey('repository_detail_screen');
  Finder findByDetailContent(RepositoryContent content) =>
      find.byFavoriteKey(content.name);
  Finder get findByBackButton =>
      find.byIcon((Platform.isIOS) ? Icons.arrow_back_ios : Icons.arrow_back);

  Future<void> enterTextForSearchField(String text) async {
    await enterText(findBySearchTextField, text);
    await pumpAndSettle();
  }

  Future<void> enterFocusOutForSearchField(String text) async {
    await enterText(findBySearchTextField, text);
    await pumpAndSettle();
    await testTextInput.receiveAction(TextInputAction.search);
    testTextInput.unregister();
    await pumpAndSettle();
  }

  Future<void> tapIconButtun() async {
    await tap(findBySearchIconButton);
    await pumpAndSettle();
  }

  Future<void> tapListItem() async {
    await tap(findByFirstListItem);
    await pumpAndSettle();
  }

  Future<void> tapBackButton() async {
    await tap(findByBackButton);
    await pumpAndSettle();
  }
}

extension ExCommonFinders on CommonFinders {
  Finder byFavoriteKey(String keyname) => byKey(Key(keyname));
}
