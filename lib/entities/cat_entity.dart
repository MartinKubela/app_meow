import 'package:json_annotation/json_annotation.dart';

part 'cat_entity.g.dart';

///Cat entity,
///
/// [toJson], [Breed.fromJson(json)] methods are generated
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

@JsonSerializable()
class CatWeight {
  final String imperial;
  final String metric;

  const CatWeight({this.imperial, this.metric});

  factory CatWeight.fromJson(Map<String, dynamic> json) =>
      _$CatWeightFromJson(json);

  Map<String, dynamic> toJson() => _$CatWeightToJson(this);
}

@JsonSerializable()
class CatImage {
  @JsonKey(nullable: true)
  final String id;
  final int width;
  final int height;
  final String url;

  const CatImage({this.id, this.width, this.height, this.url});

  factory CatImage.fromJson(Map<String, dynamic> json) =>
      _$CatImageFromJson(json);

  Map<String, dynamic> toJson() => _$CatImageToJson(this);
}
