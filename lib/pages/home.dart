
import 'package:flutter/material.dart';
import 'package:tautika/pages/task_detail.dart';
import 'package:tautika/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color biru = Color(0xFF3478F6);
  static const Color navy = Color(0xFF173B78);

  String kategoriDipilih = 'Semua';

  final List<Map<String, String>> postingan = [
    {
      'nama': 'Nadrina',
      'waktu': '2 jam lalu',
      'judul': 'Kuis Struktur Data',
      'kategori': 'Struktur Data',
      'deskripsi': '5 soal • Informatika',
      'visibilitas': 'Public',
      'jenis': 'Kuis',
    },
    {
      'nama': 'Stevani Eka Putri G',
      'waktu': '4 jam lalu',
      'judul': 'UI/UX Design - TaskHub',
      'kategori': 'UI/UX',
      'deskripsi': 'PDF • 2.4 MB',
      'visibilitas': 'Public',
      'jenis': 'Tugas',
    },
    {
      'nama': 'Dila',
      'waktu': '6 jam lalu',
      'judul': 'Analisis Data - Dataset Penjualan',
      'kategori': 'Data Science',
      'deskripsi': 'PDF • 1.8 MB',
      'visibilitas': 'Followers',
      'jenis': 'Tugas',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> postinganTampil =
        postingan.where((item) {
      return kategoriDipilih == 'Semua' ||
          item['jenis'] == kategoriDipilih;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'TAUTIKA',
          style: TextStyle(
            color: navy,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: navy,
            ),
            tooltip: 'Notifikasi',
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                _FilterItem(
                  label: 'Semua',
                  selected: kategoriDipilih == 'Semua',
                  onTap: () {
                    setState(() {
                      kategoriDipilih = 'Semua';
                    });
                  },
                ),
                const SizedBox(width: 8),
                _FilterItem(
                  label: 'Tugas',
                  selected: kategoriDipilih == 'Tugas',
                  onTap: () {
                    setState(() {
                      kategoriDipilih = 'Tugas';
                    });
                  },
                ),
                const SizedBox(width: 8),
                _FilterItem(
                  label: 'Kuis',
                  selected: kategoriDipilih == 'Kuis',
                  onTap: () {
                    setState(() {
                      kategoriDipilih = 'Kuis';
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 22),

            const Text(
              'Postingan Terbaru',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),

            const SizedBox(height: 12),

            if (postinganTampil.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: Text('Belum ada postingan untuk kategori ini.'),
                ),
              )
            else
              ...postinganTampil.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _TaskCard(
                    nama: item['nama']!,
                    waktu: item['waktu']!,
                    judul: item['judul']!,
                    kategori: item['kategori']!,
                    deskripsi: item['deskripsi']!,
                    visibilitas: item['visibilitas']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskDetailPage(
                            nama: item['nama']!,
                            waktu: item['waktu']!,
                            judul: item['judul']!,
                            kategori: item['kategori']!,
                            deskripsi: item['deskripsi']!,
                            visibilitas: item['visibilitas']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}

class _FilterItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterItem({
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF3478F6)
              : const Color(0xFFF0F5FC),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final String nama;
  final String waktu;
  final String judul;
  final String kategori;
  final String deskripsi;
  final String visibilitas;
  final VoidCallback onTap;

  const _TaskCard({
    required this.nama,
    required this.waktu,
    required this.judul,
    required this.kategori,
    required this.deskripsi,
    required this.visibilitas,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE2EAF5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 19,
                  backgroundColor: Color(0xFFDCEBFF),
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF3478F6),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        waktu,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              judul,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              deskripsi,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                _Tag(label: kategori),
                const Spacer(),
                _Tag(label: visibilitas),
              ],
            ),

            const Divider(height: 24),

            const Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 19,
                  color: Colors.pink,
                ),
                SizedBox(width: 5),
                Text('12'),
                SizedBox(width: 18),
                Icon(
                  Icons.chat_bubble_outline,
                  size: 18,
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Text('3'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;

  const _Tag({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF2459A9),
        ),
      ),
    );
  }
}
