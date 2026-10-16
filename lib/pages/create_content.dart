import 'package:flutter/material.dart';
import 'upload_task.dart';
import 'create_quiz.dart';

class CreateContentPage extends StatelessWidget {
  const CreateContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Konten')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 18),
            const Icon(Icons.edit_note, size: 64, color: Color(0xFF3157A4)),
            const SizedBox(height: 12),
            const Text(
              'Bagikan tugas atau buat kuis',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pilih jenis konten yang ingin kamu tambahkan ke TAUTIKA.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            _ChoiceCard(
              icon: Icons.upload_file,
              title: 'Upload Tugas',
              subtitle: 'Bagikan dokumen tugas atau catatan.',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UploadTaskPage()),
              ),
            ),
            const SizedBox(height: 14),
            _ChoiceCard(
              icon: Icons.quiz_outlined,
              title: 'Buat Kuis',
              subtitle: 'Buat kuis pilihan ganda sederhana.',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateQuizPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChoiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ChoiceCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE8EEFA),
          child: Icon(icon, color: const Color(0xFF3157A4)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
