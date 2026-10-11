
import 'package:flutter/material.dart';
import 'package:tautika/pages/task_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static const Color biru = Color(0xFF3478F6);
  static const Color navy = Color(0xFF173B78);

  final TextEditingController _controller = TextEditingController();

  String kataKunci = '';
  String filterAktif = 'Semua';

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

  List<Map<String, String>> get hasilPencarian {
    return postingan.where((item) {
      final cocokKata = [
        item['nama']!,
        item['judul']!,
        item['kategori']!,
        item['deskripsi']!,
      ].any(
        (teks) => teks.toLowerCase().contains(
              kataKunci.toLowerCase(),
            ),
      );

      final cocokFilter = filterAktif == 'Semua' ||
          item['jenis'] == filterAktif;

      return cocokKata && cocokFilter;
    }).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void bukaDetail(Map<String, String> item) {
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
  }

  @override
  Widget build(BuildContext context) {
    final hasil = hasilPencarian;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cari',
          style: TextStyle(
            color: navy,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              controller: _controller,
              onChanged: (nilai) {
                setState(() {
                  kataKunci = nilai.trim();
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari tugas, kuis, atau user...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: kataKunci.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _controller.clear();
                          setState(() {
                            kataKunci = '';
                          });
                        },
                        icon: const Icon(Icons.close),
                      )
                    : null,
                filled: true,
                fillColor: const Color(0xFFF2F6FC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Kategori',
              style: TextStyle(
                color: navy,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              children: ['Semua', 'Tugas', 'Kuis'].map((filter) {
                final terpilih = filterAktif == filter;

                return ChoiceChip(
                  label: Text(filter),
                  selected: terpilih,
                  onSelected: (_) {
                    setState(() {
                      filterAktif = filter;
                    });
                  },
                  selectedColor: biru,
                  backgroundColor: const Color(0xFFF0F5FC),
                  labelStyle: TextStyle(
                    color: terpilih ? Colors.white : Colors.black87,
                  ),
                  showCheckmark: false,
                  side: BorderSide.none,
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            Text(
              kataKunci.isEmpty
                  ? 'Postingan'
                  : 'Hasil pencarian',
              style: const TextStyle(
                color: navy,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            if (hasil.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 52,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Postingan tidak ditemukan',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Coba kata kunci atau kategori lain.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            else
              ...hasil.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _KartuHasil(
                    nama: item['nama']!,
                    waktu: item['waktu']!,
                    judul: item['judul']!,
                    kategori: item['kategori']!,
                    deskripsi: item['deskripsi']!,
                    visibilitas: item['visibilitas']!,
                    onTap: () => bukaDetail(item),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _KartuHasil extends StatelessWidget {
  final String nama;
  final String waktu;
  final String judul;
  final String kategori;
  final String deskripsi;
  final String visibilitas;
  final VoidCallback onTap;

  const _KartuHasil({
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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
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
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              judul,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              deskripsi,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                _LabelKecil(teks: kategori),
                _LabelKecil(teks: visibilitas),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LabelKecil extends StatelessWidget {
  final String teks;

  const _LabelKecil({required this.teks});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        teks,
        style: const TextStyle(
          color: Color(0xFF2459A9),
          fontSize: 11,
        ),
      ),
    );
  }
}