import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final Color primaryNavy = const Color(0xFF002A45); 
  final Color accentMustard = const Color(0xFFFFD358); 
  final Color darkCharcoal = const Color(0xFF1A202C); 
  final Color lightGreyText = const Color(0xFF4A5568); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sosio Connect',
          style: TextStyle(
            color: accentMustard, 
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Get.toNamed(Routes.SETTINGS);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        itemCount: 5, 
        itemBuilder: (context, index) {
          return PostItem(index: index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed, 
        selectedItemColor: primaryNavy, 
        unselectedItemColor: lightGreyText,         
        backgroundColor: Colors.white,
        elevation: 8,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Jelajah'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), activeIcon: Icon(Icons.add_box), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profil'),
        ],
        onTap: (index) {
          if (index == 3) {
            Get.toNamed(Routes.PROFILE);
          } else if (index != 0) {
            Get.snackbar(
              'Fitur Belum Tersedia', 
              'Halaman ini fokus pada Beranda, Profil, dan Settings.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: primaryNavy.withOpacity(0.9),
              colorText: Colors.white,
            );
          }
        },
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final int index;
  const PostItem({required this.index, super.key});

  final Color primaryNavy = const Color(0xFF002A45);
  final Color accentMustard = const Color(0xFFFFD358);
  final Color darkCharcoal = const Color(0xFF1A202C);
  final Color lightGreyText = const Color(0xFF4A5568);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: primaryNavy,
                  child: const Icon(Icons.person, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 10),
                Text(
                  'Pengguna_Mewah_${index + 1}',
                  style: TextStyle(fontWeight: FontWeight.bold, color: darkCharcoal),
                ),
                const Spacer(),
                Icon(Icons.more_vert, color: lightGreyText),
              ],
            ),
          ),
          
          Container(
            height: MediaQuery.of(context).size.width, 
            color: Colors.grey[100],
            child: Center(
              child: Text(
                'FOTO POSTINGAN ${index + 1}',
                style: TextStyle(color: lightGreyText, fontSize: 18),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_outline, color: primaryNavy, size: 28),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.comment_outlined, color: primaryNavy, size: 28),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.send_outlined, color: primaryNavy, size: 28),
                  onPressed: () {},
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.bookmark_outline, color: primaryNavy, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${(index * 100 + 50)} Suka',
                  style: TextStyle(fontWeight: FontWeight.bold, color: darkCharcoal),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: darkCharcoal),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Pengguna_Mewah_${index + 1} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Ini adalah caption postingan ke-${index + 1}. Menikmati pemandangan indah dan mencoba palet warna baru! #luxury #minimalis #getx',
                        style: TextStyle(color: darkCharcoal.withOpacity(0.9)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Lihat semua 7 komentar',
                  style: TextStyle(color: lightGreyText.withOpacity(0.7), fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
