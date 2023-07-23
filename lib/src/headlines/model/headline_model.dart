import 'package:json_annotation/json_annotation.dart';

part 'headline_model.g.dart';

@JsonSerializable(checked: true)
class HeadlineModel {
  @JsonKey(name: "source")
  final SourceModel? headlineSource;
  @JsonKey(name: "author")
  final String? headlineAuthor;
  @JsonKey(name: "title")
  final String? headlineTitle;
  @JsonKey(name: "description")
  final String? headlineDescription;
  @JsonKey(name: "url")
  final String? headlineWebUrl;
  @JsonKey(name: "urlToImage")
  final String? headlingImage;
  @JsonKey(name: "publishedAt")
  final String? publishedDateTime;
  @JsonKey(name: "content")
  final String? headlineContent;

  HeadlineModel({
    this.headlineAuthor,
    this.headlineContent,
    this.headlineDescription,
    this.headlineTitle,
    this.headlineWebUrl,
    this.headlingImage,
    this.publishedDateTime,
    this.headlineSource,
  });

  static const fromJsonFactory = _$HeadlineModelFromJson;

  factory HeadlineModel.fromJson(Map<String, dynamic> json) =>
      _$HeadlineModelFromJson(json);
  Map<String, dynamic> toJson() => _$HeadlineModelToJson(this);
}

@JsonSerializable(checked: true)
class SourceModel {
  @JsonKey(name: "id")
  final String? sourceId;
  @JsonKey(name: "name")
  final String? sourceName;

  const SourceModel({this.sourceId, this.sourceName});

  static const fromJsonFactory = _$SourceModelFromJson;

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);
  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}
