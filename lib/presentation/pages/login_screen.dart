import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/presentation/pages/signup_screen.dart';

import '../../data/service/firebase_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _email;
  String? _password;

  @override
  void dispose() {
    super.dispose();
  }

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      String result =
          await AuthMethods().signInUser(email: _email!, password: _password!);
      if (result != 'success') {
        showSnackBar(result, context);
        print(result);
      } else {
        showSnackBar("success", context);
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 388,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Selamat Datang 👋",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Contoh@email.com",
                            isPassword: false,
                            onSaved: (input) => _email = input!,
                            validator: (input) => !input!.contains('@')
                                ? 'Masukkan alamat email yang valid'
                                : null,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            keyboardType: TextInputType.text,
                            isPassword: true,
                            hintText: 'Minimal 8 karakter',
                            validator: (input) => input!.length < 6
                                ? 'Harus setidaknya 6 karakter'
                                : null,
                            onSaved: (input) => _password = input!,
                          ),
                        ],
                      )),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      _signIn();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? Center(
                            child: Transform.scale(
                            scale: 0.5,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ))
                        : const Text('Sign in'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Belum memiliki akun? ",
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Buat akun',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final bool isPassword;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.keyboardType,
    required this.hintText,
    required this.isPassword,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: const Color(0xFF162D3A),
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF162D3A), // Default color
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ),
  );
}
