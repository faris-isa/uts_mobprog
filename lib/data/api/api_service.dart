import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:uts_mobprog/data/model/heroes_detailed.dart';
import 'package:uts_mobprog/data/model/heroes_merge.dart';

import '../model/heroes.dart';

class ApiService {
  static const String _basePicture = 'https://api.opendota.com/api';
  static const String _paramPicture = 'heroStats';

  static const String _baseUrl = 'https://api.stratz.com/api/v1';
  static const String _param1 = 'Hero';
  static const String _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJodHRwczovL3N0ZWFtY29tbXVuaXR5LmNvbS9vcGVuaWQvaWQvNzY1NjExOTgxNjQ3MjI5ODYiLCJ1bmlxdWVfbmFtZSI6IlRVR0FTIEFLSElSIEdJTEFBQUFBQSIsIlN1YmplY3QiOiI0NjYxZGZmZC1jOGYwLTQxNmMtYWIxMS1mZjQ3NDY0OWY4MWIiLCJTdGVhbUlkIjoiMjA0NDU3MjU4IiwibmJmIjoxNjgwNDkzMDMxLCJleHAiOjE3MTIwMjkwMzEsImlhdCI6MTY4MDQ5MzAzMSwiaXNzIjoiaHR0cHM6Ly9hcGkuc3RyYXR6LmNvbSJ9.M9xW1dgVKF6JNsk086kCg41gObWHPod-Xu_dQhwsyog';

  getLink() {
    return {_basePicture, _baseUrl};
  }

  Future<List<Heroes>> getPicture() async {
    final response = await http.get(Uri.parse('$_basePicture/$_paramPicture'));

    if(response.statusCode == 200) {
      return heroesFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<HeroesDetailed>> getAllData() async {
    final response = await http.get(Uri.parse('$_baseUrl/$_param1'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    });

    if(response.statusCode == 200) {
      final body = heroesDetailedFromJson(response.body);
      List<HeroesDetailed> heroesList = body.values.toList();
      return heroesList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}