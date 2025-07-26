import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}


// Future<void> _scanBarcode() async {
//   final scannedBarcode = await Navigator.of(context).push<String>(
//     MaterialPageRoute(builder: (_) => const BarcodeScannerPage()),
//   );
//   if (scannedBarcode != null && scannedBarcode.isNotEmpty) {
//     setState(() {
//       _itemCodeController.text = scannedBarcode;
//
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('تمت إضافة الباركود: $scannedBarcode')),
//     );
//     if(_formKey.currentState != null && _formKey.currentState!.validate()){
//       _addOrUpdateProduct();
//     }
//   }
// }