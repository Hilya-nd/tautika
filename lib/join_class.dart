import 'package:flutter/material.dart';
import 'pages/classes.dart';

class JoinClassPage extends StatefulWidget {
  const JoinClassPage({super.key});

  @override
  State<JoinClassPage> createState() => _JoinClassPageState();
}

class _JoinClassPageState extends State<JoinClassPage> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _joinClass() {
    if (!_formKey.currentState!.validate()) return;
    final code = _codeController.text.trim().toUpperCase();

    // Demo UI: kelas belum disimpan ke database/backend.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Kode "$code" valid untuk demo. Sambungkan backend agar kelas tersimpan.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: tautikaInk),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Gabung Kelas',
            style: TextStyle(color: tautikaInk, fontWeight: FontWeight.w800)),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFE5ECF7)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 76,
                      width: 76,
                      decoration: BoxDecoration(
                        color: tautikaPaleBlue,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(Icons.meeting_room_rounded,
                          size: 38, color: tautikaBlue),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text('Masukkan kode kelas',
                      style: TextStyle(
                          color: tautikaInk,
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 8),
                  const Text(
                    'Minta kode kelas kepada dosen, lalu masukkan kode tersebut di bawah.',
                    style: TextStyle(color: tautikaMuted, height: 1.5),
                  ),
                  const SizedBox(height: 22),
                  const Text('Kode Kelas',
                      style: TextStyle(
                          color: tautikaInk, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _codeController,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'Contoh: PBM5D-2026',
                      filled: true,
                      fillColor: const Color(0xFFFAFBFE),
                      prefixIcon: const Icon(Icons.key_rounded,
                          color: tautikaBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide:
                            const BorderSide(color: Color(0xFFDCE6F5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide:
                            const BorderSide(color: Color(0xFFDCE6F5)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Kode kelas wajib diisi.';
                      }
                      if (value.trim().length < 4) {
                        return 'Kode kelas minimal 4 karakter.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _joinClass,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tautikaBlue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: const Text('Gabung Kelas',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
