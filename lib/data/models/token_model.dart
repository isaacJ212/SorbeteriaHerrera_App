class TokenModel {
  final String accessToken;
  final DateTime accessTokenExpiresAt;


  const TokenModel({
    required this.accessToken,
    required this.accessTokenExpiresAt,
  });

  bool get isAccessTokenExpired => DateTime.now().isAfter(accessTokenExpiresAt);


  static TokenModel fromJson(Map<String, dynamic> json){
    return TokenModel(
      accessToken: json['accessToken'] as String, 
      accessTokenExpiresAt: json['accessTokenExpiresAt'] as DateTime
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'accessToken': accessToken, 
      'accessTokenExpiresAt': accessTokenExpiresAt.toIso8601String()
    };
  }


}