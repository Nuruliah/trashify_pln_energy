import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  final int ecoPoints;
  final int jumlahBenar;
  final VoidCallback mulai;

  const BerandaPage({
    super.key,
    required this.ecoPoints,
    required this.jumlahBenar,
    required this.mulai,
  });

  @override
  Widget build(BuildContext context) {
    const biru = Color(0xFF07516B);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // LOGO KAMPUS
          Image.asset(
            'assets/logo_itpln.png',
            height: 90,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 12),

          const Text(
            'INSTITUT TEKNOLOGI PLN',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: biru,
            ),
          ),

          const SizedBox(height: 20),

          // FOTO KAMPUS UTUH
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              'assets/kampus_itpln.jpg',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Trashify PLN Energy',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: biru,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Smart Waste, Greener Energy',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          // DESKRIPSI APLIKASI
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  const Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Mari belajar memilah sampah untuk menciptakan '
                    'lingkungan kampus ITPLN yang lebih bersih, '
                    'hijau, dan berkelanjutan.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ECO POINTS
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.bolt,
                          color: Colors.orange,
                          size: 30,
                        ),
                        Text(
                          '$ecoPoints',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('Eco Points'),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 30,
                        ),
                        Text(
                          '$jumlahBenar',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('Pilah Benar'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          // TOMBOL MULAI
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: mulai,
              icon: const Icon(Icons.recycling),
              label: const Text(
                'Mulai Pilah Sampah',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: biru,
                foregroundColor: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            '🌱 Mendukung Sustainable Development Goals (SDGs)',
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