import 'package:json_annotation/json_annotation.dart';

part 'cat_entity.g.dart';

@JsonSerializable(nullable: false)
class Cat {
  final String id;
  @JsonKey(name: 'url')
  final String imagePath;
  final List breeds;

  const Cat({this.id, this.imagePath, this.breeds});

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);
}
