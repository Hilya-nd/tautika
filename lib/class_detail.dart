import 'package:flutter/material.dart';
import 'pages/classes.dart';

class ClassDetailPage extends StatefulWidget {
  const ClassDetailPage({super.key, required this.classItem});
  final ClassItem classItem;

  @override
  State<ClassDetailPage> createState() => _ClassDetailPageState();
}

class _ClassDetailPageState extends State<ClassDetailPage> {
  int _tabIndex = 0;

  static const _members = [
    ('Pak Didi', 'Dosen', Icons.school_rounded),
    ('Stevani Putri', 'Mahasiswa', Icons.person_rounded),
    ('Nadrina', 'Mahasiswa', Icons.person_rounded),
    ('Althaf', 'Mahasiswa', Icons.person_rounded),
    ('Akmal', 'Mahasiswa', Icons.person_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final item = widget.classItem;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded, color: tautikaInk),
        ),
        title: Text(item.code,
            style: const TextStyle(
                color: tautikaInk, fontWeight: FontWeight.w800)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(19),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3478F6), Color(0xFF66A0FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(item.icon, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 5),
                      Text('Dosen: ${item.lecturer}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.people_alt_outlined,
                  label: 'Anggota',
                  value: '${item.members}',
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: _StatCard(
                  icon: Icons.folder_open_rounded,
                  label: 'Materi & Tugas',
                  value: '2',
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0FA),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                _TabButton(
                  label: 'Materi',
                  selected: _tabIndex == 0,
                  onTap: () => setState(() => _tabIndex = 0),
                ),
                _TabButton(
                  label: 'Anggota',
                  selected: _tabIndex == 1,
                  onTap: () => setState(() => _tabIndex = 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          if (_tabIndex == 0) ...[
            _MaterialCard(
              icon: Icons.menu_book_rounded,
              title: 'Pengenalan Flutter',
              subtitle: 'Materi • PDF • 12 Sep 2026',
            ),
            const SizedBox(height: 10),
            _MaterialCard(
              icon: Icons.assignment_outlined,
              title: 'Tugas UI Wireframe',
              subtitle: 'Tugas • Dikumpulkan 20 Sep 2026',
            ),
          ] else ...[
            ..._members.map(
              (member) => Container(
                margin: const EdgeInsets.only(bottom: 9),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFFE5ECF7)),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: tautikaPaleBlue,
                      child: Icon(member.$3, color: tautikaBlue),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(member.$1,
                              style: const TextStyle(
                                  color: tautikaInk,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 3),
                          Text(member.$2,
                              style: const TextStyle(
                                  color: tautikaMuted, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard(
      {required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5ECF7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: tautikaBlue),
          const SizedBox(height: 12),
          Text(value,
              style: const TextStyle(
                  color: tautikaInk,
                  fontWeight: FontWeight.w800,
                  fontSize: 21)),
          Text(label,
              style: const TextStyle(color: tautikaMuted, fontSize: 11)),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton(
      {required this.label, required this.selected, required this.onTap});
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(.04),
                      blurRadius: 5,
                    )
                  ]
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? tautikaBlue : tautikaMuted,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _MaterialCard extends StatelessWidget {
  const _MaterialCard(
      {required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5ECF7)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: tautikaPaleBlue,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: tautikaBlue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: tautikaInk, fontWeight: FontWeight.w700)),
                const SizedBox(height: 5),
                Text(subtitle,
                    style: const TextStyle(
                        color: tautikaMuted, fontSize: 11)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: tautikaMuted),
        ],
      ),
    );
  }
}
