import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/presentation/pages/registration_screen.dart';
import 'package:pendaftaran_organisasi_mahasiswa/utils/appConstants.dart';

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
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 388,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome Back 👋",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Today is a new day. It's your day. You shape it. Sign in to start managing your projects.",
                        style: TextStyle(
                          fontSize: 17,
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
                                hintText: "Example@email.com",
                                isPassword: false,
                                onSaved: (input) => _email = input!,
                                validator: (input) => !input!.contains('@')
                                    ? 'Please enter a valid email'
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
                                hintText: 'At least 8 characters',
                                validator: (input) => input!.length < 6
                                    ? 'Must be at least 6 characters'
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
                          backgroundColor: const Color(0xFF162D3A),
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
                            : const Text('Sign In'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Don't you have an account? ",
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign up',
                              style: const TextStyle(
                                color: Colors.blue,
                                // Warna yang berbeda untuk tautan "Sign up"
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const RegistrationScreen(),
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
              ),
            ),
            AppConstants.width(20),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                ),
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
      onSaved: onSaved, // Gunakan onSaved yang diterima
      validator: validator, // Gunakan validator yang diterima
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