import 'package:flutter/material.dart';

class TugasLimaTes extends StatefulWidget {
  const TugasLimaTes({super.key});

  @override
  State<TugasLimaTes> createState() => _TugasLimaTesState();
}

class _TugasLimaTesState extends State<TugasLimaTes> {
  bool _liatNama = false;
  bool _suka = false;
  bool _selengkapnya = false;
  int _jumlah = 0;
  bool _isClick = false;
  bool _sentuh = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 5"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isClick = !_isClick;
                    print("kotak di sentuh");
                  });
                },

                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/pat.jpg",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),

                    //Center(child: Text("klik me")),
                    Text(_isClick ? "" : "ditekan"),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 87, 194, 190),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _liatNama = !_liatNama;
                    });
                  },

                  child: Text(_liatNama ? "sembunyikan" : "Tampilkan"),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          if (_liatNama) Text("nama saya bayu"),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _suka = !_suka;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: _suka ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          if (_selengkapnya)
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ornare ipsum at tristique luctus. Donec lacinia elit quis fringilla tristique. Duis hendrerit suscipit tortor sit amet venenatis. Vestibulum leo tellus, dignissim ut tortor vel, porta blandit sapien. Ut sodales turpis felis, eget tempus diam hendrerit ac. Fusce non euismod velit. Proin risus sem, dapibus quis tincidunt id, vehicula vitae tellus. Pellentesque metus dolor, mollis non viverra nec, consequat ut mauris. Sed suscipit turpis sit amet semper pharetra. Pellentesque laoreet lectus eget dapibus laoreet. Nulla tristique diam quam, eget rhoncus nunc suscipit vitae.",
            ),

          // if (_selengkapnya)
          //   Text(
          //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ornare ipsum at tristique luctus. Donec lacinia elit quis fringilla tristique. Duis hendrerit suscipit tortor sit amet venenatis. Vestibulum leo tellus, dignissim ut tortor vel, porta blandit sapien. Ut sodales turpis felis, eget tempus diam hendrerit ac. Fusce non euismod velit. Proin risus sem, dapibus quis tincidunt id, vehicula vitae tellus. Pellentesque metus dolor, mollis non viverra nec, consequat ut mauris. Sed suscipit turpis sit amet semper pharetra. Pellentesque laoreet lectus eget dapibus laoreet. Nulla tristique diam quam, eget rhoncus nunc suscipit vitae.",
          //   ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selengkapnya = !_selengkapnya;
                  });
                },
                child: Text(_selengkapnya ? "sembunyikan" : "selengkapnya"),
              ),
            ],
          ),
          Text('$_jumlah'),
          if (_suka) Text("Disukai"),
          // Row(
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         setState(() {
          //           _isClick = !_isClick;
          //           print("kotak di sentuh");
          //         });
          //       },

          //       child: Row(
          //         children: [
          //           Container(
          //             color: Colors.blue,
          //             width: 200,
          //             height: 200,
          //             child: Center(child: Text("klik me")),
          //           ),
          //           Text(_isClick ? "" : "akjsnbfhajsgfjaskfas"),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: 20),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _sentuh = !_sentuh;
                    print("ditekan sekali");
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    _sentuh = !_sentuh;
                    print("di tekan 2 kali");
                  });
                },
                onLongPress: () {
                  setState(() {
                    _sentuh = !_sentuh;
                    print("di tahan");
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 400,
                      height: 50,

                      child: Center(child: Text("tekan saya")),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(300)),
                        color: Colors.amberAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_jumlah >= 100) {
              _jumlah = 0;
            } else {
              _jumlah = _jumlah + 10;
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
