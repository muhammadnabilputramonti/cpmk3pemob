import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  final Color primaryNavy = const Color(0xFF002A45); 
  final Color accentMustard = const Color(0xFFFFD358); 
  final Color darkCharcoal = const Color(0xFF1A202C); 
  final Color lightGreyText = const Color(0xFF4A5568); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Akun Baru'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: primaryNavy,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Lengkapi data Anda untuk bergabung dengan Sosio Connect.',
                style: TextStyle(
                  fontSize: 16,
                  color: lightGreyText,
                ),
              ),
              const SizedBox(height: 40),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  hintText: 'Nama lengkap sesuai KTP/Identitas',
                  prefixIcon: Icon(Icons.badge_outlined, color: primaryNavy),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'alamatemail@contoh.com',
                  prefixIcon: Icon(Icons.email_outlined, color: primaryNavy),
                ),
              ),
              const SizedBox(height: 20),
              
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Buat username unik Anda',
                  prefixIcon: Icon(Icons.person_outline, color: primaryNavy),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Minimal 8 karakter',
                  prefixIcon: Icon(Icons.lock_outline, color: primaryNavy),
                ),
              ),
              const SizedBox(height: 40),

              _buildGradientButton(
                text: 'DAFTAR SEKARANG',
                onPressed: () {
                  Get.back(); 
                  Get.snackbar(
                    'Pendaftaran Berhasil',
                    'Akun Anda berhasil dibuat! Silakan masuk.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: primaryNavy.withOpacity(0.9),
                    colorText: Colors.white,
                    icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                  );
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
                    'Sudah punya akun?',
                    style: TextStyle(color: lightGreyText, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Masuk di sini',
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
