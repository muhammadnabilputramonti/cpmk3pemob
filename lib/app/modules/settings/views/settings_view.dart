import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  final Color primaryNavy = const Color(0xFF002A45); 
  final Color accentMustard = const Color(0xFFFFD358); 
  final Color darkCharcoal = const Color(0xFF1A202C); 
  final Color lightGreyText = const Color(0xFF4A5568); 
  final Color dangerRed = const Color(0xFFE53935); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengaturan Akun',
          style: TextStyle(color: accentMustard, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 15),
        children: [
          _buildSectionHeader('Umum'),
          _buildSettingsItem(
            icon: Icons.person_outline,
            title: 'Edit Profil & Bio',
            subtitle: 'Perbarui informasi dan tampilan Anda',
            onTap: () {
              Get.back(); 
              Get.snackbar('Navigasi', 'Kembali ke halaman profil.', snackPosition: SnackPosition.BOTTOM);
            },
          ),
          _buildSettingsItem(
            icon: Icons.lock_reset,
            title: 'Keamanan & Password',
            subtitle: 'Ganti kata sandi atau atur otentikasi dua faktor',
            onTap: () {
              Get.snackbar('Info', 'Fitur keamanan belum diimplementasikan.', snackPosition: SnackPosition.BOTTOM);
            },
          ),
          
          _buildSectionHeader('Preferensi'),
          _buildSettingsItem(
            icon: Icons.notifications_none,
            title: 'Pengaturan Notifikasi',
            subtitle: 'Kelola notifikasi, suara, dan getaran',
            onTap: () {
              Get.snackbar('Info', 'Fitur notifikasi belum diimplementasikan.', snackPosition: SnackPosition.BOTTOM);
            },
          ),
          _buildSettingsItem(
            icon: Icons.visibility_outlined,
            title: 'Privasi Akun',
            subtitle: 'Atur visibilitas postingan dan status online',
            onTap: () {
              Get.snackbar('Info', 'Fitur privasi belum diimplementasikan.', snackPosition: SnackPosition.BOTTOM);
            },
          ),
          
          _buildSectionHeader('Akun'),
          _buildSettingsItem(
            icon: Icons.help_outline,
            title: 'Pusat Bantuan',
            subtitle: 'FAQ, kontak dukungan, dan panduan',
            onTap: () {
              Get.snackbar('Info', 'Pusat bantuan sedang dikembangkan.', snackPosition: SnackPosition.BOTTOM);
            },
          ),
          _buildLogoutItem(
            onTap: () {
              Get.offAllNamed(Routes.LOGIN); 
              Get.snackbar(
                'Berhasil Logout', 
                'Anda telah keluar dari akun Sosio Connect.',
                snackPosition: SnackPosition.TOP,
                backgroundColor: dangerRed.withOpacity(0.9),
                colorText: Colors.white,
                icon: const Icon(Icons.exit_to_app, color: Colors.white)
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 25.0, bottom: 8.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: primaryNavy,
          fontWeight: FontWeight.w900,
          fontSize: 14,
          letterSpacing: 0.5
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: primaryNavy),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: darkCharcoal,
          ),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: lightGreyText.withOpacity(0.8))),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: lightGreyText),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogoutItem({required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: dangerRed.withOpacity(0.1),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(Icons.logout, color: dangerRed),
        title: Text(
          'Keluar (Logout)',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: dangerRed,
            fontSize: 16
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: dangerRed.withOpacity(0.7)),
        onTap: onTap,
      ),
    );
  }
}