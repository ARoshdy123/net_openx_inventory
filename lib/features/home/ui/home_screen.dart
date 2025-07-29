import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:net_openx_inventory/features/home/data/model/customer_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/warehouse_response_model.dart';
import 'package:net_openx_inventory/features/home/logic/home_cubit.dart';
import 'package:net_openx_inventory/features/home/logic/home_state.dart';
import 'package:net_openx_inventory/features/home/ui/widgets/barcode_scanner_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _clientController = TextEditingController();
  final _warehouseController = TextEditingController();
  final _itemCodeController = TextEditingController();
  final _itemNameController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _quantityController = TextEditingController();
  final _unitController = TextEditingController();

  CustomerResponseModel? selectedCustomer;
  WarehouseResponseModel? selectedWarehouse;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().loadInitialData();
    });
  }

  @override
  void dispose() {
    _clientController.dispose();
    _warehouseController.dispose();
    _itemCodeController.dispose();
    _itemNameController.dispose();
    _barcodeController.dispose();
    _quantityController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  // Simulate barcode scanning for now
  Future<void> _simulateBarcodeScanning() async {
    // Show a dialog to input barcode for simulation
    final simulatedBarcode = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Simulate Barcode Scan'),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Enter barcode',
            hintText: 'e.g., 1234567890',
          ),
          onSubmitted: (value) => Navigator.of(context).pop(value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Return a default barcode for testing
              Navigator.of(context).pop('1234567890');
            },
            child: const Text('Use Test Barcode'),
          ),
        ],
      ),
    );

    if (simulatedBarcode != null && simulatedBarcode.isNotEmpty) {
      _handleBarcodeScanned(simulatedBarcode);
    }
  }

  // Handle real barcode scanning when ready
  Future<void> _scanBarcode() async {
    final scannedBarcode = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => BarcodeScannerPage(
          onBarcodeScanned: (barcode) {
            _handleBarcodeScanned(barcode);
          },
        ),
      ),
    );
  }

  void _handleBarcodeScanned(String barcode) {
    // Call the cubit to get barcode data
    context.read<HomeCubit>().getBarcode(barcode);
  }

  void _clearBarcodeData() {
    setState(() {
      _itemCodeController.clear();
      _itemNameController.clear();
      _barcodeController.clear();
      _quantityController.clear();
      _unitController.clear();
    });
    context.read<HomeCubit>().clearBarcodeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                context.read<HomeCubit>().loadInitialData();
              },
            ),
          ],
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
      // Handle errors
      if (state.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error!),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Dismiss',
              textColor: Colors.white,
              onPressed: () {
                context.read<HomeCubit>().clearError();
              },
            ),
          ),
        );
      }

      // Update fields when barcode data is loaded
      if (state.barcodeData != null) {
        _itemCodeController.text = state.barcodeData!.itemCode;
        _itemNameController.text = state.barcodeData!.itemName;
        _barcodeController.text = state.barcodeData!.barcode;
        _quantityController.text = state.barcodeData!.balanceQuantity.toString();
        _unitController.text = state.barcodeData!.unit;
      }
    },
    builder: (context, state) {
    final isInitialLoading = (state.isLoadingCustomers || state.isLoadingWarehouses) &&
    state.customers.isEmpty &&
    state.warehouses.isEmpty;

    if (isInitialLoading) {
    return const Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    CircularProgressIndicator(),
    SizedBox(height: 16),
    Text('Loading data...'),
    ],
    ),
    );
    }

    return RefreshIndicator(
    onRefresh: () => context.read<HomeCubit>().loadInitialData(),
    child: SingleChildScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
    child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Client Dropdown
    Row(
    children: [
    Text(
    'Select Client',
    style: Theme.of(context).textTheme.titleMedium,
    ),
    if (state.isLoadingCustomers) ...[
    const SizedBox(width: 8),
    const SizedBox(
    width: 16,
    height: 16,
    child: CircularProgressIndicator(strokeWidth: 2),
    ),
    ],
    ],
    ),
    const SizedBox(height: 8),
    DropDownSearchField<CustomerResponseModel>(
    displayAllSuggestionWhenTap: true,
    isMultiSelectDropdown: false,
    textFieldConfiguration: TextFieldConfiguration(
    controller: _clientController,
    enabled: !state.isLoadingCustomers,
    decoration: InputDecoration(
    labelText: 'Client',
    hintText: state.customers.isEmpty
    ? 'No clients available'
        : 'Search for a client...',
    border: const OutlineInputBorder(),
    prefixIcon: const Icon(Icons.person_outline),
    suffixIcon: selectedCustomer != null
    ? IconButton(
    icon: const Icon(Icons.clear),
    onPressed: () {
    setState(() {
    selectedCustomer = null;
    _clientController.clear();
    });
    },
    )
        : null,
    ),
    ),
    suggestionsCallback: (pattern) async {
    if (pattern.isEmpty) {
    return state.customers;
    }
    return state.customers
        .where((c) => c.clientName
        .toLowerCase()
        .contains(pattern.toLowerCase()))
        .toList();
    },
    itemBuilder: (context, CustomerResponseModel suggestion) {
    return ListTile(
    leading: const Icon(Icons.person),
    title: Text(suggestion.clientName),
    subtitle: suggestion.group != null
    ? Text('Group: ${suggestion.group}')
        : null,
    );
    },
    onSuggestionSelected: (CustomerResponseModel selection) {
    setState(() {
    selectedCustomer = selection;
    _clientController.text = selection.clientName;
    });
    },
    noItemsFoundBuilder: (context) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
    state.customers.isEmpty
    ? 'No clients loaded'
        : 'No clients found matching your search',
    style: const TextStyle(color: Colors.grey),
    ),
    ),
    ),

    const SizedBox(height: 24),

    // Warehouse Dropdown
    Row(
    children: [
    Text(
    'Select Warehouse',
    style: Theme.of(context).textTheme.titleMedium,
    ),
    if (state.isLoadingWarehouses) ...[
    const SizedBox(width: 8),
    const SizedBox(
    width: 16,
    height: 16,
    child: CircularProgressIndicator(strokeWidth: 2),
    ),
    ],
    ],
    ),
    const SizedBox(height: 8),
    DropDownSearchField<WarehouseResponseModel>(
    displayAllSuggestionWhenTap: true,
    isMultiSelectDropdown: false,
    textFieldConfiguration: TextFieldConfiguration(
    controller: _warehouseController,
    enabled: !state.isLoadingWarehouses,
    decoration: InputDecoration(
    labelText: 'Warehouse',
    hintText: state.warehouses.isEmpty
    ? 'No warehouses available'
        : 'Search for a warehouse...',
    border: const OutlineInputBorder(),
    prefixIcon: const Icon(Icons.warehouse_outlined),
    suffixIcon: selectedWarehouse != null
    ? IconButton(
    icon: const Icon(Icons.clear),
    onPressed: () {
    setState(() {
    selectedWarehouse = null;
    _warehouseController.clear();
    });
    },
    )
        : null,
    ),
    ),
    suggestionsCallback: (pattern) async {
    if (pattern.isEmpty) {
    return state.warehouses;
    }
    return state.warehouses
        .where((w) => w.warehouse
        .toLowerCase()
        .contains(pattern.toLowerCase()))
        .toList();
    },
    itemBuilder: (context, WarehouseResponseModel suggestion) {
    return ListTile(
    leading: const Icon(Icons.warehouse),
    title: Text(suggestion.warehouse),
    subtitle: suggestion.group != null
    ? Text('Group: ${suggestion.group}')
        : null,
    );
    },
    onSuggestionSelected: (WarehouseResponseModel selection) {
    setState(() {
    selectedWarehouse = selection;
    _warehouseController.text = selection.warehouse;
    });
    },
    noItemsFoundBuilder: (context) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
    state.warehouses.isEmpty
    ? 'No warehouses loaded'
        : 'No warehouses found matching your search',
    style: const TextStyle(color: Colors.grey),
    ),
    ),
    ),

    const SizedBox(height: 32),

    // Barcode Scanner Section
    Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
    color: Colors.blue.shade50,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Colors.blue.shade200),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Icon(Icons.qr_code_scanner, color: Colors.blue.shade700),
    const SizedBox(width: 8),
    Text(
    'Barcode Scanner',
    style: Theme.of(context).textTheme.titleMedium?.copyWith(
    color: Colors.blue.shade700,
    fontWeight: FontWeight.bold,
    ),
    ),
    const Spacer(),
    if (state.isLoadingBarcode)
    const SizedBox(
    width: 20,
    height: 20,
    child: CircularProgressIndicator(strokeWidth: 2),
    ),
    ],
    ),
    const SizedBox(height: 16),
    Row(
    children: [
    Expanded(
    child: ElevatedButton.icon(
    onPressed: state.isLoadingBarcode ? null : _simulateBarcodeScanning,
    icon: const Icon(Icons.qr_code),
    label: const Text('Simulate Scan'),
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 12),
    ),
    ),
    ),
    const SizedBox(width: 8),
    Expanded(
    child: ElevatedButton.icon(
    onPressed: state.isLoadingBarcode ? null : _scanBarcode,
    icon: const Icon(Icons.camera_alt),
    label: const Text('Scan Barcode'),
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 12),
    ),
    ),
    ),
    ],
    ),
    if (state.barcodeData != null) ...[
    const SizedBox(height: 16),
    ElevatedButton.icon(
    onPressed: _clearBarcodeData,
    icon: const Icon(Icons.clear),
    label: const Text('Clear Barcode Data'),
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    ),
    ),
    ],
    ],
    ),
    ),

    // Display barcode data if available
    if (state.barcodeData != null) ...[
    const SizedBox(height: 24),
    Text(
    'Item Information',
    style: Theme.of(context).textTheme.titleMedium?.copyWith(
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(height: 16),

    // Item Code (Read-only)
    TextFormField(
    controller: _itemCodeController,
    readOnly: true,
    decoration: const InputDecoration(
    labelText: 'Item Code',
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Colors.grey,
    prefixIcon: Icon(Icons.code),
    ),
    ),
    const SizedBox(height: 16),

    // Item Name (Read-only)
    TextFormField(
    controller: _itemNameController,
    readOnly: true,
    decoration: const InputDecoration(
    labelText: 'Item Name',
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Colors.grey,
    prefixIcon: Icon(Icons.inventory),
    ),
    ),
    const SizedBox(height: 16),

      // Additional Info Row
      Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _barcodeController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Barcode',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey,
                prefixIcon: Icon(Icons.barcode_reader),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: _unitController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Unit',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey,
                prefixIcon: Icon(Icons.straighten),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),

      // Quantity (Read-only)
      TextFormField(
        controller: _quantityController,
        readOnly: true,
        decoration: const InputDecoration(
          labelText: 'Balance Quantity',
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey,
          prefixIcon: Icon(Icons.inventory_2),
        ),
      ),

      const SizedBox(height: 24),

      // Additional barcode info
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.green.shade700),
                const SizedBox(width: 8),
                Text(
                  'Additional Information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Warehouse Code: ${state.barcodeData!.depoKod}'),
            Text('Serial Quantity: ${state.barcodeData!.serialQty}'),
          ],
        ),
      ),
    ],

      const SizedBox(height: 32),

      // Summary Section
      if (selectedCustomer != null || selectedWarehouse != null || state.barcodeData != null)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Summary',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              if (selectedCustomer != null) ...[
                Row(
                  children: [
                    const Icon(Icons.person, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Client: ${selectedCustomer!.clientName}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
              ],
              if (selectedWarehouse != null) ...[
                Row(
                  children: [
                    const Icon(Icons.warehouse, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Warehouse: ${selectedWarehouse!.warehouse}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
              ],
              if (state.barcodeData != null) ...[
                Row(
                  children: [
                    const Icon(Icons.inventory, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Item: ${state.barcodeData!.itemName}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.qr_code, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Barcode: ${state.barcodeData!.barcode}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),

      const SizedBox(height: 24),

      // Action Button
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: (selectedCustomer != null &&
              selectedWarehouse != null &&
              state.barcodeData != null)
              ? () {
            // Handle form submission
            _submitInventoryData();
          }
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.green,
            disabledBackgroundColor: Colors.grey.shade300,
          ),
          child: Text(
            'Submit Inventory',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: (selectedCustomer != null &&
                  selectedWarehouse != null &&
                  state.barcodeData != null)
                  ? Colors.white
                  : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    ],
    ),
    ),
    ),
    );
    },
        ),
    );
  }

  void _submitInventoryData() {
    // Implement your submission logic here
    final data = {
      'customerId': selectedCustomer!.value,
      'warehouseId': selectedWarehouse!.value,
      'itemCode': _itemCodeController.text,
      'itemName': _itemNameController.text,
      'barcode': _barcodeController.text,
      'quantity': _quantityController.text,
      'unit': _unitController.text,
    };

    print('Submitting inventory data: $data');

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Inventory data submitted successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Clear the form after submission if needed
    // _clearForm();
  }

  void _clearForm() {
    setState(() {
      selectedCustomer = null;
      selectedWarehouse = null;
      _clientController.clear();
      _warehouseController.clear();
    });
    _clearBarcodeData();
  }
}
