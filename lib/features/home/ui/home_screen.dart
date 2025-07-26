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