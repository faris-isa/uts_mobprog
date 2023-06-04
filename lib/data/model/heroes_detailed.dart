// To parse this JSON data, do
//
//     final heroesDetailed = heroesDetailedFromJson(jsonString);

import 'dart:convert';

import 'heroes.dart';

Map<String, HeroesDetailed> heroesDetailedFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, HeroesDetailed>(k, HeroesDetailed.fromJson(v)));

String heroesDetailedToJson(Map<String, HeroesDetailed> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class HeroesDetailed {
    int id;
    String name;
    String displayName;
    String shortName;
    List<Ability> abilities;
    List<Talent> talents;
    Stat stat;
    Language language;
    List<String> aliases;

    HeroesDetailed({
        required this.id,
        required this.name,
        required this.displayName,
        required this.shortName,
        required this.abilities,
        required this.talents,
        required this.stat,
        required this.language,
        required this.aliases,
    });

    factory HeroesDetailed.fromJson(Map<String, dynamic> json) => HeroesDetailed(
        id: json["id"],
        name: json["name"],
        displayName: json["displayName"],
        shortName: json["shortName"],
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
        talents: List<Talent>.from(json["talents"].map((x) => Talent.fromJson(x))),
        stat: Stat.fromJson(json["stat"]),
        language: Language.fromJson(json["language"]),
        aliases: List<String>.from(json["aliases"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "displayName": displayName,
        "shortName": shortName,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "talents": List<dynamic>.from(talents.map((x) => x.toJson())),
        "stat": stat.toJson(),
        "language": language.toJson(),
        "aliases": List<dynamic>.from(aliases.map((x) => x)),
    };
}

class Ability {
    int slot;
    int abilityId;

    Ability({
        required this.slot,
        required this.abilityId,
    });

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: json["slot"],
        abilityId: json["abilityId"],
    );

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "abilityId": abilityId,
    };
}

class Language {
    int heroId;
    int gameVersionId;
    int languageId;
    String displayName;
    String bio;
    String hype;

    Language({
        required this.heroId,
        required this.gameVersionId,
        required this.languageId,
        required this.displayName,
        required this.bio,
        required this.hype,
    });

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        heroId: json["heroId"],
        gameVersionId: json["gameVersionId"],
        languageId: json["languageId"],
        displayName: json["displayName"],
        bio: json["bio"],
        hype: json["hype"],
    );

    Map<String, dynamic> toJson() => {
        "heroId": heroId,
        "gameVersionId": gameVersionId,
        "languageId": languageId,
        "displayName": displayName,
        "bio": bio,
        "hype": hype,
    };
}

class Stat {
    int gameVersionId;
    bool enabled;
    double heroUnlockOrder;
    bool team;
    bool cmEnabled;
    bool newPlayerEnabled;
    AttackType attackType;
    double startingArmor;
    double startingMagicArmor;
    double startingDamageMin;
    double startingDamageMax;
    double attackRate;
    double attackAnimationPoint;
    double attackAcquisitionRange;
    double attackRange;
    PrimaryAttr attributePrimary;
    int heroPrimaryAttribute;
    double strengthBase;
    double strengthGain;
    double intelligenceBase;
    double intelligenceGain;
    double agilityBase;
    double agilityGain;
    double hpRegen;
    double mpRegen;
    double moveSpeed;
    double moveTurnRate;
    double hpBarOffset;
    double visionDaytimeRange;
    double visionNighttimeRange;
    int complexity;
    int primaryAttributeEnum;

