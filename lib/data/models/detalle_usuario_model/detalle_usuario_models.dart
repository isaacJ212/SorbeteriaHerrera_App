import 'dart:collection';

import 'package:flutter/material.dart';

class DetalleUsuarioResponseModels {
  final int id;
  final String userName;
  final String email;
  final String dni;
  final String firstName;
  final String lastName;
  final bool isActive;
  final List<String> roles;

  const DetalleUsuarioResponseModels({
    required this.id,
    required this.userName,
    required this.email,
    required this.dni,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.roles,
  });

  static DetalleUsuarioResponseModels fromJson(Map<String, dynamic> json) {
    return DetalleUsuarioResponseModels(
      id: json['id'] as int,
      userName: json['userName'] as String,
      email: json['email'] as String,
      dni: json['dni'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      isActive: json['isActive'] as bool,
      roles: (json['roles'] as List<dynamic>)
          .map((role) => role as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'dni': dni,
      'firstName': firstName,
      'lastName': lastName,
      'isActive': isActive,
      'roles': roles,
    };
  }
}
