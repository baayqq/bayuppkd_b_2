import 'package:bayuppkd_b_2/Tugas_14/model/usermodel.dart';
import 'package:flutter/material.dart';

class DetailCryp extends StatelessWidget {
  final DataApi coin;

  const DetailCryp({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coin.name ?? 'Detail Coin')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                coin.image != null
                    ? Image.network(coin.image!, width: 50, height: 50)
                    : Icon(Icons.image_not_supported),
                SizedBox(width: 10),
                Text(
                  '${coin.name} (${coin.symbol?.toUpperCase() ?? ''})',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Harga Saat Ini: \$${coin.currentPrice?.toStringAsFixed(2) ?? '-'}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Market Cap Rank: ${coin.marketCapRank ?? '-'}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Perubahan Harga 24H: ${coin.priceChangePercentage24H?.toStringAsFixed(2) ?? '-'}%',
              style: TextStyle(
                fontSize: 16,
                color: (coin.priceChangePercentage24H ?? 0) >= 0
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Update Terakhir: ${coin.lastUpdated?.toLocal().toString() ?? '-'}',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
