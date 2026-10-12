class DataSampah {
  final String nama;
  final String emoji;
  final String kategori;
  final String deskripsi;
  final String manfaat;

  const DataSampah({
    required this.nama,
    required this.emoji,
    required this.kategori,
    required this.deskripsi,
    required this.manfaat,
  });
}

// DAFTAR SAMPAH DI LINGKUNGAN KAMPUS
const List<DataSampah> daftarSampah = [
  DataSampah(
    nama: 'Gelas Plastik',
    emoji: '🥤',
    kategori: 'Anorganik',
    deskripsi: 'Gelas plastik bekas minuman mahasiswa.',
    manfaat: 'Dapat dikumpulkan dan didaur ulang.',
  ),

  DataSampah(
    nama: 'Bungkus Snack',
    emoji: '🍫',
    kategori: 'Anorganik',
    deskripsi: 'Kemasan makanan ringan berbahan plastik.',
    manfaat: 'Pisahkan dari sampah organik.',
  ),

  DataSampah(
    nama: 'Kertas Bekas',
    emoji: '📄',
    kategori: 'Daur Ulang',
    deskripsi: 'Kertas tugas atau dokumen yang tidak digunakan.',
    manfaat: 'Dapat diolah kembali menjadi produk kertas.',
  ),

  DataSampah(
    nama: 'Daun Kering',
    emoji: '🍂',
    kategori: 'Organik',
    deskripsi: 'Daun yang berguguran di lingkungan kampus.',
    manfaat: 'Dapat dimanfaatkan sebagai bahan kompos.',
  ),

  DataSampah(
    nama: 'Kaleng Minuman',
    emoji: '🥫',
    kategori: 'Anorganik',
    deskripsi: 'Kaleng bekas minuman.',
    manfaat: 'Dapat didaur ulang menjadi produk logam baru.',
  ),

  DataSampah(
    nama: 'Sisa Makanan',
    emoji: '🍱',
    kategori: 'Organik',
    deskripsi: 'Sisa makanan dari kantin kampus.',
    manfaat: 'Sebagian dapat diolah menjadi kompos.',
  ),
];