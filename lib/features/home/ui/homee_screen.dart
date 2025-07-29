import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net_openx_inventory/features/home/logic/home_cubit.dart';
import 'package:net_openx_inventory/features/home/logic/home_state.dart';
import 'package:net_openx_inventory/features/home/ui/widgets/barcode_scanner_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _itemCodeController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();

  void _onScan() {
    showModalBottomSheet(
      context: context,
      builder: (context) => BarcodeScannerPage(
        onBarcodeScanned: (barcode) {
          context.read<HomeCubit>().getBarcode(barcode);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is BarcodeLoaded) {
            _itemCodeController.text = state.data.itemCode;
            _itemNameController.text = state.data.itemName;
          } else if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _itemCodeController,
                decoration: const InputDecoration(labelText: 'Item Code'),
              ),
              TextField(
                controller: _itemNameController,
                decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onScan,
                child: const Text('Scan Barcode'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}