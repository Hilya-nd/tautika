import 'package:flutter/material.dart';
import 'quiz_result.dart';

class QuizDetailPage extends StatefulWidget {
  final String title;
  final String course;
  final String question;
  final List<String> options;
  final int correctIndex;

  const QuizDetailPage({
    super.key,
    required this.title,
    required this.course,
    required this.question,
    required this.options,
    required this.correctIndex,
  });

  @override
  State<QuizDetailPage> createState() => _QuizDetailPageState();
}

class _QuizDetailPageState extends State<QuizDetailPage> {
  int? _selectedIndex;

  void _finishQuiz() {
    if (_selectedIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Pilih salah satu jawaban terlebih dahulu.')),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => QuizResultPage(
          title: widget.title,
          isCorrect: _selectedIndex == widget.correctIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kerjakan Kuis')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(widget.course, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 5),
          Text(widget.title,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 18),
          LinearProgressIndicator(value: 1, minHeight: 6),
          const SizedBox(height: 8),
          const Text('Pertanyaan 1 dari 1'),
          const SizedBox(height: 22),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(widget.question,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(widget.options.length, (index) {
            return Card(
              child: RadioListTile<int>(
                value: index,
                groupValue: _selectedIndex,
                onChanged: (value) => setState(() => _selectedIndex = value),
                title: Text(
                    '${String.fromCharCode(65 + index)}. ${widget.options[index]}'),
              ),
            );
          }),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _finishQuiz,
            child: const Text('Selesai & Lihat Hasil'),
          ),
        ],
      ),
    );
  }
}
