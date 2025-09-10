// lib/src/features/reports/reports_screen.dart

import 'package:flutter/material.dart';
import 'package:cuida_app/src/core/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String? _selectedReportType = 'Saídas por Medicamento';
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Central de Relatórios'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Filtros do Relatório',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            // Seletor de tipo de relatório
            DropdownButtonFormField<String>(
              value: _selectedReportType,
              decoration: const InputDecoration(
                labelText: 'Tipo de Relatório',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Iconsax.document_filter),
              ),
              items: [
                'Saídas por Medicamento',
                'Entradas por Nota Fiscal',
                'Ajustes Manuais',
                'Medicamentos a Vencer',
              ]
                  .map((label) =>
                      DropdownMenuItem(value: label, child: Text(label)))
                  .toList(),
              onChanged: (value) {
                setState(() => _selectedReportType = value);
              },
            ),
            const SizedBox(height: 16),
            // Seletores de data
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _startDateController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Data Início',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Iconsax.calendar_1),
                    ),
                    onTap: () => _selectDate(context, _startDateController),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _endDateController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Data Fim',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Iconsax.calendar_1),
                    ),
                    onTap: () => _selectDate(context, _endDateController),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Iconsax.receipt_search, color: Colors.white),
              label: const Text('Gerar Relatório'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: AppColors.azulSuave,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // Lógica para buscar os dados e mostrar o resultado abaixo
                // Por enquanto, apenas mostra uma notificação
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Gerando relatório de: $_selectedReportType')),
                );
              },
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            const Text('Resultado',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.document_download,
                        size: 48, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Selecione os filtros e gere um relatório.',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
