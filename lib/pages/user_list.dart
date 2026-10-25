
import 'package:flutter/material.dart';
import 'other_profile.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  static const Color primaryBlue = Color(0xff4F7FFF);
  static const Color background = Color(0xffF8FAFF);
  static const Color borderGrey = Color(0xffD9E0EA);
  static const Color textGrey = Color(0xff687280);
  static const Color darkText = Color(0xff1E293B);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final TextEditingController _searchController =
      TextEditingController();

  String kataKunci = '';

  final List<Map<String, String>> daftarAkun = [
    {
      'nama': 'Niki',
      'username': '@lalalostyou',
      'jurusan': 'Informatika - 5D',
    },
    {
      'nama': 'Olivia Rodrigo',
      'username': '@oliviarodrigo',
      'jurusan': 'Informatika - 5D',
    },
    {
      'nama': 'Ariana Grande',
      'username': '@everythingyouare',
      'jurusan': 'Informatika - 5D',
    },
    {
      'nama': 'Selena Gomez',
      'username': '@damdam',
      'jurusan': 'Informatika - 5D',
    },
  ];

  List<Map<String, String>> get akunTersaring {
    final query = kataKunci.trim().toLowerCase();

    if (query.isEmpty) {
      return daftarAkun;
    }

    return daftarAkun.where((akun) {
      return akun['nama']!.toLowerCase().contains(query) ||
          akun['username']!.toLowerCase().contains(query) ||
          akun['jurusan']!.toLowerCase().contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void bukaProfil(Map<String, String> akun) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtherProfilePage(
          nama: akun['nama']!,
          username: akun['username']!,
          jurusan: akun['jurusan']!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasil = akunTersaring;

    return Scaffold(
      backgroundColor: UserListPage.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: UserListPage.darkText,
        elevation: 0,
        title: const Text(
          'Cari Mahasiswa',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: UserListPage.darkText,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: UserListPage.borderGrey,
                ),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    kataKunci = value;
                  });
                },
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.search_rounded,
                    color: UserListPage.primaryBlue,
                  ),
                  hintText: 'Cari mahasiswa',
                  hintStyle: const TextStyle(
                    color: UserListPage.textGrey,
                  ),
                  border: InputBorder.none,
                  suffixIcon: kataKunci.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              kataKunci = '';
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Rekomendasi Akun',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: UserListPage.darkText,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: hasil.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person_search_rounded,
                            size: 55,
                            color: UserListPage.textGrey,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Mahasiswa tidak ditemukan',
                            style: TextStyle(
                              color: UserListPage.darkText,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Coba nama atau username lain.',
                            style: TextStyle(
                              color: UserListPage.textGrey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: hasil.length,
                      itemBuilder: (context, index) {
                        final akun = hasil[index];

                        return accountCard(
                          akun['nama']!,
                          akun['username']!,
                          akun['jurusan']!,
                          () => bukaProfil(akun),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget accountCard(
    String nama,
    String username,
    String jurusan,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: UserListPage.borderGrey,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffEBF0FF),
                border: Border.all(
                  color: UserListPage.primaryBlue,
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.person_outline_rounded,
                color: UserListPage.primaryBlue,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: UserListPage.darkText,
                    ),
                  ),
                  Text(
                    username,
                    style: const TextStyle(
                      color: UserListPage.textGrey,
                    ),
                  ),
                  Text(
                    jurusan,
                    style: const TextStyle(
                      color: UserListPage.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: UserListPage.primaryBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onTap,
              child: const Text('Lihat'),
            ),
          ],
        ),
      ),
    );
  }
}
