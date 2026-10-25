
import 'package:flutter/material.dart';
import 'package:tautika/app_colors.dart';
import 'package:tautika/pages/login.dart';
import 'package:tautika/navbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _nimController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmasiController = TextEditingController();

  bool _sembunyikanPassword = true;
  bool _sembunyikanKonfirmasi = true;

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _nimController.dispose();
    _passwordController.dispose();
    _konfirmasiController.dispose();
    super.dispose();
  }

  void _daftar() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Registrasi berhasil disimulasikan.',
        ),
      ),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => navbar(),
      ),
      (route) => false,
    );
  }

  InputDecoration _dekorasiInput({
    required String hint,
    required IconData ikon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: tautikaMuted,
        fontSize: 13,
      ),
      prefixIcon: Icon(
        ikon,
        color: const Color(0xFF626B7A),
        size: 20,
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFFF1F4FC),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(
          color: tautikaBlue,
          width: 1.4,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: tautikaInk,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Registrasi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Logo huruf T
                Container(
                  width: 66,
                  height: 66,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF38A5FF),
                        Color(0xFF1454E8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'T',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 47,
                        fontWeight: FontWeight.w900,
                        height: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Buat Akun TAUTIKA',
                  style: TextStyle(
                    color: tautikaInk,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Daftar untuk mulai terhubung dan belajar bersama.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: tautikaMuted,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 26),

                // Nama lengkap
                TextFormField(
                  controller: _namaController,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  decoration: _dekorasiInput(
                    hint: 'Nama lengkap',
                    ikon: Icons.person_outline,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama lengkap wajib diisi';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 13),

                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: _dekorasiInput(
                    hint: 'Email',
                    ikon: Icons.mail_outline,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }
                    if (!value.trim().contains('@') ||
                        !value.trim().contains('.')) {
                      return 'Masukkan email yang valid';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 13),

                // NIM
                TextFormField(
                  controller: _nimController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: _dekorasiInput(
                    hint: 'NIM',
                    ikon: Icons.badge_outlined,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'NIM wajib diisi';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 13),

                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _sembunyikanPassword,
                  textInputAction: TextInputAction.next,
                  decoration: _dekorasiInput(
                    hint: 'Kata sandi',
                    ikon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _sembunyikanPassword =
                              !_sembunyikanPassword;
                        });
                      },
                      icon: Icon(
                        _sembunyikanPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20,
                        color: tautikaMuted,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata sandi wajib diisi';
                    }
                    if (value.length < 6) {
                      return 'Kata sandi minimal 6 karakter';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 13),

                // Konfirmasi password
                TextFormField(
                  controller: _konfirmasiController,
                  obscureText: _sembunyikanKonfirmasi,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _daftar(),
                  decoration: _dekorasiInput(
                    hint: 'Konfirmasi kata sandi',
                    ikon: Icons.lock_reset_outlined,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _sembunyikanKonfirmasi =
                              !_sembunyikanKonfirmasi;
                        });
                      },
                      icon: Icon(
                        _sembunyikanKonfirmasi
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20,
                        color: tautikaMuted,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi kata sandi wajib diisi';
                    }
                    if (value != _passwordController.text) {
                      return 'Kata sandi tidak cocok';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Tombol daftar
                SizedBox(
                  width: double.infinity,
                  height: 49,
                  child: ElevatedButton(
                    onPressed: _daftar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tautikaBlue,
                      foregroundColor: Colors.white,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Kembali ke Login
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      'Sudah punya akun?',
                      style: TextStyle(
                        fontSize: 12,
                        color: tautikaMuted,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: tautikaBlue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                      ),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}