import 'package:flutter/material.dart';
import 'package:pendaftaran_organisasi_mahasiswa/utils/appConstants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        hintText: 'Example@email.com',
                        controller: emailController,
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
                        isPassword:
                            true, // Atau TextInputType.visiblePassword jika Anda ingin mematikan obscureText
                        hintText: 'At least 8 characters',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          final String email = emailController.text;
                          final String password = passwordController.text;
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF162D3A),
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Sign In'),
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
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextField(
      {super.key,
      required this.keyboardType,
      required this.hintText,
      required this.controller,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: const Color(0xFF162D3A),
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          // Gunakan warna yang telah ditentukan jika ada, jika tidak, gunakan warna default
          borderSide: const BorderSide(
            color: Color(0xFF162D3A), // Default color
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
