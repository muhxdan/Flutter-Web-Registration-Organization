import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/presentation/pages/login_screen.dart';
import 'package:pendaftaran_organisasi_mahasiswa/utils/appConstants.dart';

import '../../data/service/firebase_service.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _name;
  String? _email;
  String? _password;
  String? _userName;

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
          name: _name, email: _email, password: _password, username: _userName);
      if (result != 'success') {
        showSnackBar(result, context);
        print(result);
      } else {
        Navigator.pop(context);
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
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              keyboardType: TextInputType.emailAddress,
                              hintText: "John Doe",
                              isPassword: false,
                              validator: (input) => input!.trim().isEmpty
                                  ? 'Please enter a valid name'
                                  : null,
                              onSaved: (input) => _name = input!,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Johndoe01",
                              isPassword: false,
                              validator: (input) => input!.trim().isEmpty
                                  ? 'Please enter a valid username'
                                  : null,
                              onSaved: (input) => _userName = input!,
                            ),
                            const SizedBox(height: 16),
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
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          _signUp();
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
                            : const Text('Sign Up'),
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
