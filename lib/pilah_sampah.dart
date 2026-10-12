import 'package:flutter/material.dart';
import 'data_sampah.dart';

class PilahSampahPage extends StatefulWidget {
  final VoidCallback onBenar;

  const PilahSampahPage({
    super.key,
    required this.onBenar,
  });

  @override
  State<PilahSampahPage> createState() => _PilahSampahPageState();
}

class _PilahSampahPageState extends State<PilahSampahPage> {
  // WARNA APLIKASI
  static const Color biru = Color(0xFF07516B);
  static const Color toska = Color(0xFF19A6B5);

  // STATE APLIKASI
  int indexSampah = 0;
  bool dipilih = false;
  Offset posisi = Offset.zero;

  final Set<int> sudahBenar = {};

  // DATA SAMPAH YANG SEDANG DITAMPILKAN
  DataSampah get sampah => daftarSampah[indexSampah];

  // GESTURE 1: TAP
  void pilihKartu() {
    setState(() {
      dipilih = !dipilih;
    });
  }

  // GESTURE 2: LONG PRESS
  void tampilkanInformasi() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            sampah.nama,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                sampah.emoji,
                style: const TextStyle(fontSize: 65),
              ),

              const SizedBox(height: 15),

              Text(
                sampah.deskripsi,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F3F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  sampah.manfaat,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: biru,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  // MEMERIKSA JAWABAN
  void periksaJawaban(String kategori) {
    bool benar = sampah.kategori == kategori;

    if (benar && !sudahBenar.contains(indexSampah)) {
      sudahBenar.add(indexSampah);
      widget.onBenar();
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          benar
              ? 'Benar! ${sampah.nama} termasuk $kategori. 🎉'
              : 'Belum tepat! Coba kategori lainnya.',
        ),
        backgroundColor: benar ? Colors.green : Colors.orange,
        duration: const Duration(seconds: 2),
      ),
    );

    setState(() {
      posisi = Offset.zero;
      dipilih = false;

      // LANJUT KE SAMPAH BERIKUTNYA
      if (benar) {
        indexSampah = (indexSampah + 1) % daftarSampah.length;
      }
    });
  }

  // GESTURE 3: DRAG / PAN
  void geserKartu(DragUpdateDetails details) {
    setState(() {
      posisi += details.delta;
    });
  }

  void selesaiGeser() {
    // MEMERIKSA POSISI AKHIR KARTU
    // Kategori ditentukan berdasarkan area tujuan.
    final lebarLayar = MediaQuery.of(context).size.width;

    // Titik tengah kartu setelah digeser
    final tengahX = lebarLayar / 2 + posisi.dx;

    // Kartu harus digeser cukup jauh ke bawah
    if (posisi.dy > 120) {
      String kategori;

      if (tengahX < lebarLayar / 3) {
        kategori = 'Organik';
      } else if (tengahX < lebarLayar * 2 / 3) {
        kategori = 'Anorganik';
      } else {
        kategori = 'Daur Ulang';
      }

      periksaJawaban(kategori);
    } else {
      setState(() {
        posisi = Offset.zero;
      });
    }
  }

  // WIDGET TEMPAT SAMPAH
  Widget tempatSampah({
    required String nama,
    required Color warna,
    required IconData ikon,
  }) {
    return Expanded(
      child: Container(
        height: 110,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: warna.withOpacity(0.12),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: warna,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              ikon,
              color: warna,
              size: 35,
            ),

            const SizedBox(height: 8),

            Text(
              nama,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: warna,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TAMPILAN HALAMAN
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // JUDUL
          const Text(
            'Ayo Pilah Sampah!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: biru,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Kenali sampah dan pilih tempat yang tepat.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          // PROGRES
          Card(
            color: const Color(0xFFE0F3F5),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.recycling,
                    color: biru,
                  ),

                  const SizedBox(width: 10),

                  Text(
                    'Sampah ${indexSampah + 1} dari '
                    '${daftarSampah.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: biru,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // PETUNJUK GESTURE
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: Icon(Icons.touch_app, size: 18),
                label: Text('Tap: Pilih'),
              ),
              Chip(
                avatar: Icon(Icons.info_outline, size: 18),
                label: Text('Tahan: Info'),
              ),
              Chip(
                avatar: Icon(Icons.swipe, size: 18),
                label: Text('Geser: Pilah'),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // KARTU SAMPAH
          SizedBox(
            height: 250,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.translate(
                    offset: posisi,
                    child: GestureDetector(
                      onTap: pilihKartu,
                      onLongPress: tampilkanInformasi,
                      onPanUpdate: geserKartu,
                      onPanEnd: (_) => selesaiGeser(),

                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          color: dipilih
                              ? const Color(0xFFB8E7EB)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: dipilih ? toska : biru,
                            width: dipilih ? 3 : 1.5,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 12,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sampah.emoji,
                              style: const TextStyle(
                                fontSize: 72,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              sampah.nama,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: biru,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              dipilih
                                  ? 'Dipilih ✓'
                                  : 'Ketuk untuk memilih',
                              style: TextStyle(
                                fontSize: 12,
                                color: dipilih
                                    ? Colors.teal
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Geser kartu ke tempat sampah yang sesuai',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: biru,
            ),
          ),

          const SizedBox(height: 16),

          // TIGA TEMPAT SAMPAH
          Row(
            children: [
              tempatSampah(
                nama: 'Organik',
                warna: Colors.green,
                ikon: Icons.eco,
              ),

              tempatSampah(
                nama: 'Anorganik',
                warna: Colors.orange,
                ikon: Icons.delete_outline,
              ),

              tempatSampah(
                nama: 'Daur Ulang',
                warna: Colors.blue,
                ikon: Icons.recycling,
              ),
            ],
          ),

          const SizedBox(height: 26),

          // JUDUL PILIHAN SAMPAH
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Jenis Sampah Kampus',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: biru,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // DAFTAR SAMPAH
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: daftarSampah.length,
              itemBuilder: (context, index) {
                final item = daftarSampah[index];
                final aktif = index == indexSampah;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      indexSampah = index;
                      dipilih = false;
                      posisi = Offset.zero;
                    });
                  },

                  child: Container(
                    width: 105,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: aktif
                          ? const Color(0xFFB8E7EB)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: aktif ? biru : Colors.grey.shade300,
                        width: aktif ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.emoji,
                          style: const TextStyle(fontSize: 35),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          item.nama,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // FOOTER
          const Text(
            'Trashify PLN Energy\n'
            'Smart Waste, Greener Energy',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}