import 'dart:convert';

import 'heroes.dart';
import 'heroes_detailed.dart';

List<HeroesMerge> heroesMergeFromJson(String str) => List<HeroesMerge>.from(json.decode(str).map((x) => HeroesMerge.fromJson(x)));

String heroesMergeToJson(List<HeroesMerge> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HeroesMerge {
    HeroesMerge({
        required this.id,
        required this.name,
        required this.localizedName,
        required this.primaryAttr,
        required this.attackType,
        required this.roles,
        required this.img,
        required this.icon,
        required this.baseHealth,
        required this.baseMana,
        required this.abilities,
        required this.talents,
        required this.stat,
        required this.language,
        required this.aliases,
    });

    int id;
    String name;
    String localizedName;
    PrimaryAttr primaryAttr;
    AttackType attackType;
    List<Role> roles;
    String img;
    String icon;
    int baseHealth;
    int baseMana;
    List<Ability> abilities;
    List<Talent> talents;
    Stat stat;
    Language language;
    List<String> aliases;

    factory HeroesMerge.fromJson(Map<String, dynamic> json) => HeroesMerge(
        id: json["id"],
        name: json["name"],
        localizedName: json["localized_name"],
        primaryAttr: primaryAttrValues.map[json["primary_attr"]]!,
        attackType: attackTypeValues.map[json["attack_type"]]!,
        roles: List<Role>.from(json["roles"].map((x) => roleValues.map[x]!)),
        img: json["img"],
        icon: json["icon"],
        baseHealth: json["base_health"],
        baseMana: json["base_mana"],
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
        talents: List<Talent>.from(json["talents"].map((x) => Talent.fromJson(x))),
        stat: Stat.fromJson(json["stat"]),
        language: Language.fromJson(json["language"]),
        aliases: List<String>.from(json["aliases"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localized_name": localizedName,
        "primary_attr": primaryAttrValues.reverse[primaryAttr],
        "attack_type": attackTypeValues.reverse[attackType],
        "roles": List<dynamic>.from(roles.map((x) => roleValues.reverse[x])),
        "img": img,
        "icon": icon,
        "base_health": baseHealth,
        "base_mana": baseMana,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "talents": List<dynamic>.from(talents.map((x) => x.toJson())),
        "stat": stat.toJson(),
        "language": language.toJson(),
        "aliases": List<dynamic>.from(aliases.map((x) => x)),
    };
}
