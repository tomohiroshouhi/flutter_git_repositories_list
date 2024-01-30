// coverage:ignore-file
import 'package:equatable/equatable.dart';

import 'repository_data_model.dart';

abstract class RepositoryData extends Equatable {}

/// リポジトリのデータがない場合のモデル
class NoRepositoryData extends RepositoryData {
  @override
  List<Object?> get props => [];
}

/// リポジトリのデータを取得中の場合のモデル
class RepositoryDataLoading extends RepositoryData {
  @override
  List<Object?> get props => [];
}

/// リポジトリのデータを取得した場合のモデル
class ResponseRepositoryData extends RepositoryData {
  ResponseRepositoryData({required this.data});
  final SeccessRepositoryData data;

  @override
  List<Object?> get props => [data];
}
