// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breed _$BreedFromJson(Map<String, dynamic> json) {
  return Breed(
    id: json['id'] as String,
    name: json['name'] as String,
    temperament: json['temperament'] as String,
    lifeSpan: json['life_span'] as String,
    altNames: json['alt_names'] as String,
    wikiUrl: json['wikipedia_url'] as String,
    origin: json['origin'] as String,
    weight: CatWeight.fromJson(json['weight'] as Map<String, dynamic>),
    experimental: json['experimental'] as int,
    hairless: json['hairless'] as int,
    natural: json['natural'] as int,
    rare: json['rare'] as int,
    rex: json['rex'] as int,
    suppressTail: json['suppress_tail'] as int,
    shortLegs: json['short_legs'] as int,
    hypoallergenic: json['hypoallergenic'] as int,
    adaptability: json['adaptability'] as int,
    affectionLevel: json['affection_level'] as int,
    countryCode: json['country_code'] as String,
    childFriendly: json['child_friendly'] as int,
    dogFriendly: json['dog_friendly'] as int,
    energyLevel: json['energy_level'] as int,
    grooming: json['grooming'] as int,
    healthIssues: json['health_issues'] as int,
    intelligence: json['intelligence'] as int,
    sheddingLevel: json['shedding_level'] as int,
    socialNeeds: json['social_needs'] as int,
    strangerFriendly: json['stranger_friendly'] as int,
    vocalisation: json['vocalisation'] as int,
  );
}

Map<String, dynamic> _$BreedToJson(Breed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'life_span': instance.lifeSpan,
      'alt_names': instance.altNames,
      'wikipedia_url': instance.wikiUrl,
      'origin': instance.origin,
      'weight': instance.weight,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppress_tail': instance.suppressTail,
      'short_legs': instance.shortLegs,
      'hypoallergenic': instance.hypoallergenic,
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'country_code': instance.countryCode,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'grooming': instance.grooming,
      'health_issues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'shedding_level': instance.sheddingLevel,
      'social_needs': instance.socialNeeds,
      'stranger_friendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
    };
