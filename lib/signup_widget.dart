import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_moviles2/main.dart';
import 'package:login_moviles2/utils/utils.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State <SignUpWidget> {
  final formKey = GlobalKey <FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5),
          Image.asset('assets/loading.gif'),
          Text(
            'Registrate!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
              email != null && !EmailValidator.validate(email)
              ? 'Introduce un email valido'
              : null,
          ),
          SizedBox(height: 4),
          TextFormField(
            controller: passwordController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length < 6
              ? 'Introduce una contraseña valida (min. 6 ccaracteres)'
              : null,
          ),
          SizedBox(height: 4),
          TextFormField(
            controller: confirmPasswordController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Confirmar contraseña'),
            obscureText: true,
            validator: (val) {
              if (val == null)
                return 'vacio';
              if (val != passwordController.text)
                return 'Contraseña erronea';
              return null;
            }
          ),
          SizedBox(height: 20),
          Container(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.arrow_forward, size: 32),
              label: Text(
                'Registrar',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: signUp,
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.white, fontSize: 15),
              text: '¿Ya tienes una cuenta? ',
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignIn,
                  text: 'Iniciar sesión',
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
    ),
  );

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
    on FirebaseAuthException catch(e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}