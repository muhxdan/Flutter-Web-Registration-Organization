import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/presentation/pages/login_screen.dart';

import '../../data/service/firebase_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _name;
  String? _nim;
  String? _email;
  String? _password;

  @override
  void dispose() {
    super.dispose();
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      String result = await AuthMethods().signUpUser(
          name: _name, nim: _nim, email: _email, password: _password);
      if (result != 'success') {
        showSnackBar(result, context);
      } else {
        showSnackBar("Berhasil membuat akun", context);
        setState(() {
          _isLoading = false;
        });
        Navigator.pop(context);
      }
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
                    "Buat Akun",
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
                            'Nama',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            keyboardType: TextInputType.text,
                            hintText: "John Doe",
                            isPassword: false,
                            onSaved: (input) => _name = input!,
                          ),
                          const Text(
                            'Nim',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            keyboardType: TextInputType.number,
                            hintText: "20****112",
                            isPassword: false,
                            onSaved: (input) => _nim = input!,
                            validator: (input) {
                              if (input!.contains(RegExp(r'[0-9]'))) {
                                return null;
                              } else {
                                return 'Input hanya boleh mengandung angka';
                              }
                            },
                          ),
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
                      _signUp();
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
                        : const Text('Sign up'),
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
