// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeccessRepositoryDataImpl _$$SeccessRepositoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SeccessRepositoryDataImpl(
      totalCount: json['total_count'] as int? ?? 0,
      incompleteResults: json['incomplete_results'] as bool? ?? false,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SeccessRepositoryDataImplToJson(
        _$SeccessRepositoryDataImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };

_$ItemsImpl _$$ItemsImplFromJson(Map<String, dynamic> json) => _$ItemsImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      htmlUrl: json['html_url'] as String?,
      description: json['description'] as String?,
      language: json['language'] as String?,
      forksCount: json['forks_count'] as int? ?? 0,
      openIssues: json['open_issues'] as int? ?? 0,
      watchersCount: json['watchers_count'] as int? ?? 0,
      stargazersCount: json['stargazers_count'] as int? ?? 0,
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ItemsImplToJson(_$ItemsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'open_issues': instance.openIssues,
      'watchers_count': instance.watchersCount,
      'stargazers_count': instance.stargazersCount,
      'score': instance.score,
    };

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      login: json['login'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$OwnerImplToJson(_$OwnerImpl instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
