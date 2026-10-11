
import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  final String nama;
  final String waktu;
  final String judul;
  final String kategori;
  final String deskripsi;
  final String visibilitas;

  const TaskDetailPage({
    super.key,
    required this.nama,
    required this.waktu,
    required this.judul,
    required this.kategori,
    required this.deskripsi,
    required this.visibilitas,
  });

  static const Color biru = Color(0xFF3478F6);
  static const Color navy = Color(0xFF173B78);
  static const Color latar = Color(0xFFF2F6FC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: navy,
        elevation: 0,
        title: const Text(
          'Detail Postingan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Informasi pembuat postingan
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFFDCEBFF),
                child: Icon(
                  Icons.person,
                  color: biru,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Diunggah $waktu',
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

          const SizedBox(height: 24),

          // Kategori dan visibilitas
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const _Label(
                teks: 'Tugas / Kuis',
                ikon: Icons.quiz_outlined,
              ),
              _Label(
                teks: kategori,
                ikon: Icons.book_outlined,
              ),
              _Label(
                teks: visibilitas,
                ikon: Icons.public,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Judul postingan
          Text(
            judul,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: navy,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            deskripsi,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          const _BagianJudul(judul: 'Deskripsi'),

          const SizedBox(height: 10),

          const Text(
            'Pelajari materi dan perhatikan instruksi yang '
            'diberikan oleh pembuat postingan. Gunakan informasi '
            'dan lampiran yang tersedia sebagai referensi '
            'untuk menyelesaikan tugas atau memahami materi kuis.',
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 24),

          const _BagianJudul(judul: 'Informasi'),

          const SizedBox(height: 12),

          _InfoBaris(
            ikon: Icons.person_outline,
            label: 'Pembuat',
            nilai: nama,
          ),

          const SizedBox(height: 12),

          _InfoBaris(
            ikon: Icons.category_outlined,
            label: 'Kategori',
            nilai: kategori,
          ),

          const SizedBox(height: 12),

          _InfoBaris(
            ikon: Icons.visibility_outlined,
            label: 'Visibilitas',
            nilai: visibilitas,
          ),

          const SizedBox(height: 24),

          const _BagianJudul(judul: 'Lampiran'),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: latar,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFFE2EAF5),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.insert_drive_file_outlined,
                  color: biru,
                  size: 34,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lampiran postingan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'File belum tersedia',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.download_outlined,
                  color: biru,
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Tombol aksi awal
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Fitur simpan belum tersedia.',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.bookmark_border),
                  label: const Text('Simpan'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: biru,
                    side: const BorderSide(color: biru),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Fitur bagikan belum tersedia.',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.share_outlined),
                  label: const Text('Bagikan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: biru,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _BagianJudul extends StatelessWidget {
  final String judul;

  const _BagianJudul({
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      judul,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: TaskDetailPage.navy,
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String teks;
  final IconData ikon;

  const _Label({
    required this.teks,
    required this.ikon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            ikon,
            size: 15,
            color: TaskDetailPage.biru,
          ),
          const SizedBox(width: 5),
          Text(
            teks,
            style: const TextStyle(
              color: Color(0xFF2459A9),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBaris extends StatelessWidget {
  final IconData ikon;
  final String label;
  final String nilai;

  const _InfoBaris({
    required this.ikon,
    required this.label,
    required this.nilai,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          ikon,
          color: TaskDetailPage.biru,
          size: 21,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        Flexible(
          child: Text(
            nilai,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: TaskDetailPage.navy,
            ),
          ),
        ),
      ],
    );
  }
}