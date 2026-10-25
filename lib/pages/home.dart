
import 'package:flutter/material.dart';
import 'package:tautika/app_colors.dart';
import 'package:tautika/pages/task_detail.dart';
import 'package:tautika/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String kategoriAktif = 'Semua';

  final List<Map<String, dynamic>> postingan = [
    {
      'nama': 'Nadia Putri',
      'inisial': 'N',
      'waktu': '10 menit lalu',
      'judul': 'Tugas Pemrograman Mobile',
      'deskripsi':
          'Buat aplikasi sederhana menggunakan Flutter dengan menerapkan widget dasar dan navigasi.',
      'kategori': 'Tugas',
      'visibilitas': 'Publik',
    },
    {
      'nama': 'Rizky Pratama',
      'inisial': 'R',
      'waktu': '30 menit lalu',
      'judul': 'Kuis Dasar Dart',
      'deskripsi':
          'Uji pemahamanmu tentang variabel, tipe data, fungsi, dan percabangan dalam Dart.',
      'kategori': 'Kuis',
      'visibilitas': 'Publik',
    },
    {
      'nama': 'Salsa Amelia',
      'inisial': 'S',
      'waktu': '1 jam lalu',
      'judul': 'Tugas UI/UX Aplikasi',
      'deskripsi':
          'Buat wireframe aplikasi dengan memperhatikan konsistensi warna, tipografi, dan navigasi.',
      'kategori': 'Tugas',
      'visibilitas': 'Kelas',
    },
  ];

  final Set<int> disukai = {};
  final Map<int, int> jumlahSuka = {
    0: 12,
    1: 8,
    2: 15,
  };

  @override
  Widget build(BuildContext context) {
    final daftarTampil = postingan.asMap().entries.where((entry) {
      return kategoriAktif == 'Semua' ||
          entry.value['kategori'] == kategoriAktif;
    }).toList();

    return Scaffold(
      backgroundColor: tautikaBackground,
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _sapaan(),
            _filterKategori(),
            Expanded(
              child: daftarTampil.isEmpty
                  ? const Center(
                      child: Text('Belum ada postingan.'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        8,
                        16,
                        20,
                      ),
                      itemCount: daftarTampil.length,
                      itemBuilder: (context, index) {
                        final entry = daftarTampil[index];
                        final id = entry.key;
                        final data = entry.value;

                        return _kartuPostingan(data, id);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // HEADER DAN TOMBOL NOTIFIKASI
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF38A5FF),
                  Color(0xFF1454E8),
                ],
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            alignment: Alignment.center,
            child: const Text(
              'T',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 11),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TAUTIKA',
                style: TextStyle(
                  color: tautikaInk,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Text(
                'Temukan inspirasi belajar',
                style: TextStyle(
                  color: tautikaMuted,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Notifikasi',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: tautikaInk,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  // KARTU SAPAAN
  Widget _sapaan() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3478F6),
            Color(0xFF2056C7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, teman belajar!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Bagikan tugas, ikuti kuis, dan belajar bersama komunitasmu.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // FILTER SEMUA, TUGAS, DAN KUIS
  Widget _filterKategori() {
    final kategori = ['Semua', 'Tugas', 'Kuis'];

    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: kategori.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = kategori[index];
          final aktif = kategoriAktif == item;

          return ChoiceChip(
            label: Text(item),
            selected: aktif,
            showCheckmark: false,
            selectedColor: tautikaBlue,
            backgroundColor: Colors.white,
            side: BorderSide(
              color: aktif ? tautikaBlue : tautikaBorder,
            ),
            labelStyle: TextStyle(
              color: aktif ? Colors.white : tautikaMuted,
              fontWeight: FontWeight.w600,
            ),
            onSelected: (_) {
              setState(() {
                kategoriAktif = item;
              });
            },
          );
        },
      ),
    );
  }

  // KARTU POSTINGAN
  Widget _kartuPostingan(
    Map<String, dynamic> data,
    int id,
  ) {
    final sudahDisukai = disukai.contains(id);
    final isKuis = data['kategori'] == 'Kuis';

    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: tautikaBorder.withAlpha(150),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: tautikaPaleBlue,
                child: Text(
                  data['inisial'],
                  style: const TextStyle(
                    color: tautikaBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['nama'],
                      style: const TextStyle(
                        color: tautikaInk,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      data['waktu'],
                      style: const TextStyle(
                        color: tautikaMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              _labelKategori(data['kategori']),
            ],
          ),
          const SizedBox(height: 17),
          Text(
            data['judul'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: tautikaInk,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data['deskripsi'],
            style: const TextStyle(
              color: Color(0xFF596579),
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Icon(
                data['visibilitas'] == 'Publik'
                    ? Icons.public_rounded
                    : Icons.groups_rounded,
                size: 16,
                color: tautikaMuted,
              ),
              const SizedBox(width: 5),
              Text(
                data['visibilitas'],
                style: const TextStyle(
                  color: tautikaMuted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Divider(
            height: 25,
            color: tautikaBorder,
          ),
          Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  setState(() {
                    if (sudahDisukai) {
                      disukai.remove(id);
                      jumlahSuka[id] =
                          (jumlahSuka[id] ?? 0) - 1;
                    } else {
                      disukai.add(id);
                      jumlahSuka[id] =
                          (jumlahSuka[id] ?? 0) + 1;
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(
                        sudahDisukai
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: sudahDisukai
                            ? Colors.red
                            : tautikaMuted,
                        size: 21,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${jumlahSuka[id] ?? 0}',
                        style: const TextStyle(
                          color: tautikaMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.chat_bubble_outline_rounded,
                color: tautikaMuted,
                size: 20,
              ),
              const SizedBox(width: 6),
              const Text(
                'Komentar',
                style: TextStyle(
                  color: tautikaMuted,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailPage(
                        nama: data['nama'],
                        waktu: data['waktu'],
                        judul: data['judul'],
                        kategori: data['kategori'],
                        deskripsi: data['deskripsi'],
                        visibilitas: data['visibilitas'],
                      ),
                    ),
                  );
                },
                child: Text(
                  isKuis ? 'Lihat kuis' : 'Lihat tugas',
                  style: const TextStyle(
                    color: tautikaBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // LABEL KATEGORI
  Widget _labelKategori(String kategori) {
    final isKuis = kategori == 'Kuis';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: isKuis
            ? const Color(0xFFFFF3DD)
            : tautikaPaleBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        kategori,
        style: TextStyle(
          color: isKuis
              ? const Color(0xFFB7791F)
              : tautikaBlue,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}