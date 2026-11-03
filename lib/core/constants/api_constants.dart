class ApiConst {
  ApiConst._();

  static String get baseUrl => 'http://10.0.2.2:5177/api';

  static String get login => '$baseUrl/Auth/login';
  static String get sales => '$baseUrl/Sales';
  static String get dailySales => '$baseUrl/Sales/daily-total';
  static String get orders => '$baseUrl/Sales';
  static String get inventory => '$baseUrl/Inventory';
  static String get reportInventary => '$baseUrl/Inventory/stats';
  static String get users => '$baseUrl/Users';
  static String get activeUsers => '$baseUrl/Users/active';
  static String get infoMe => '$baseUrl/Users/me';
  static String get audit => '$baseUrl/Audit';

  //static string to feed dashboard cards
  static String get dashboard => '$baseUrl/Dashboard';

  //endpoint dinamicos

  static String salesDetails(int id) => '$baseUrl/Sales/$id';
  static String ordersDetails(int id) => '$baseUrl/Sales/$id';
  static String inventoryDetails(int id) =>
      '$baseUrl/Inventory/products/$id/detail';
  static String usersDetails(int userId) => '$baseUrl/Users/$userId';

  // para el time otu
  static const Duration timeOutDuration = Duration(seconds: 30);
}
