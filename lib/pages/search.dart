
import 'package:flutter/material.dart';
import 'package:tautika/app_colors.dart';
import 'package:tautika/pages/task_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  String kategoriAktif = 'Semua';

  final List<Map<String, String>> postingan = [
    {
      'nama': 'Nadia Putri',
      'waktu': '10 menit lalu',
      'judul': 'Tugas Pemrograman Mobile',
      'kategori': 'Tugas',
      'deskripsi':
          'Buat aplikasi sederhana menggunakan Flutter dan widget dasar.',
      'visibilitas': 'Publik',
    },
    {
      'nama': 'Rizky Pratama',
      'waktu': '30 menit lalu',
      'judul': 'Kuis Dasar Dart',
      'kategori': 'Kuis',
      'deskripsi':
          'Uji pemahaman tentang variabel, tipe data, dan fungsi Dart.',
      'visibilitas': 'Publik',
    },
    {
      'nama': 'Salsa Amelia',
      'waktu': '1 jam lalu',
      'judul': 'Tugas UI/UX Aplikasi',
      'kategori': 'Tugas',
      'deskripsi':
          'Buat wireframe dengan memperhatikan warna, tipografi, dan navigasi.',
      'visibilitas': 'Kelas',
    },
    {
      'nama': 'Dimas Saputra',
      'waktu': '2 jam lalu',
      'judul': 'Kuis Struktur Data',
      'kategori': 'Kuis',
      'deskripsi':
          'Latihan soal tentang list, map, stack, dan queue.',
      'visibilitas': 'Kelas',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kataKunci = searchController.text.toLowerCase().trim();

    final hasil = postingan.where((data) {
      final cocokKategori = kategoriAktif == 'Semua' ||
          data['kategori'] == kategoriAktif;

      final cocokKataKunci =
          data['judul']!.toLowerCase().contains(kataKunci) ||
          data['nama']!.toLowerCase().contains(kataKunci) ||
          data['deskripsi']!.toLowerCase().contains(kataKunci);

      return cocokKategori && cocokKataKunci;
    }).toList();

    return Scaffold(
      backgroundColor: tautikaBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cari Postingan',
          style: TextStyle(
            color: tautikaInk,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 18),
            child: TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Cari tugas, kuis, atau pengguna...',
                hintStyle: const TextStyle(
                  color: tautikaMuted,
                  fontSize: 13,
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: tautikaBlue,
                ),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          searchController.clear();
                          setState(() {});
                        },
                        icon: const Icon(Icons.close_rounded),
                      )
                    : null,
                filled: true,
                fillColor: tautikaBackground,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: tautikaBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: tautikaBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: tautikaBlue,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          SizedBox(
            height: 42,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: ['Semua', 'Tugas', 'Kuis'].map((kategori) {
                final aktif = kategoriAktif == kategori;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    label: Text(kategori),
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
                        kategoriAktif = kategori;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${hasil.length} postingan ditemukan',
                style: const TextStyle(
                  color: tautikaMuted,
                  fontSize: 12,
                ),
              ),
            ),
          ),

          Expanded(
            child: hasil.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 56,
                          color: tautikaMuted,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Postingan tidak ditemukan',
                          style: TextStyle(
                            color: tautikaInk,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Coba kata kunci yang berbeda.',
                          style: TextStyle(
                            color: tautikaMuted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                    itemCount: hasil.length,
                    itemBuilder: (context, index) {
                      final data = hasil[index];
                      final isKuis = data['kategori'] == 'Kuis';

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
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
                                  backgroundColor: tautikaPaleBlue,
                                  child: Text(
                                    data['nama']![0],
                                    style: const TextStyle(
                                      color: tautikaBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['nama']!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: tautikaInk,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        data['waktu']!,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: tautikaMuted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
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
                                    data['kategori']!,
                                    style: TextStyle(
                                      color: isKuis
                                          ? const Color(0xFFB7791F)
                                          : tautikaBlue,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              data['judul']!,
                              style: const TextStyle(
                                color: tautikaInk,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              data['deskripsi']!,
                              style: const TextStyle(
                                color: Color(0xFF596579),
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 12),
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
                                  data['visibilitas']!,
                                  style: const TextStyle(
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
                                        builder: (_) => TaskDetailPage(
                                          nama: data['nama']!,
                                          waktu: data['waktu']!,
                                          judul: data['judul']!,
                                          kategori: data['kategori']!,
                                          deskripsi: data['deskripsi']!,
                                          visibilitas:
                                              data['visibilitas']!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Lihat detail',
                                    style: TextStyle(
                                      color: tautikaBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
