class RegexCommon{

  static final usernameRegex = RegExp(r'^[a-zA-Z0-9._-]{3,30}$');

  static final passwordRegex = RegExp(r'^\S{4,}$');

}