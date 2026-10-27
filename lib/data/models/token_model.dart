import 'package:flutter/foundation.dart';

class TokenModel {
  final String accessToken;
  final DateTime accessTokenExpiresAt;


  const TokenModel({
    required this.accessToken,
    required this.accessTokenExpiresAt,
  });

  bool get isAccessTokenExpired => DateTime.now().isAfter(accessTokenExpiresAt);


  static TokenModel fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'] as String,
      accessTokenExpiresAt: DateTime.parse(json['accessTokenExpiresAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'accessTokenExpiresAt': accessTokenExpiresAt.toIso8601String(),
    };
  }

  
}