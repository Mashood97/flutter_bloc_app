// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadlineModel _$HeadlineModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'HeadlineModel',
      json,
      ($checkedConvert) {
        final val = HeadlineModel(
          headlineAuthor: $checkedConvert('author', (v) => v as String?),
          headlineContent: $checkedConvert('content', (v) => v as String?),
          headlineDescription:
              $checkedConvert('description', (v) => v as String?),
          headlineTitle: $checkedConvert('title', (v) => v as String?),
          headlineWebUrl: $checkedConvert('url', (v) => v as String?),
          headlingImage: $checkedConvert('urlToImage', (v) => v as String?),
          publishedDateTime:
              $checkedConvert('publishedAt', (v) => v as String?),
          headlineSource: $checkedConvert(
              'source',
              (v) => v == null
                  ? null
                  : SourceModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'headlineAuthor': 'author',
        'headlineContent': 'content',
        'headlineDescription': 'description',
        'headlineTitle': 'title',
        'headlineWebUrl': 'url',
        'headlingImage': 'urlToImage',
        'publishedDateTime': 'publishedAt',
        'headlineSource': 'source'
      },
    );

Map<String, dynamic> _$HeadlineModelToJson(HeadlineModel instance) =>
    <String, dynamic>{
      'source': instance.headlineSource,
      'author': instance.headlineAuthor,
      'title': instance.headlineTitle,
      'description': instance.headlineDescription,
      'url': instance.headlineWebUrl,
      'urlToImage': instance.headlingImage,
      'publishedAt': instance.publishedDateTime,
      'content': instance.headlineContent,
    };

SourceModel _$SourceModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SourceModel',
      json,
      ($checkedConvert) {
        final val = SourceModel(
          sourceId: $checkedConvert('id', (v) => v as String?),
          sourceName: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'sourceId': 'id', 'sourceName': 'name'},
    );

Map<String, dynamic> _$SourceModelToJson(SourceModel instance) =>
    <String, dynamic>{
      'id': instance.sourceId,
      'name': instance.sourceName,
    };
