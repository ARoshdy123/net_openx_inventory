

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerPage extends StatelessWidget {
  final Function(String) onBarcodeScanned;

  const BarcodeScannerPage({super.key, required this.onBarcodeScanned});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: MobileScanner(
        onDetect: (barcode) {
            Navigator.pop(context);
          }

      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class BarcodeScannerPage extends StatefulWidget {
//   const BarcodeScannerPage({super.key});
//
//   @override
//   State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
// }
//
// class _BarcodeScannerPageState extends State<BarcodeScannerPage>
//     with WidgetsBindingObserver {
//   late final MobileScannerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = MobileScannerController(
//       detectionSpeed: DetectionSpeed.noDuplicates,
//       facing: CameraFacing.back,
//       torchEnabled: false,
//     );
//     WidgetsBinding.instance.addObserver(this);
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused) {
//       _controller.stop();
//     } else if (state == AppLifecycleState.resumed) {
//       _controller.start();
//     }
//   }
//
//   void _onDetect(BarcodeCapture capture) {
//     final barcode = capture.barcodes.firstOrNull;
//     if (barcode != null && barcode.rawValue != null) {
//       _controller.stop();
//       Navigator.pop(context, barcode.rawValue!);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scan Barcode'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.flash_on),
//             onPressed: () => _controller.toggleTorch(),
//           ),
//         ],
//       ),
//       body: MobileScanner(
//         controller: _controller,
//         onDetect: _onDetect,
//         errorBuilder: (context, error, child) {
//           return Center(
//             child: Text(
//               'Camera error: $error',
//               style: const TextStyle(color: Colors.red),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
// /*
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:net_openx_inventory/features/home/logic/home_cubit.dart';
// import 'package:net_openx_inventory/features/home/logic/home_state.dart';
//
// class BarcodeScannerPage extends StatefulWidget {
//   const BarcodeScannerPage({super.key});
//
//   @override
//   State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
// }
//
// class _BarcodeScannerPageState extends State<BarcodeScannerPage>
//     with WidgetsBindingObserver {
//   late final MobileScannerController _controller;
//   bool _isProcessing = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = MobileScannerController(
//       detectionSpeed: DetectionSpeed.noDuplicates,
//       facing: CameraFacing.back,
//       torchEnabled: false,
//     );
//     WidgetsBinding.instance.addObserver(this);
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused) {
//       _controller.stop();
//     } else if (state == AppLifecycleState.resumed) {
//       _controller.start();
//     }
//   }
//
//   void _onDetect(BarcodeCapture capture) {
//     final barcode = capture.barcodes.firstOrNull;
//     if (barcode != null && barcode.rawValue != null && !_isProcessing) {
//       setState(() => _isProcessing = true);
//       _controller.stop();
//       // Call the cubit to process the barcode
//       context.read<HomeCubit>().getBarcode(barcode.rawValue!);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<HomeCubit, HomeState>(
//       listener: (context, state) {
//         if (state is BarcodeLoaded) {
//           // Success: pop with data or handle as needed
//           Navigator.pop(context, state.data);
//         } else if (state is Error) {
//           // Show error and allow retry
//           setState(() => _isProcessing = false);
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message)),
//           );
//           _controller.start();
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Scan Barcode'),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.flash_on),
//               onPressed: () => _controller.toggleTorch(),
//             ),
//           ],
//         ),
//         body: Stack(
//           children: [
//             MobileScanner(
//               controller: _controller,
//               onDetect: _onDetect,
//               errorBuilder: (context, error, child) {
//                 return Center(
//                   child: Text(
//                     'Camera error: $error',
//                     style: const TextStyle(color: Colors.red),
//                   ),
//                 );
//               },
//             ),
//             BlocBuilder<HomeCubit, HomeState>(
//               builder: (context, state) {
//                 if (state is Loading) {
//                   return Container(
//                     color: Colors.black45,
//                     child: const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// } */