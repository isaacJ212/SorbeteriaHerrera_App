import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:herrera_app/Widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _remember = false;
  bool _isObscure = true;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09A982),
      body: Stack(children: [_buildCircles()]),
    );
  }

  Widget _buildLoginCard() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenido',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF10251F),
              ),
            ),
            const SizedBox(height: 8),

            // Subtítulo
            const Text(
              'por favor ingresa tus credenciales',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            AppTextField(
              icon: Icons.person_outline,
              label: 'Usuario',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por Favor Ingresa tu usuario';
                }
                return null;
              },
              controller: _userNameController,
            ),
            const SizedBox(height: 16),

            _buildPasswordField(),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _remember,
                  onChanged: (value) {
                    setState(() {
                      _remember = value ?? false;
                    });
                  },
                  activeColor: const Color(0xFF09A982),
                ),
                const Text(
                  'Recordar mi Sesion',
                  style: TextStyle(color: Color(0xFF64736D), fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDAE3EB),
                foregroundColor: const Color(0xFF10251F),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Confirmar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Investigue y dice que stack es un widget que te permite tener varios
  // Widgets encima de otros como una montaña de capas, este trabaja en el eje  osea como
  // para salirse de la pantalla, positioned me sirvio para alinear los circulos en el eje x o y

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

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _isObscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por Favor Ingrese su contraseña';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Contraseña',
        labelStyle: const TextStyle(color: const Color((0xFF10251F))),
        prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF64736D)),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Color(0xFF64736D),
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        filled: true,
        fillColor: const Color(0xFFDAE3EB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Aquí iría la lógica de login (sin conectar a API por ahora)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Intentando login con: ${_userNameController.text}'),
          backgroundColor: const Color(0xFF09A982),
        ),
      );

      // Simular navegación o acción
      // Navigator.pushReplacement(...);
    }
  }
}
