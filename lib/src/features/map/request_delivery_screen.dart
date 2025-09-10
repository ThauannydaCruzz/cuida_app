// lib/src/features/map/request_delivery_screen.dart

import 'package:flutter/material.dart';
import 'package:cuida_app/src/core/theme/app_colors.dart';
import 'package:intl/intl.dart';

class RequestDeliveryScreen extends StatefulWidget {
  final String nomeUnidade;
  const RequestDeliveryScreen({super.key, required this.nomeUnidade});

  @override
  State<RequestDeliveryScreen> createState() => _RequestDeliveryScreenState();
}

class _RequestDeliveryScreenState extends State<RequestDeliveryScreen> {
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Solicitação'),
        backgroundColor: AppColors.azulSuave,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Solicitação para: ${widget.nomeUnidade}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Medicamento', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Quantidade Necessária',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            TextFormField(
              controller: _dateController,
              decoration: const InputDecoration(
                  labelText: 'Data da Entrega',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today)),
              readOnly: true,
              onTap: _selectDate,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _timeController,
              decoration: const InputDecoration(
                  labelText: 'Horário da Entrega',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.access_time)),
              readOnly: true,
              onTap: _selectTime,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.verdeFolha,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16)),
                child: const Text('Enviar Solicitação',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 24),
            const Text('Situação das Solicitações',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildStatusTile(
                status: 'Entregue',
                medicamento: 'Paracetamol 500mg',
                data: '05/09/2025',
                cor: Colors.green),
            _buildStatusTile(
                status: 'Em Rota',
                medicamento: 'Dipirona 1g',
                data: '08/09/2025',
                cor: Colors.blue),
            _buildStatusTile(
                status: 'Em Análise',
                medicamento: 'Ibuprofeno 400mg',
                data: '09/09/2025',
                cor: Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTile(
      {required String status,
      required String medicamento,
      required String data,
      required Color cor}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(Icons.circle, color: cor, size: 12),
        title: Text(medicamento,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Solicitado em: $data'),
        trailing: Text(status,
            style: TextStyle(color: cor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
