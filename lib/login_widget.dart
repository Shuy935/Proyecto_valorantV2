import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_moviles2/main.dart';
import 'package:login_moviles2/screens/forgot_password_page.dart';
import 'package:login_moviles2/utils/utils.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State <LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        Image.asset('assets/loading.gif'),
        Text(
          'Iniciar sesión',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40),
        TextField(
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 4),
        TextField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(labelText: 'Contraseña'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        Container(child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: Size.fromHeight(50),
            ),
            icon: Icon(Icons.lock_open, size: 32),
            label: Text(
              'Iniciar sesión',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: signIn,
          ),
        ),
        SizedBox(height: 24),
          GestureDetector(
            child: Text(
              '¿Olvido su contraseña?',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ForgotPasswordPage(),
            )),
          ),
        SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.white, fontSize: 15),
            text: '¿Aun no tiene cuenta? ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                ..onTap = widget.onClickedSignUp,
                text: 'Registrar',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
    on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}