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
      accessToken: json['token'] as String,
      accessTokenExpiresAt: DateTime.parse(json['expiresAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': accessToken,
      'expiresAt': accessTokenExpiresAt.toIso8601String(),
    };
  }

  
}