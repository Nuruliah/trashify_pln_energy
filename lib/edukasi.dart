import 'package:flutter/material.dart';

class EdukasiPage extends StatelessWidget {
  const EdukasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    const biru = Color(0xFF07516B);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // JUDUL HALAMAN
          const Center(
            child: Column(
              children: [
                Icon(
                  Icons.menu_book,
                  size: 50,
                  color: biru,
                ),
                SizedBox(height: 10),
                Text(
                  'Edukasi Sampah',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: biru,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Kenali jenis sampah dan cara pengelolaannya',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // SAMPAH ORGANIK
          kartuEdukasi(
            judul: 'Sampah Organik',
            ikon: Icons.eco,
            warna: Colors.green,
            deskripsi:
                'Sampah organik berasal dari bahan alami '
                'yang dapat terurai secara biologis.',
            contoh: 'Contoh: daun kering dan sisa makanan.',
            manfaat:
                'Dapat diolah menjadi kompos untuk tanaman.',
          ),

          const SizedBox(height: 14),

          // SAMPAH ANORGANIK
          kartuEdukasi(
            judul: 'Sampah Anorganik',
            ikon: Icons.delete_outline,
            warna: Colors.orange,
            deskripsi:
                'Sampah anorganik umumnya berasal dari '
                'bahan nonhayati dan sebagian sulit terurai.',
            contoh:
                'Contoh: gelas plastik, bungkus snack, dan kaleng.',
            manfaat:
                'Sebagian dapat dimanfaatkan kembali '
                'atau didaur ulang.',
          ),

          const SizedBox(height: 14),

          // SAMPAH DAUR ULANG
          kartuEdukasi(
            judul: 'Sampah Daur Ulang',
            ikon: Icons.recycling,
            warna: Colors.blue,
            deskripsi:
                'Sampah daur ulang merupakan sampah '
                'yang masih dapat diproses menjadi produk baru.',
            contoh: 'Contoh: kertas bekas yang bersih.',
            manfaat:
                'Membantu mengurangi penggunaan bahan baku baru.',
          ),

          const SizedBox(height: 24),

          // ENERGI DAN LINGKUNGAN
          Card(
            color: const Color(0xFFE0F3F5),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  const Icon(
                    Icons.bolt,
                    color: Colors.orange,
                    size: 45,
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Sampah dan Energi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: biru,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Pengelolaan sampah yang baik dapat '
                    'mendukung efisiensi sumber daya. '
                    'Beberapa jenis sampah organik juga '
                    'dapat dimanfaatkan sebagai bahan '
                    'pembuatan biogas melalui pengolahan khusus.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // SDGS
          const Card(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Icon(
                    Icons.public,
                    size: 42,
                    color: Colors.green,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Mendukung SDGs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: biru,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Trashify PLN Energy mendukung '
                    'kesadaran pengelolaan sampah '
                    'dan penggunaan sumber daya secara '
                    'bertanggung jawab untuk menciptakan '
                    'lingkungan kampus yang berkelanjutan.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // FOOTER
          const Center(
            child: Text(
              'Institut Teknologi PLN\n'
              'Smart Waste, Greener Energy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // WIDGET KARTU EDUKASI
  Widget kartuEdukasi({
    required String judul,
    required IconData ikon,
    required Color warna,
    required String deskripsi,
    required String contoh,
    required String manfaat,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  ikon,
                  color: warna,
                  size: 32,
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(deskripsi),

            const SizedBox(height: 10),

            Text(
              contoh,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              manfaat,
              style: TextStyle(
                color: warna,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}