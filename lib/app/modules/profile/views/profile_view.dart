import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  final Color primaryNavy = const Color(0xFF002A45); 
  final Color accentMustard = const Color(0xFFFFD358);  
  final Color darkCharcoal = const Color(0xFF1A202C); 
  final Color lightGreyText = const Color(0xFF4A5568);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Pengguna',
          style: TextStyle(color: accentMustard, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Get.toNamed(Routes.SETTINGS);
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: primaryNavy,
                        child: Text('A', style: TextStyle(fontSize: 40, color: accentMustard)),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatItem('Postingan', '120'),
                            _buildStatItem('Followers', '3.5K'),
                            _buildStatItem('Following', '450'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Text(
                    'Akbar Mustika',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkCharcoal),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '@akbarmstk',
                    style: TextStyle(fontSize: 16, color: lightGreyText),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Entrepreneur & Digital Nomad. Suka coding, kopi, dan traveling. Slogan: "Build amazing things, quietly."',
                    style: TextStyle(fontSize: 15, color: darkCharcoal.withOpacity(0.9)),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.snackbar(
                          'Edit Profil',
                          'Membuka halaman edit profil (Settings)',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: accentMustard.withOpacity(0.9),
                          colorText: darkCharcoal,
                          icon: Icon(Icons.edit, color: darkCharcoal),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primaryNavy,
                        side: BorderSide(color: primaryNavy, width: 2),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        'Edit Profil',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: primaryNavy.withOpacity(0.1), 
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.grid_on, color: primaryNavy, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Galeri Postingan',
                    style: TextStyle(color: primaryNavy, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(2.0),
            sliver: SliverGrid.builder(
              itemCount: 15, 
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, 
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Text(
                      'P${index + 1}',
                      style: TextStyle(color: lightGreyText, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: darkCharcoal),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: lightGreyText),
        ),
      ],
    );
  }
}
