import 'dart:async'; // ✅ [Tambahan] Untuk membuat timer otomatis
import 'package:flutter/material.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  // ✅ [Tambahan] PageController untuk mengontrol perpindahan halaman
  final PageController _pageController = PageController();

  // ✅ [Tambahan] Daftar gambar untuk di-slide
  final List<String> gambarList = [
    'https://c.inilah.com/reborn/2024/09/large_Profil_Timothy_Ronald_Salah_Satu_Investor_Saham_dan_Crypto_Sukses_di_Indonesia_11zon_29bc8826ba.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA2YwS0fDR1cudbNq8X3m1P0gDQF09CBs3ew&s',
    'https://i.ytimg.com/vi/KlurwqV9sCk/sddefault.jpg',
  ];

  int _currentPage = 0;
  Timer? _timer; // ✅ [Tambahan] Timer untuk auto-slide

  @override
  void initState() {
    super.initState();

    // ✅ [Tambahan] Timer berjalan setiap 3 detik untuk auto-slide
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < gambarList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      // ✅ [Tambahan] Perpindahan halaman otomatis
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // ✅ [Tambahan] Hentikan timer saat widget dihancurkan
    _pageController.dispose(); // ✅ [Tambahan] Buang controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'McLaren Cryp',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        backgroundColor: Color(0xff0A0F2C),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff0A0F2C),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔁 Diubah: Container diubah menjadi PageView
            SizedBox(
              height: 200, // ✅ Tinggi dari PageView
              child: PageView.builder(
                controller: _pageController,
                itemCount: gambarList.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      gambarList[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20), // ✅ Jarak sebelum teks

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // ✅ Biar teks rata kiri
                children: [
                  Text(
                    "Apa itu Crypto",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '''Cryptocurrency adalah bentuk aset digital terdesentralisasi yang dirancang 
untuk berfungsi sebagai media pertukaran menggunakan kriptografi kuat untuk 
mengamankan transaksi keuangan, mengontrol penciptaan unit baru, dan 
memverifikasi transfer aset di dalam jaringan.

Crypto umumnya berjalan di atas teknologi blockchain, yaitu sebuah buku besar 
terdistribusi (distributed ledger) yang bersifat immutable (tidak dapat diubah) 
dan transparan, yang disimpan di banyak node (komputer) dalam jaringan peer-to-peer (P2P).''',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    softWrap: true,
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
