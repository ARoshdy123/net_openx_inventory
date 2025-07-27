import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:net_openx_inventory/features/home/data/model/customer_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/warehouse_response_model.dart';
import 'package:net_openx_inventory/features/home/logic/home_cubit.dart';
import 'package:net_openx_inventory/features/home/logic/home_state.dart';
import 'package:net_openx_inventory/features/home/ui/widgets/date.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _clientController = TextEditingController();
  final _warehouseController = TextEditingController();

  CustomerResponseModel? _selectedCustomer;
  WarehouseResponseModel? _selectedWarehouse;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<HomeCubit>();
    cubit.getCustomers();
    cubit.getWarehouses();
  }

  @override
  void dispose() {
    _clientController.dispose();
    _warehouseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          List<CustomerResponseModel> customers = [];
          List<WarehouseResponseModel> warehouses = [];
          bool isLoading = false;
          String? errorMsg;

          state.when(
            initial: () {},
            loading: () {
              isLoading = true;
            },
            customerLoaded: (data) => data,
            warehouseLoaded: (data) => data,
            barcodeLoaded: (data) => data,
            error: (msg) {
              errorMsg = msg;
            },
          );

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (errorMsg != null) {
            return Center(
              child: Text(errorMsg!, style: const TextStyle(color: Colors.red)),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Client Dropdown
                DropDownSearchField<CustomerResponseModel>(
                  displayAllSuggestionWhenTap: true,
                  isMultiSelectDropdown: false,
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _clientController,
                    decoration: const InputDecoration(
                      labelText: 'Client',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    return customers
                        .where(
                          (c) => c.clientName.toLowerCase().contains(
                            pattern.toLowerCase(),
                          ),
                        )
                        .toList();
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(title: Text(suggestion.clientName));
                  },
                  onSuggestionSelected: (selection) {
                    _selectedCustomer = selection;
                    _clientController.text = selection.clientName;
                  },
                  noItemsFoundBuilder:
                      (context) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No clients found'),
                      ),
                ),

                const SizedBox(height: 16),

                // Warehouse Dropdown
                DropDownSearchField<WarehouseResponseModel>(
                  displayAllSuggestionWhenTap: true,
                  isMultiSelectDropdown: false,
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _warehouseController,
                    decoration: const InputDecoration(
                      labelText: 'Warehouse',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    return warehouses
                        .where(
                          (w) => w.warehouse.toLowerCase().contains(
                            pattern.toLowerCase(),
                          ),
                        )
                        .toList();
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(title: Text(suggestion.warehouse));
                  },
                  onSuggestionSelected: (selection) {
                    _selectedWarehouse = selection;
                    _warehouseController.text = selection.warehouse;
                  },
                  noItemsFoundBuilder:
                      (context) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No warehouses found'),
                      ),
                ),
                const SizedBox(height: 8),
                Fields(platform: DateTimeFieldPickerPlatform.material),
              ],
            ),
          );
        },
      ),
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



/*import 'package:flutter/material.dart';
import 'package:net_openx_inventory/features/home/ui/widgets/barcode_scanner_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _itemCodeController = TextEditingController();

  @override
  void dispose() {
    _itemCodeController.dispose();
    super.dispose();
  }

  Future<void> _scanBarcode() async {
    final scannedBarcode = await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const BarcodeScannerPage()),
    );
    if (scannedBarcode != null && scannedBarcode.toString().isNotEmpty) {
      setState(() {
        _itemCodeController.text = scannedBarcode.toString();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تمت إضافة الباركود: $scannedBarcode')),
      );
    }
  }

  void _search() {
    // Implement your search logic here using _itemCodeController.text
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('بحث عن: ${_itemCodeController.text}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _itemCodeController,
                decoration: const InputDecoration(
                  labelText: 'كود الصنف أو الباركود',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: _search,
                  icon: const Icon(Icons.search),
                  label: const Text('بحث'),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: _scanBarcode,
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('مسح'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} */