import 'package:bayuppkd_b_2/Tugas_9/kelasmodel.dart';
import 'package:bayuppkd_b_2/constant/app_image.dart';
import 'package:flutter/material.dart';

class TugasSembilanC extends StatefulWidget {
  const TugasSembilanC({super.key});

  @override
  State<TugasSembilanC> createState() => _TugasSembilanCState();
}

class _TugasSembilanCState extends State<TugasSembilanC> {
  final List<PakaianWanita> dataProduct = [
    PakaianWanita(
      id: "1",
      productName: "Yellow Dress",
      productPrice: "80.000",
      productImage: AppImage.baju1,
    ),
    PakaianWanita(
      id: "2",
      productName: "Pink Dress",
      productPrice: "95.000",
      productImage: AppImage.baju2,
    ),
    PakaianWanita(
      id: "3",
      productName: "Green Dress",
      productPrice: "150.000",
      productImage: AppImage.baju3,
    ),
    PakaianWanita(
      id: "4",
      productName: "Navy Dress",
      productPrice: "70.000",
      productImage: AppImage.baju4,
    ),
    PakaianWanita(
      id: "5",
      productName: "White Dress",
      productPrice: "85.000",
      productImage: AppImage.baju5,
    ),
    PakaianWanita(
      id: "6",
      productName: "Grey Dress",
      productPrice: "85.000",
      productImage: AppImage.baju6,
    ),
    PakaianWanita(
      id: "7",
      productName: "Army Dress",
      productPrice: "80.000",
      productImage: AppImage.baju7,
    ),
    PakaianWanita(
      id: "8",
      productName: "Melon Dress",
      productPrice: "90.000",
      productImage: AppImage.baju8,
    ),
    PakaianWanita(
      id: "9",
      productName: "Grape Dress",
      productPrice: "85.000",
      productImage: AppImage.baju9,
    ),
    PakaianWanita(
      id: "10",
      productName: "Blue Dress",
      productPrice: "80.000",
      productImage: AppImage.baju10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tugas 9c",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff031716),
      ),
      body: ListView.builder(
        itemCount: dataProduct.length,
        itemBuilder: (BuildContext context, int index) {
          final product = dataProduct[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(product.productImage!),
            ),
            title: Text("${product.productName}"),
            subtitle: Text("Rp. ${product.productPrice}"),
          );
        },
      ),
    );
  }
}
