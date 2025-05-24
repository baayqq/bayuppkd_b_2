import 'package:flutter/material.dart';

class TugasLima extends StatefulWidget {
  const TugasLima({super.key});

  @override
  _TugasLimaState createState() => _TugasLimaState();
}

class _TugasLimaState extends State<TugasLima> {
  String _nameText = '';
  bool _isFavorited = false;
  String _descriptionText = '';
  int _counter = 0;
  bool _showInkWellText = false;

  void _showName() {
    setState(() {
      _nameText = 'Nama saya: Bayu'; // Ganti dengan nama Anda
    });
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  void _showDescription() {
    setState(() {
      _descriptionText =
          't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using  making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for  will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose.';
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleInkWellText() {
    print('Kotak disentuh');
    setState(() {
      _showInkWellText = !_showInkWellText;
    });
  }

  void _handleGesture(String gesture) {
    print(gesture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 5'),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ElevatedButton
              ElevatedButton(
                onPressed: _showName,
                child: const Text('Tampilkan Nama'),
              ),
              const SizedBox(height: 8),
              Text(_nameText),

              //const Divider(),

              // IconButton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: _isFavorited ? Colors.red : Colors.grey,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                  if (_isFavorited) const Text('Disukai'),
                ],
              ),

              //const Divider(),

              // TextButton
              TextButton(
                onPressed: _showDescription,
                child: const Text('Lihat Selengkapnya'),
              ),
              Text(_descriptionText),

              //const Divider(),

              // InkWell
              InkWell(
                onTap: _toggleInkWellText,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.blueAccent,
                  child: const Text(
                    'Klik kotak ini',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              if (_showInkWellText)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('di tekan'),
                ),

              //const Divider(),

              // GestureDetector
              GestureDetector(
                onTap: () => _handleGesture('Ditekan sekali'),
                onDoubleTap: () => _handleGesture('Ditekan dua kali'),
                onLongPress: () => _handleGesture('Tahan lama'),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Tekan Aku',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //const Divider(),

              // Counter Display
              Text('jumlah: $_counter'),
            ],
          ),
        ),
      ),
    );
  }
}
