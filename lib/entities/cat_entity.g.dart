// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) {
  return Cat(
    id: json['id'] as String,
    imagePath: json['url'] as String,
    breeds: json['breeds'] as List,
  );
}

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.imagePath,
      'breeds': instance.breeds,
    };

CatWeight _$CatWeightFromJson(Map<String, dynamic> json) {
  return CatWeight(
    imperial: json['imperial'] as String,
    metric: json['metric'] as String,
  );
}

Map<String, dynamic> _$CatWeightToJson(CatWeight instance) => <String, dynamic>{
      'imperial': instance.imperial,
      'metric': instance.metric,
    };

CatImage _$CatImageFromJson(Map<String, dynamic> json) {
  return CatImage(
    id: json['id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$CatImageToJson(CatImage instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
