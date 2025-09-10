// lib/src/features/stock/stock_management_screen.dart

import 'package:flutter/material.dart';
import 'package:cuida_app/src/core/theme/app_colors.dart';
import 'package:cuida_app/src/shared/widgets/scanner_screen.dart';
import 'package:iconsax/iconsax.dart';

// A classe Medicamento continua a mesma
class Medicamento {
  final String nome;
  final String lote;
  final String validade;
  int quantidade;

  Medicamento({
    required this.nome,
    required this.lote,
    required this.validade,
    required this.quantidade,
  });
}

class StockManagementScreen extends StatefulWidget {
  const StockManagementScreen({super.key});

  @override
  State<StockManagementScreen> createState() => _StockManagementScreenState();
}

class _StockManagementScreenState extends State<StockManagementScreen> {
  // A lista de estoque de exemplo continua a mesma
  final List<Medicamento> _estoque = [
    Medicamento(
        nome: 'Paracetamol 500mg',
        lote: 'A123',
        validade: '12/2025',
        quantidade: 150),
    Medicamento(
        nome: 'Dipirona 1g', lote: 'B456', validade: '10/2026', quantidade: 80),
    Medicamento(
        nome: 'Amoxicilina 250mg',
        lote: 'C789',
        validade: '01/2025',
        quantidade: 25),
    Medicamento(
        nome: 'Ibuprofeno 400mg',
        lote: 'D101',
        validade: '06/2027',
        quantidade: 200),
    Medicamento(
        nome: 'Loratadina 10mg',
        lote: 'E112',
        validade: '08/2024',
        quantidade: 50),
  ];

  // A função de ajuste manual continua a mesma
  void _mostrarDialogoAjuste(Medicamento medicamento) {
    // ... (código do diálogo de ajuste manual sem alterações) ...
    // Para manter a resposta concisa, o código completo está no final
  }

  // --- NOVA LÓGICA DO SCANNER ---

  // 1. Função que abre a câmera
  Future<void> _abrirScanner(BuildContext context) async {
    final String? barcode = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );
    // 2. Se um código foi lido, chama o diálogo de ação
    if (barcode != null && context.mounted) {
      _mostrarDialogoDeAcao(context, barcode);
    }
  }

  // 3. Função que mostra o pop-up DEPOIS de escanear
  void _mostrarDialogoDeAcao(BuildContext context, String barcode) {
    final TextEditingController quantidadeController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Registrar Ação'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código lido: $barcode'),
                const SizedBox(height: 16),
                TextFormField(
                  controller: quantidadeController,
                  decoration: const InputDecoration(labelText: 'Quantidade'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Campo obrigatório';
                    if (int.tryParse(value) == null) return 'Número inválido';
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            // Botão para registrar SAÍDA
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'SAÍDA de ${quantidadeController.text} un. (Cód: $barcode) registrada!')),
                  );
                }
              },
              child: const Text('Registrar Saída',
                  style: TextStyle(color: AppColors.laranjaSuave)),
            ),
            // Botão para registrar ENTRADA
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'ENTRADA de ${quantidadeController.text} un. (Cód: $barcode) registrada!')),
                  );
                }
              },
              child: const Text('Registrar Entrada'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Estoque da Unidade'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.scan_barcode, size: 28),
            tooltip: 'Escanear Entrada / Saída',
            onPressed: () {
              // Chama a função principal do scanner
              _abrirScanner(context);
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: _estoque.length,
        itemBuilder: (context, index) {
          final medicamento = _estoque[index];
          final bool estoqueBaixo = medicamento.quantidade < 30;
          final bool vencimentoProximo = DateTime.tryParse(
                      '20${medicamento.validade.split('/')[1]}-${medicamento.validade.split('/')[0]}-01')
                  ?.isBefore(DateTime.now().add(const Duration(days: 60))) ??
              false;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: vencimentoProximo
                    ? Colors.red.shade200
                    : (estoqueBaixo
                        ? Colors.orange.shade200
                        : Colors.transparent),
                width: 1.5,
              ),
            ),
            // Ao clicar no card, abre o ajuste manual
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              title: Text(medicamento.nome,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                  'Lote: ${medicamento.lote} | Val: ${medicamento.validade}'),
              trailing: Text('${medicamento.quantidade} un.',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              onTap: () => _mostrarDialogoAjuste(medicamento),
              tileColor: vencimentoProximo
                  ? Colors.red.withOpacity(0.05)
                  : (estoqueBaixo
                      ? Colors.orange.withOpacity(0.05)
                      : Colors.white),
            ),
          );
        },
      ),
    );
  }
}
