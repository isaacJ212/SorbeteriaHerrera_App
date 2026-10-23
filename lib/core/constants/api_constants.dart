import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConst {
  ApiConst._();


  static String get baseUrl => dotenv.env['BASE_URL_API']?? '';


  static String get login => '$baseUrl/Auth/login';
  static String get sales => '$baseUrl/Sales';
  static String get orders => '$baseUrl/Sales';
  static String get inventory => '$baseUrl/Inventory';
  static String get reportInventary => '$baseUrl/Inventory/stats';
  static String get users => '$baseUrl/Users';
  static String get infoMe => '$baseUrl/Users/me';

  //endpoint dinamicos 

  static String salesDetails(int id) => '$baseUrl/Sales/$id';
  static String ordersDetails(int id) => '$baseUrl/Sales/$id';
  static String inventoryDetails(int id) => '$baseUrl/Inventory/products/$id/detail';
  static String usersDetails(int userId) => '$baseUrl/Users/$userId';



}