import 'package:flutter/material.dart';
import 'quiz_detail.dart';

class CreateQuizPage extends StatefulWidget {
  const CreateQuizPage({super.key});

  @override
  State<CreateQuizPage> createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _courseController = TextEditingController();
  final _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers =
      List.generate(4, (_) => TextEditingController());
  int _correctIndex = 0;

  @override
  void dispose() {
    _titleController.dispose();
    _courseController.dispose();
    _questionController.dispose();
    for (final controller in _optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _previewQuiz() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizDetailPage(
          title: _titleController.text.trim(),
          course: _courseController.text.trim(),
          question: _questionController.text.trim(),
          options: _optionControllers.map((c) => c.text.trim()).toList(),
          correctIndex: _correctIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Kuis')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text('Buat kuis pilihan ganda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
                'Versi UTS dibuat sederhana: satu soal contoh, empat opsi jawaban.'),
            const SizedBox(height: 18),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Judul kuis',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Judul wajib diisi' : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _courseController,
              decoration: const InputDecoration(
                labelText: 'Mata kuliah',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v == null || v.trim().isEmpty
                  ? 'Mata kuliah wajib diisi'
                  : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _questionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Pertanyaan',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (v) => v == null || v.trim().isEmpty
                  ? 'Pertanyaan wajib diisi'
                  : null,
            ),
            const SizedBox(height: 18),
            const Text('Pilihan jawaban',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...List.generate(4, (index) {
              final label = String.fromCharCode(65 + index);
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Radio<int>(
                      value: index,
                      groupValue: _correctIndex,
                      onChanged: (v) => setState(() => _correctIndex = v!),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _optionControllers[index],
                        decoration: InputDecoration(
                          labelText: 'Opsi $label',
                          border: const OutlineInputBorder(),
                        ),
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Opsi $label wajib diisi'
                            : null,
                      ),
                    ),
                  ],
                ),
              );
            }),
            const Text(
                'Pilih radio di samping opsi yang merupakan jawaban benar.',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 18),
            FilledButton(
              onPressed: _previewQuiz,
              child: const Text('Simpan & Lihat Kuis'),
            ),
          ],
        ),
      ),
    );
  }
}
