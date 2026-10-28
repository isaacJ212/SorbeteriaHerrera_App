import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:herrera_app/data/models/token_model.dart';
import 'package:flutter/material.dart';

class TokenRepository {

  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  final String _tokenKey = 'Auth_Token';


  Future<void> saveToken(TokenModel token) async {
  final String  jsonString = jsonEncode(token.toJson()); // guarda 
  await _prefs.setString(_tokenKey, jsonString);

  }

  //leer
  Future<TokenModel?> getToken() async{
    final String? rawJson = await _prefs.getString(_tokenKey);
    if (rawJson == null ) return null;


    try {
      final Map<String, dynamic> jsonMap = jsonDecode(rawJson);
      final token = TokenModel.fromJson(jsonMap);

      if (token.isAccessTokenExpired) {
        await removeToken();
        return null;
      }

      return token;

    } catch (e) {
      await removeToken();
      return null;
    }
    
  }

  Future<void> removeToken() async{
    await _prefs.remove(_tokenKey);
  }

  Future<bool> hasValidToken() async => await getToken() != null;

}