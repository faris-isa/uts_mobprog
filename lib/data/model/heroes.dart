import 'dart:convert';

List<Heroes> heroesFromJson(String str) => List<Heroes>.from(json.decode(str).map((x) => Heroes.fromJson(x)));

String heroesToJson(List<Heroes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Heroes {
    Heroes({
        required this.id,
        required this.name,
        required this.localizedName,
        required this.primaryAttr,
        required this.attackType,
        required this.roles,
        required this.img,
        required this.icon,
        required this.baseHealth,
        required this.baseMana
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

    factory Heroes.fromJson(Map<String, dynamic> json) => Heroes(
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
        "base_mana": baseMana
    };
}

enum AttackType { MELEE, RANGED }

final attackTypeValues = EnumValues({
    "Melee": AttackType.MELEE,
    "Ranged": AttackType.RANGED
});

enum PrimaryAttr { AGI, STR, INT }

final primaryAttrValues = EnumValues({
    "agi": PrimaryAttr.AGI,
    "int": PrimaryAttr.INT,
    "str": PrimaryAttr.STR
});

enum Role { CARRY, ESCAPE, NUKER, INITIATOR, DURABLE, DISABLER, SUPPORT, PUSHER }

final roleValues = EnumValues({
    "Carry": Role.CARRY,
    "Disabler": Role.DISABLER,
    "Durable": Role.DURABLE,
    "Escape": Role.ESCAPE,
    "Initiator": Role.INITIATOR,
    "Nuker": Role.NUKER,
    "Pusher": Role.PUSHER,
    "Support": Role.SUPPORT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
