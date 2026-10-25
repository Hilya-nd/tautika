
import 'package:flutter/material.dart';
import 'app_colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() =>
      _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<_Notice> _notices = [
    _Notice(
      title: 'Materi baru ditambahkan',
      description:
          'Pak Didi menambahkan materi Pengenalan Flutter di kelas PBM 5D.',
      time: '10 menit lalu',
      icon: Icons.menu_book_rounded,
    ),
    _Notice(
      title: 'Berhasil bergabung ke kelas',
      description:
          'Kamu sudah bergabung ke kelas Data Mining 5D.',
      time: '1 jam lalu',
      icon: Icons.check_circle_outline_rounded,
    ),
    _Notice(
      title: 'Nadrina mengikuti kamu',
      description:
          'Nadrina mulai mengikuti profil TAUTIKA kamu.',
      time: '3 jam lalu',
      icon: Icons.person_add_alt_1_rounded,
    ),
    _Notice(
      title: 'Tugas diperbarui',
      description:
          'Informasi tugas UI Wireframe telah diperbarui.',
      time: 'Kemarin',
      icon: Icons.assignment_outlined,
    ),
  ];

  void _markAllRead() {
    setState(() {
      for (final notice in _notices) {
        notice.isRead = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final unread =
        _notices.where((notice) => !notice.isRead).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          tooltip: 'Kembali',
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: tautikaInk,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: tautikaInk,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          TextButton(
            onPressed: unread == 0 ? null : _markAllRead,
            child: const Text('Tandai semua dibaca'),
          ),
        ],
      ),
      body: _notices.isEmpty
          ? const Center(
              child: Text('Belum ada notifikasi'),
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                16, 16, 16, 28,
              ),
              children: [
                if (unread > 0)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      '$unread notifikasi belum dibaca',
                      style: const TextStyle(
                        color: tautikaMuted,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ..._notices.map(
                  (notice) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          notice.isRead = true;
                        });
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: notice.isRead
                              ? Colors.white
                              : const Color(0xFFF0F5FF),
                          borderRadius:
                              BorderRadius.circular(16),
                          border: Border.all(
                            color: notice.isRead
                                ? const Color(0xFFE5ECF7)
                                : const Color(0xFFD5E4FF),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: tautikaPaleBlue,
                                borderRadius:
                                    BorderRadius.circular(13),
                              ),
                              child: Icon(
                                notice.icon,
                                color: tautikaBlue,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notice.title,
                                    style: const TextStyle(
                                      color: tautikaInk,
                                      fontWeight:
                                          FontWeight.w800,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    notice.description,
                                    style: const TextStyle(
                                      color: tautikaMuted,
                                      fontSize: 12,
                                      height: 1.45,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    notice.time,
                                    style: const TextStyle(
                                      color: tautikaMuted,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (!notice.isRead)
                              Container(
                                width: 8,
                                height: 8,
                                margin: const EdgeInsets.only(
                                  top: 5,
                                  left: 8,
                                ),
                                decoration: const BoxDecoration(
                                  color: tautikaBlue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _Notice {
  _Notice({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    this.isRead = false,
  });

  final String title;
  final String description;
  final String time;
  final IconData icon;
  bool isRead;
}
