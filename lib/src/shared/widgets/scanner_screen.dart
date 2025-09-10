// lib/src/shared/widgets/scanner_screen.dart

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aponte para o Código de Barras')),
      body: MobileScanner(
        // controller: MobileScannerController(..), // Opções avançadas aqui
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final String code =
                barcodes.first.rawValue ?? 'Código não encontrado';
            debugPrint('Código de barras encontrado! $code');
            // Retorna o código para a tela anterior e fecha a câmera
            Navigator.pop(context, code);
          }
        },
      ),
    );
  }
}
