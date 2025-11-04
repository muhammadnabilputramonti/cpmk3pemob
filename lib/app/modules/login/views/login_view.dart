import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  final Color primaryNavy = const Color(0xFF002A45);   
  final Color accentMustard = const Color(0xFFFFD358); 
  final Color darkCharcoal = const Color(0xFF1A202C); 
  final Color lightGreyText = const Color(0xFF4A5568); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.whatshot, 
                size: 100,
                color: primaryNavy,
              ),
              const SizedBox(height: 15),
              Text(
                'Sosio Connect',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900, 
                  color: darkCharcoal,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Masuk untuk Terhubung dan Berbagi',
                style: TextStyle(
                  fontSize: 16,
                  color: lightGreyText,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukkan username Anda',
                  prefixIcon: Icon(Icons.person_outline, color: primaryNavy),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan password Anda',
                  prefixIcon: Icon(Icons.lock_outline, color: primaryNavy),
                ),
              ),
              const SizedBox(height: 15),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.snackbar(
                      'Lupa Password',
                      'Fitur ini belum diimplementasikan.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: accentMustard.withOpacity(0.9),
                      colorText: darkCharcoal,
                      icon: Icon(Icons.info_outline, color: darkCharcoal),
                    );
                  },
                  child: Text(
                    'Lupa Password?',
                    style: TextStyle(color: primaryNavy, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              _buildGradientButton(
                text: 'MASUK SEKARANG',
                onPressed: () {
                  Get.offAllNamed(Routes.HOME);
                },
                gradient: LinearGradient(
                  colors: [primaryNavy, accentMustard], 
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun?',
                    style: TextStyle(color: lightGreyText, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Text(
                      'Daftar di sini',
                      style: TextStyle(color: primaryNavy, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientButton({required String text, required VoidCallback onPressed, required Gradient gradient}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: primaryNavy.withOpacity(0.3), 
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}