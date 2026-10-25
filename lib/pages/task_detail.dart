
import 'package:flutter/material.dart';
import 'package:tautika/app_colors.dart';

class TaskDetailPage extends StatefulWidget {
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

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  final TextEditingController komentarController = TextEditingController();
  final List<String> komentar = [];
  bool disukai = false;

  @override
  void dispose() {
    komentarController.dispose();
    super.dispose();
  }

  void kirimKomentar() {
    final teks = komentarController.text.trim();

    if (teks.isEmpty) return;

    setState(() {
      komentar.add(teks);
      komentarController.clear();
    });

    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final isKuis = widget.kategori == 'Kuis';

    return Scaffold(
      backgroundColor: tautikaBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: tautikaInk),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail Postingan',
          style: TextStyle(
            color: tautikaInk,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: tautikaBorder.withAlpha(150)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: tautikaPaleBlue,
                      child: Icon(
                        Icons.person_rounded,
                        color: tautikaBlue,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: tautikaInk,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.waktu,
                            style: const TextStyle(
                              color: tautikaMuted,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.more_horiz_rounded,
                      color: tautikaMuted,
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: isKuis
                        ? const Color(0xFFFFF3DD)
                        : tautikaPaleBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.kategori,
                    style: TextStyle(
                      color: isKuis
                          ? const Color(0xFFB7791F)
                          : tautikaBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.judul,
                  style: const TextStyle(
                    color: tautikaInk,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.deskripsi,
                  style: const TextStyle(
                    color: Color(0xFF596579),
                    fontSize: 14,
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(color: tautikaBorder),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      widget.visibilitas == 'Publik'
                          ? Icons.public_rounded
                          : Icons.groups_rounded,
                      size: 18,
                      color: tautikaMuted,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Visibilitas: ${widget.visibilitas}',
                      style: const TextStyle(
                        color: tautikaMuted,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          disukai = !disukai;
                        });
                      },
                      icon: Icon(
                        disukai
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: disukai ? Colors.red : tautikaBlue,
                        size: 19,
                      ),
                      label: Text(
                        disukai ? 'Disukai' : 'Suka',
                        style: const TextStyle(color: tautikaInk),
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(
                          FocusNode(),
                        );
                      },
                      icon: const Icon(
                        Icons.chat_bubble_outline,
                        size: 18,
                      ),
                      label: Text('Komentar (${komentar.length})'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: tautikaBorder.withAlpha(150)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Komentar',
                  style: TextStyle(
                    color: tautikaInk,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 19,
                      backgroundColor: tautikaPaleBlue,
                      child: Icon(
                        Icons.person,
                        color: tautikaBlue,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: komentarController,
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Tulis komentar...',
                          filled: true,
                          fillColor: tautikaBackground,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: tautikaBorder,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: tautikaBorder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: tautikaBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: kirimKomentar,
                      icon: const Icon(
                        Icons.send_rounded,
                        color: tautikaBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                if (komentar.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        'Belum ada komentar. Jadilah yang pertama!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: tautikaMuted,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                else
                  ...komentar.map(
                    (teks) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        backgroundColor: tautikaPaleBlue,
                        child: Icon(
                          Icons.person,
                          color: tautikaBlue,
                        ),
                      ),
                      title: const Text(
                        'Kamu',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      subtitle: Text(teks),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}