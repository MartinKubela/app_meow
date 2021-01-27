import 'package:app_meow/entities/cat_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_entity.g.dart';

///Breed entity,
///
/// [toJson], [Breed.fromJson(json)] methods are generated with
@JsonSerializable(nullable: false)
class Breed {
  final String id;
  final String name;
  final String temperament;
  @JsonKey(name: 'life_span')
  final String lifeSpan;
  @JsonKey(name: 'alt_names')
  final String altNames;
  @JsonKey(name: 'wikipedia_url')
  final String wikiUrl;
  final String origin;
  final CatWeight weight;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  @JsonKey(name: 'suppress_tail')
  final int suppressTail;
  @JsonKey(name: 'short_legs')
  final int shortLegs;
  final int hypoallergenic;
  final int adaptability;
  @JsonKey(name: 'affection_level')
  final int affectionLevel;
  @JsonKey(name: 'country_code')
  final String countryCode;
  @JsonKey(name: 'child_friendly')
  final int childFriendly;
  @JsonKey(name: 'dog_friendly')
  final int dogFriendly;
  @JsonKey(name: 'energy_level')
  final int energyLevel;
  final int grooming;
  @JsonKey(name: 'health_issues')
  final int healthIssues;
  final int intelligence;
  @JsonKey(name: 'shedding_level')
  final int sheddingLevel;
  @JsonKey(name: 'social_needs')
  final int socialNeeds;
  @JsonKey(name: 'stranger_friendly')
  final int strangerFriendly;
  final int vocalisation;

  //final CatImage image;

  const Breed({
    this.id,
    this.name,
    this.temperament,
    this.lifeSpan,
    this.altNames,
    this.wikiUrl,
    this.origin,
    this.weight,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressTail,
    this.shortLegs,
    this.hypoallergenic,
    this.adaptability,
    this.affectionLevel,
    this.countryCode,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    //this.image,
  });

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  Map<String, dynamic> toJson() => _$BreedToJson(this);
}
