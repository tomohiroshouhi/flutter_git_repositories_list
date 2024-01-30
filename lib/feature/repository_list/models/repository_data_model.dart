import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_data_model.freezed.dart';
part 'repository_data_model.g.dart';

@freezed
class SeccessRepositoryData with _$SeccessRepositoryData {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SeccessRepositoryData({
    @Default(0) int totalCount,
    @Default(false) bool incompleteResults,
    @Default([]) List<Items> items,
  }) = _SeccessRepositoryData;

  factory SeccessRepositoryData.fromJson(Map<String, dynamic> json) =>
      _$SeccessRepositoryDataFromJson(json);
}

@freezed
class Items with _$Items {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Items({
    int? id,
    String? name,
    Owner? owner,
    String? htmlUrl,
    String? description,
    String? language,
    @Default(0) int forksCount,
    @Default(0) int openIssues,
    @Default(0) int watchersCount,
    @Default(0) int stargazersCount,
    @Default(0.0) double? score,
  }) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}

@freezed
class Owner with _$Owner {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Owner({
    String? login,
    String? avatarUrl,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
