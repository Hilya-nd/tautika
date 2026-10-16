import 'package:flutter/material.dart';

class UploadTaskPage extends StatefulWidget {
  const UploadTaskPage({super.key});

  @override
  State<UploadTaskPage> createState() => _UploadTaskPageState();
}

class _UploadTaskPageState extends State<UploadTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _courseController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _visibility = 'Public';
  String _fileName = 'Belum ada file dipilih';

  @override
  void dispose() {
    _titleController.dispose();
    _courseController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Tugas "${_titleController.text}" berhasil disimpan (demo).'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Tugas')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text('Informasi Tugas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Judul tugas',
                hintText: 'Contoh: Rancangan UI aplikasi',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Judul wajib diisi'
                  : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _courseController,
              decoration: const InputDecoration(
                labelText: 'Mata kuliah',
                hintText: 'Contoh: Pemrograman Berbasis Mobile',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Mata kuliah wajib diisi'
                  : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                hintText: 'Jelaskan singkat isi tugas',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {
                setState(() => _fileName = 'contoh_tugas.pdf (simulasi)');
              },
              icon: const Icon(Icons.attach_file),
              label: const Text('Pilih File (simulasi)'),
            ),
            Text(_fileName, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            const Text('Visibilitas',
                style: TextStyle(fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Public'),
              subtitle: const Text('Dapat dilihat semua pengguna'),
              value: 'Public',
              groupValue: _visibility,
              onChanged: (v) => setState(() => _visibility = v!),
            ),
            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Followers'),
              subtitle: const Text('Dapat dilihat oleh pengikut'),
              value: 'Followers',
              groupValue: _visibility,
              onChanged: (v) => setState(() => _visibility = v!),
            ),
            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Dosen Only'),
              subtitle: const Text('Konsep akses untuk dosen kelas'),
              value: 'Dosen Only',
              groupValue: _visibility,
              onChanged: (v) => setState(() => _visibility = v!),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _submit,
              child: const Text('Simpan Tugas'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Catatan: pemilihan file dan penyimpanan masih simulasi UI, belum terhubung ke server/database.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