    Stat({
        required this.gameVersionId,
        required this.enabled,
        required this.heroUnlockOrder,
        required this.team,
        required this.cmEnabled,
        required this.newPlayerEnabled,
        required this.attackType,
        required this.startingArmor,
        required this.startingMagicArmor,
        required this.startingDamageMin,
        required this.startingDamageMax,
        required this.attackRate,
        required this.attackAnimationPoint,
        required this.attackAcquisitionRange,
        required this.attackRange,
        required this.attributePrimary,
        required this.heroPrimaryAttribute,
        required this.strengthBase,
        required this.strengthGain,
        required this.intelligenceBase,
        required this.intelligenceGain,
        required this.agilityBase,
        required this.agilityGain,
        required this.hpRegen,
        required this.mpRegen,
        required this.moveSpeed,
        required this.moveTurnRate,
        required this.hpBarOffset,
        required this.visionDaytimeRange,
        required this.visionNighttimeRange,
        required this.complexity,
        required this.primaryAttributeEnum,
    });

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        gameVersionId: json["gameVersionId"],
        enabled: json["enabled"],
        heroUnlockOrder: json["heroUnlockOrder"],
        team: json["team"],
        cmEnabled: json["cmEnabled"],
        newPlayerEnabled: json["newPlayerEnabled"],
        attackType: attackTypeValues.map[json["attackType"]]!,
        startingArmor: json["startingArmor"]?.toDouble(),
        startingMagicArmor: json["startingMagicArmor"],
        startingDamageMin: json["startingDamageMin"],
        startingDamageMax: json["startingDamageMax"],
        attackRate: json["attackRate"]?.toDouble(),
        attackAnimationPoint: json["attackAnimationPoint"]?.toDouble(),
        attackAcquisitionRange: json["attackAcquisitionRange"],
        attackRange: json["attackRange"],
        attributePrimary: primaryAttrValues.map[json["AttributePrimary"]]!,
        heroPrimaryAttribute: json["heroPrimaryAttribute"],
        strengthBase: json["strengthBase"],
        strengthGain: json["strengthGain"]?.toDouble(),
        intelligenceBase: json["intelligenceBase"],
        intelligenceGain: json["intelligenceGain"]?.toDouble(),
        agilityBase: json["agilityBase"],
        agilityGain: json["agilityGain"]?.toDouble(),
        hpRegen: json["hpRegen"]?.toDouble(),
        mpRegen: json["mpRegen"]?.toDouble(),
        moveSpeed: json["moveSpeed"],
        moveTurnRate: json["moveTurnRate"]?.toDouble(),
        hpBarOffset: json["hpBarOffset"],
        visionDaytimeRange: json["visionDaytimeRange"],
        visionNighttimeRange: json["visionNighttimeRange"],
        complexity: json["complexity"],
        primaryAttributeEnum: json["primaryAttributeEnum"],
    );

    Map<String, dynamic> toJson() => {
        "gameVersionId": gameVersionId,
        "enabled": enabled,
        "heroUnlockOrder": heroUnlockOrder,
        "team": team,
        "cmEnabled": cmEnabled,
        "newPlayerEnabled": newPlayerEnabled,
        "attackType": attackTypeValues.reverse[attackType],
        "startingArmor": startingArmor,
        "startingMagicArmor": startingMagicArmor,
        "startingDamageMin": startingDamageMin,
        "startingDamageMax": startingDamageMax,
        "attackRate": attackRate,
        "attackAnimationPoint": attackAnimationPoint,
        "attackAcquisitionRange": attackAcquisitionRange,
        "attackRange": attackRange,
        "AttributePrimary": primaryAttrValues.reverse[attributePrimary],
        "heroPrimaryAttribute": heroPrimaryAttribute,
        "strengthBase": strengthBase,
        "strengthGain": strengthGain,
        "intelligenceBase": intelligenceBase,
        "intelligenceGain": intelligenceGain,
        "agilityBase": agilityBase,
        "agilityGain": agilityGain,
        "hpRegen": hpRegen,
        "mpRegen": mpRegen,
        "moveSpeed": moveSpeed,
        "moveTurnRate": moveTurnRate,
        "hpBarOffset": hpBarOffset,
        "visionDaytimeRange": visionDaytimeRange,
        "visionNighttimeRange": visionNighttimeRange,
        "complexity": complexity,
        "primaryAttributeEnum": primaryAttributeEnum,
    };
}

class Talent {
    int slot;
    int gameVersionId;
    int abilityId;

    Talent({
        required this.slot,
        required this.gameVersionId,
        required this.abilityId,
    });

    factory Talent.fromJson(Map<String, dynamic> json) => Talent(
        slot: json["slot"],
        gameVersionId: json["gameVersionId"],
        abilityId: json["abilityId"],
    );

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "gameVersionId": gameVersionId,
        "abilityId": abilityId,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
