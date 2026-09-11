import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StateFulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>;
  final _userNameController = TextEditingController();
  final _passwordNameController = TextEditingController();

  bool _rememberPassword = false;
  bool _isObscure = true;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFF09A982), body: Stack());
  }

  Widget _buildCircles() {
    return Positioned.fill(
      child: Stack(
        children: [
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFF087A5D),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF087A5D),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: 50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF087A5D),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
