import 'package:bayuppkd_b_2/Tugas_14/api/getuser.dart';
import 'package:bayuppkd_b_2/Tugas_14/view/list_deatail.dart';
import 'package:flutter/material.dart';
import 'package:bayuppkd_b_2/Tugas_14/model/usermodel.dart';

class ScreenApp extends StatefulWidget {
  const ScreenApp({super.key});

  @override
  State<ScreenApp> createState() => _ScreenAppState();
}

class _ScreenAppState extends State<ScreenApp> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Future<List<DataApi>>? _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto List"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Cari Crypto',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<DataApi>>(
              future: _futureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Tidak ada data.'));
                }

                // 🔍 Filter data berdasarkan pencarian
                final filteredUsers =
                    snapshot.data!
                        .where(
                          (coin) =>
                              coin.name!.toLowerCase().contains(_searchQuery) ||
                              coin.symbol!.toLowerCase().contains(_searchQuery),
                        )
                        .toList();

                if (filteredUsers.isEmpty) {
                  return Center(child: Text('Crypto tidak ditemukan.'));
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      _futureData = fetchUsers();
                    });
                  },
                  child: ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final coin = filteredUsers[index];
                      return Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailCryp(coin: coin),
                              ),
                            );
                          },
                          leading:
                              coin.image != null
                                  ? Image.network(
                                    coin.image!,
                                    width: 40,
                                    height: 40,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Icon(Icons.error),
                                  )
                                  : Icon(Icons.image_not_supported),
                          title: Text(
                            coin.name ?? 'Nama tidak tersedia',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'USD ${coin.currentPrice?.toStringAsFixed(2) ?? '-'}',
                            style: TextStyle(color: Colors.green[700]),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
