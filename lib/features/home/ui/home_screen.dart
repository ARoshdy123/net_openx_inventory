import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:net_openx_inventory/core/helpers/shared_pref_helper.dart';
import 'package:net_openx_inventory/features/home/data/model/customer_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/sales_request_model.dart';
import 'package:net_openx_inventory/features/home/data/model/warehouse_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/barcode_response_model.dart';
import 'package:net_openx_inventory/features/home/logic/home_cubit.dart';
import 'package:net_openx_inventory/features/home/logic/home_state.dart';
import 'package:net_openx_inventory/features/home/ui/widgets/barcode_scanner_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Create a model for table items
class InventoryTableItem {
  final String itemCode;
  final String itemName;
  final double balanceQuantity;
  final String warehouse;
  final String serialNumber;
  final double serialQuantity;
  final String unit;

  InventoryTableItem({
    required this.itemCode,
    required this.itemName,
    required this.balanceQuantity,
    required this.warehouse,
    required this.serialNumber,
    required this.serialQuantity,
    required this.unit,
  });
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

  // List to store scanned items
  List<InventoryTableItem> scannedItems = [];

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
    if (selectedWarehouse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a warehouse first'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

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
    if (selectedWarehouse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a warehouse first'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

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
    context.read<HomeCubit>().getBarcode(barcode);
  }

  void _addItemToTable(BarcodeResponseModel barcodeData) {
    setState(() {
      scannedItems.add(
        InventoryTableItem(
          itemCode: barcodeData.itemCode,
          itemName: barcodeData.itemName,
          balanceQuantity: barcodeData.balanceQuantity,
          warehouse: selectedWarehouse!.warehouse,
          serialNumber: barcodeData.barcode,
          serialQuantity: barcodeData.serialQty,
          unit: barcodeData.unit,
        ),
      );
    });

    // Clear the barcode data after adding to table
    context.read<HomeCubit>().clearBarcodeData();
    _clearBarcodeFields();
  }

  void _removeItemFromTable(int index) {
    setState(() {
      scannedItems.removeAt(index);
    });
  }

  void _clearBarcodeFields() {
    _itemCodeController.clear();
    _itemNameController.clear();
    _barcodeController.clear();
    _quantityController.clear();
    _unitController.clear();
  }

  void _clearBarcodeData() {
    setState(() {
      _clearBarcodeFields();
    });
    context.read<HomeCubit>().clearBarcodeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
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

          // When barcode data is loaded, add it to the table
          if (state.barcodeData != null) {
            _itemCodeController.text = state.barcodeData!.itemCode;
            _itemNameController.text = state.barcodeData!.itemName;
            _barcodeController.text = state.barcodeData!.barcode;
            _quantityController.text = state.barcodeData!.balanceQuantity.toString();
            _unitController.text = state.barcodeData!.unit;

            // Automatically add to table
            _addItemToTable(state.barcodeData!);
          }

          // Handle successful sales submission - UPDATED SECTION
          if (state.salesResponse != null) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                icon: const Icon(Icons.check_circle, color: Colors.green, size: 64),
                title: const Text('Success!'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Sales data submitted successfully!'),
                    const SizedBox(height: 16),
                    Text(
                      '${scannedItems.length} items submitted',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    // Display the evrakNo (document number)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.receipt, color: Colors.green.shade700, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Document No:',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Text(
                                  state.salesResponse!.evrakNo,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade700,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Add copy button for document number
                          IconButton(
                            icon: Icon(Icons.copy, size: 18, color: Colors.green.shade700),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: state.salesResponse!.evrakNo));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Document number copied to clipboard'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    // Display message if available
                    if (state.salesResponse!.message != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        state.salesResponse!.message!,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<HomeCubit>().clearSalesResponse();
                      // Clear the form after successful submission
                      _clearForm();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
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
                    // Selection Card
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Client Dropdown
                            Row(
                              children: [
                                Icon(Icons.store, color: Colors.blue.shade700),
                                const SizedBox(width: 8),
                                Text(
                                  'Transaction Details',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.blue.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

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

                            const SizedBox(height: 16),

                            // Warehouse Dropdown
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
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Barcode Scanner Section
                    Card(
                      elevation: 4,
                      color: Colors.blue.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.qr_code_scanner, color: Colors.blue.shade700, size: 28),
                                const SizedBox(width: 8),
                                Text(
                                  'Barcode Scanner',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Inventory Table Section
                    if (scannedItems.isNotEmpty) ...[
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.inventory_2, color: Colors.green.shade700, size: 28),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Scanned Items',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade100,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      '${scannedItems.length} items',
                                      style: TextStyle(
                                        color: Colors.green.shade700,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Scrollable table
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
                                    columnSpacing: 20,
                                    columns: const [
                                      DataColumn(
                                        label: Text(
                                          'Item Code',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Item Name',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Balance Qty',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        numeric: true,
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Warehouse',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Serial Number',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Serial Qty',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        numeric: true,
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Action',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                    rows: scannedItems.asMap().entries.map((entry) {
                                      final index = entry.key;
                                      final item = entry.value;
                                      return DataRow(
                                        cells: [
                                          DataCell(Text(item.itemCode)),
                                          DataCell(
                                            Container(
                                              constraints: const BoxConstraints(maxWidth: 150),
                                              child: Text(
                                                item.itemName,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              '${item.balanceQuantity} ${item.unit}',
                                              style: TextStyle(
                                                color: item.balanceQuantity > 0
                                                    ? Colors.green.shade700
                                                    : Colors.red.shade700,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          DataCell(Text(item.warehouse)),
                                          DataCell(
                                            Container(
                                              constraints: const BoxConstraints(maxWidth: 120),
                                              child: Text(
                                                item.serialNumber,
                                                style: const TextStyle(
                                                  fontFamily: 'monospace',
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(Text(item.serialQuantity.toString())),
                                          DataCell(
                                            IconButton(
                                              icon: const Icon(Icons.delete, color: Colors.red),
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => AlertDialog(
                                                    title: const Text('Delete Item'),
                                                    content: Text(
                                                      'Are you sure you want to remove "${item.itemName}" from the list?',
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () => Navigator.pop(context),
                                                        child: const Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          _removeItemFromTable(index);
                                                          Navigator.pop(context);
                                                        },
                                                        style: TextButton.styleFrom(
                                                          foregroundColor: Colors.red,
                                                        ),
                                                        child: const Text('Delete'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Summary Row
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Items: ${scannedItems.length}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Total Quantity: ${scannedItems.fold<double>(0, (sum, item) => sum + item.serialQuantity).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ] else ...[
                      // Empty state
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.qr_code_scanner,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No items scanned yet',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Start scanning barcodes to add items',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: scannedItems.isNotEmpty
                                ? () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Clear All Items'),
                                  content: const Text(
                                    'Are you sure you want to clear all scanned items?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          scannedItems.clear();
                                        });
                                        Navigator.pop(context);
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.red,
                                      ),
                                      child: const Text('Clear All'),
                                    ),
                                  ],
                                ),
                              );
                            }
                                : null,
                            icon: const Icon(Icons.clear_all),
                            label: const Text('Clear All'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton.icon(
                            onPressed: (selectedCustomer != null &&
                                selectedWarehouse != null &&
                                scannedItems.isNotEmpty &&
                                !state.isLoadingSales) // Disable when loading
                                ? () {
                              _submitInventoryData();
                            }
                                : null,
                            icon: state.isLoadingSales
                                ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                                : const Icon(Icons.check_circle),
                            label: Text(state.isLoadingSales ? 'Submitting...' : 'Submit Inventory'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  void _submitInventoryData() async {
    try {
      // Get the user token from secure storage
      final userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
      debugPrint('the sent token roshdy: $userToken');

      if (userToken.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Authentication token not found. Please login again.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Create detail lines from scanned items
      final List<DetailLine> detailLines = scannedItems.map((item) {
        return DetailLine(
          stokKodu: item.itemCode,
          sTraGcmik: 0, // Always 0 as specified
          sTraBf: 0, // Always 0 as specified
          depoKodu: int.parse(selectedWarehouse!.value), // warehouse value
          toDepoKodu: int.parse(selectedWarehouse!.value), // warehouse value
          seriNo: item.serialNumber,
          serialQty: item.serialQuantity, // Keep as double to match API
        );
      }).toList();

      // Create the sales request model with token
      final salesRequest = SalesRequestModel(
        cariKod: selectedCustomer!.value.toString(), // Customer code
        tarih: DateTime.now().toIso8601String(), // Current date/time
        detailLines: detailLines,

        token: userToken, // Add the user token
      );
      debugPrint('the sent token roshdy: $userToken');

      // Submit through Cubit - success/error handling is done in BlocConsumer listener
      context.read<HomeCubit>().createSales(salesRequest);

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error preparing data: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _clearForm() {
    setState(() {
      selectedCustomer = null;
      selectedWarehouse = null;
      _clientController.clear();
      _warehouseController.clear();
      scannedItems.clear();
    });
    _clearBarcodeData();
  }
}