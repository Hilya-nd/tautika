import 'package:flutter/material.dart';

class QuizResultPage extends StatelessWidget {
  final String title;
  final bool isCorrect;

  const QuizResultPage({
    super.key,
    required this.title,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    final score = isCorrect ? 100 : 0;
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Kuis')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.info_outline,
                size: 76,
                color: isCorrect ? Colors.green : Colors.orange,
              ),
              const SizedBox(height: 18),
              const Text('Kuis selesai!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(title, textAlign: TextAlign.center),
              const SizedBox(height: 18),
              Text('$score / 100',
                  style: const TextStyle(
                      fontSize: 38, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(isCorrect
                  ? 'Jawaban benar: 1 • Salah: 0'
                  : 'Jawaban benar: 0 • Salah: 1'),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () =>
                      Navigator.popUntil(context, (route) => route.isFirst),
                  child: const Text('Kembali'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
