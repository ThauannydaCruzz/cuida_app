// lib/src/features/map/map_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cuida_app/src/features/map/health_units_mock.dart';
import 'package:cuida_app/src/core/theme/app_colors.dart';
import 'package:cuida_app/src/features/map/request_delivery_screen.dart'; // Import da tela de solicitação

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<UnidadeSaude> _filteredUnits = unidadesDeSaudeMock;
  UnidadeSaude? _selectedUnit;

  void _filterUnits(String query) {
    if (query.isEmpty) {
      setState(() => _filteredUnits = unidadesDeSaudeMock);
      return;
    }
    final lowerCaseQuery = query.toLowerCase();
    final filtered = unidadesDeSaudeMock.where((unit) {
      return unit.estoque.any((medicamento) {
        return medicamento.nome.toLowerCase().contains(lowerCaseQuery) &&
            medicamento.quantidade > 0;
      });
    }).toList();
    setState(() => _filteredUnits = filtered);
  }

  Color _getMarkerColor(UnidadeSaude unit) {
    if (unit.estoque.any((med) => med.quantidade == 0)) return Colors.red;
    if (unit.estoque.any((med) => med.quantidade < 30)) return Colors.orange;
    return AppColors.verdeFolha;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // O AppBar foi removido daqui pois agora a navegação é pela TabBar da HomeScreen
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(-22.2144, -49.9463),
              initialZoom: 13.0,
              onTap: (_, __) => setState(() => _selectedUnit = null),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: _filteredUnits.map((unit) {
                  return Marker(
                    width: 40.0,
                    height: 40.0,
                    point: unit.coordenadas,
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedUnit = unit),
                      child: Icon(
                        Icons.location_pin,
                        color: _getMarkerColor(unit),
                        size: 40.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4))
                ],
              ),
              child: TextField(
                onChanged: _filterUnits,
                decoration: const InputDecoration(
                  hintText: 'Buscar por medicamento...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
          if (_selectedUnit != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_selectedUnit!.nome,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text('Estoque disponível:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          children: _selectedUnit!.estoque
                              .map((med) => ListTile(
                                    title: Text(med.nome),
                                    trailing: Text('${med.quantidade} un.'),
                                    dense: true,
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.local_shipping_outlined),
                          label: const Text('Solicitar Entrega/Transferência'),
                          onPressed: () {
                            // ESTA É A NAVEGAÇÃO CORRETA
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RequestDeliveryScreen(
                                      nomeUnidade: _selectedUnit!.nome)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.azulSuave,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
