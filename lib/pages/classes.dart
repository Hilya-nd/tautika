import 'package:flutter/material.dart';
import '../join_class.dart';
import '../class_detail.dart';
import '../notification.dart';


const Color tautikaBlue = Color(0xFF3478F6);
const Color tautikaPaleBlue = Color(0xFFEAF2FF);
const Color tautikaInk = Color(0xFF172B4D);
const Color tautikaMuted = Color(0xFF718096);

class ClassItem {
  const ClassItem({
    required this.title,
    required this.code,
    required this.lecturer,
    required this.members,
    required this.icon,
    required this.color,
  });

  final String title;
  final String code;
  final String lecturer;
  final int members;
  final IconData icon;
  final Color color;
}

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  static const List<ClassItem> demoClasses = [
    ClassItem(
      title: 'Pemrograman Berbasis Mobile',
      code: 'PBM 5D',
      lecturer: 'Pak Didi',
      members: 32,
      icon: Icons.phone_android_rounded,
      color: Color(0xFF3478F6),
    ),
    ClassItem(
      title: 'Data Mining',
      code: 'DM 5D',
      lecturer: 'Bu Rina',
      members: 28,
      icon: Icons.analytics_rounded,
      color: Color(0xFF24A89A),
    ),
    ClassItem(
      title: 'Technopreneurship',
      code: 'TP 5D',
      lecturer: 'Pak Budi',
      members: 24,
      icon: Icons.lightbulb_outline_rounded,
      color: Color(0xFF8B65D9),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Kelas Saya',
          style: TextStyle(color: tautikaInk, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
  tooltip: 'Notifikasi',
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const NotificationsPage(),
      ),
    );
  },
  icon: const Icon(
    Icons.notifications_none_rounded,
    color: tautikaBlue,
  ),
),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: OutlinedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const JoinClassPage()),
              ),
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text('Gabung Kelas'),
              style: OutlinedButton.styleFrom(
                foregroundColor: tautikaBlue,
                side: const BorderSide(color: Color(0xFFBBD2FF)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 24),
        children: [
          const Text(
            'Temukan materi dan tugas dari kelasmu.',
            style: TextStyle(color: tautikaMuted, fontSize: 13),
          ),
          const SizedBox(height: 18),
          ...demoClasses.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ClassCard(
                item: item,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ClassDetailPage(classItem: item),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: tautikaPaleBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline_rounded, color: tautikaBlue),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Gunakan kode kelas dari dosen untuk bergabung ke kelas baru.',
                    style: TextStyle(color: tautikaInk, fontSize: 12),
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

class _ClassCard extends StatelessWidget {
  const _ClassCard({required this.item, required this.onTap});
  final ClassItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE5ECF7)),
          ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: item.color.withOpacity(.11),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(item.icon, color: item.color, size: 26),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.code,
                        style: const TextStyle(
                            color: tautikaBlue,
                            fontWeight: FontWeight.w800,
                            fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(item.title,
                        style: const TextStyle(
                            color: tautikaInk,
                            fontWeight: FontWeight.w700,
                            fontSize: 14)),
                    const SizedBox(height: 5),
                    Text(item.lecturer,
                        style: const TextStyle(
                            color: tautikaMuted, fontSize: 12)),
                    const SizedBox(height: 9),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                        color: tautikaPaleBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${item.members} anggota',
                        style: const TextStyle(
                            color: tautikaBlue,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: tautikaMuted),
            ],
          ),
        ),
      ),
    );
  }
}

class _TautikaBottomBar extends StatelessWidget {
  const _TautikaBottomBar(
      {required this.selectedIndex, required this.onTap});
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.home_outlined, 'Home'),
      (Icons.search_rounded, 'Search'),
      (Icons.notifications_none_rounded, 'Notifikasi'),
      (Icons.class_outlined, 'Kelas'),
      (Icons.person_outline_rounded, 'Profil'),
    ];
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: tautikaBlue,
      unselectedItemColor: tautikaMuted,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      elevation: 8,
      items: items
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item.$1),
                label: item.$2,
              ))
          .toList(),
    );
  }
}
