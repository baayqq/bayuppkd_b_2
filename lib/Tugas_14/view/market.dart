import 'package:bayuppkd_b_2/Tugas_14/api/getuser.dart';
import 'package:bayuppkd_b_2/Tugas_14/view/list_deatail.dart';
import 'package:flutter/material.dart';
import 'package:bayuppkd_b_2/Tugas_14/model/usermodel.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Future<List<DataApi>>? _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchUsers();
  }

  void referes() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
      _futureData = fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 36,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.white70),
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Cari Crypto',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIconColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toLowerCase();
                    });
                  },
                ),
              ),
              IconButton(
                onPressed: referes,

                icon: Icon(Icons.refresh, color: Colors.white70),
              ),
            ],
          ),
        ),
        elevation: 4,
        backgroundColor: Color(0xff0A0F2C),
      ),
      backgroundColor: Color(0xff0A0F2C),
      body: Column(
        children: [
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

                // return RefreshIndicator(
                //   onRefresh: () async {
                //     setState(() {
                //       _futureData = fetchUsers();
                //     });
                //   },
                return ListView.builder(
                  itemCount: filteredUsers.length,
                  itemBuilder: (context, index) {
                    final coin = filteredUsers[index];
                    return Card(
                      color: Color(0xff0A0F2C),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'USD ${coin.currentPrice?.toStringAsFixed(2) ?? '-'}',
                              style: TextStyle(color: Colors.green[700]),
                            ),
                            Text(
                              'USD -${coin.low24H?.toStringAsFixed(2) ?? '-'}',
                              style: TextStyle(color: Colors.red[700]),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
