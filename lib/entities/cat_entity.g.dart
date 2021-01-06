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
