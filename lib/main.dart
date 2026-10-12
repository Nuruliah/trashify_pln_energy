import 'package:flutter/material.dart';

import 'beranda.dart';
import 'pilah_sampah.dart';
import 'edukasi.dart';

void main() {
  runApp(const TrashifyApp());
}

// WARNA UTAMA APLIKASI
const Color biru = Color(0xFF07516B);
const Color toska = Color(0xFF19A6B5);
const Color background = Color(0xFFF2F8FA);

class TrashifyApp extends StatelessWidget {
  const TrashifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trashify PLN Energy',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: biru,
        ),
      ),
      home: const MainPage(),
    );
  }
}

// HALAMAN UTAMA DAN NAVIGASI
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int halaman = 0;
  int ecoPoints = 0;
  int jumlahBenar = 0;

  // MENAMBAH ECO POINTS
  void tambahPoin() {
    setState(() {
      ecoPoints += 10;
      jumlahBenar++;
    });
  }

  // PINDAH HALAMAN
  void pindahHalaman(int index) {
    setState(() {
      halaman = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Trashify PLN Energy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // TIGA HALAMAN APLIKASI
      body: IndexedStack(
        index: halaman,
        children: [
          BerandaPage(
            ecoPoints: ecoPoints,
            jumlahBenar: jumlahBenar,
            mulai: () => pindahHalaman(1),
          ),

          PilahSampahPage(
            onBenar: tambahPoin,
          ),

          const EdukasiPage(),
        ],
      ),

      // NAVIGASI BAWAH
      bottomNavigationBar: NavigationBar(
        selectedIndex: halaman,
        onDestinationSelected: pindahHalaman,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.recycling_outlined),
            selectedIcon: Icon(Icons.recycling),
            label: 'Pilah Sampah',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Edukasi',
          ),
        ],
      ),
    );
  }
}