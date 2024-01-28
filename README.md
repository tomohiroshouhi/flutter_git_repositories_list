# 概要
## 内容
検索ワードを入力し、サブミットするとクエリマッチしたリポジトリの一覧が取得できるアプリを作りました。

## 画面
- リポジトリ検索画面
- リポジトリ詳細画面

## 動画

https://github.com/tomohiroshouhi/flutter_git_repositories_list/assets/43435518/6742c105-2522-4168-9925-bf92487002a3



## 使ったライブラリ
- [hooks_riverpod](https://pub.dev/packages/hooks_riverpod)
- [http](https://pub.dev/packages/http)
- [equatable](https://pub.dev/packages/equatable)
- [url_launcher](https://pub.dev/packages/url_launcher)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
- [mockito](https://pub.dev/packages/mockito)

# ポイント
## 作成内容
RiverPodを使った描画更新のアプリケーション。ライブラリをhooks_riverpodを使ったのは流行に乗ろうとライブラリを選定したのですがHooksを使う場面がありませんでした。<br>
通信状態や結果に応じて画面の状態が切り替わるように作成しました。<br>
作成は基本に忠実に行い、ScaffoldとNavigatorによる画面遷移で作成。<br>
雑にはなってしまいましたが、スプラッシュとアイコンの変更も行いました。<br>
テストは、ユニット、ウィジェット、インテグレーションは一通り作成。(ただし、時間の関係でカバレッジフルやユースケースの網羅はできませんでした)<br>
アニメーションも詳細画面のスターを伸縮するようなアニメを追加しました。<br>
詳細画面のボタン押下でWebのリポジトリ詳細が見えるようにしました。<br>

## ポイント
- 状態管理に関しては、abstractを使ったクラス比較での状態切り替えにした。
- 詳細画面の内容に関して、あえてenum化しテスト時にグルグル回せるようにした。
- テキストフィールドの文字が状態管理の更新で消えないように考慮した。
- テキストフィールドのサブミット部分をコールバックで一元化するようにした。
- 滑り込みでアニメーション入れました。テスト実装時にアニメーションの考慮も入れました。
- コパイロットさんが理解しやすいようにファイル名に規則性を持たせた。

## やりたかったこと
- テストをMokitoをフル活用して実装したこと
- エラーハンドリングを実装して、トーストなどを表示すること
- 画面デザインをもっとリッチに実装したかった
- Lottieとかも使いたかった
- 多言語化対応含む設定画面の実装
- レスポンシブ対応
