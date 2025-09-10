// lib/src/features/map/health_units_mock.dart

import 'package:latlong2/latlong.dart';

class Medicamento {
  final String nome;
  int quantidade;
  Medicamento({required this.nome, required this.quantidade});
}

class UnidadeSaude {
  final String nome;
  final LatLng coordenadas;
  final List<Medicamento> estoque;

  UnidadeSaude(
      {required this.nome, required this.coordenadas, required this.estoque});
}

// LISTA COMPLETA E ATUALIZADA DE UNIDADES DE SAÚDE DE MARÍLIA
final List<UnidadeSaude> unidadesDeSaudeMock = [
  UnidadeSaude(
      nome: 'UBS Alto Cafezal',
      coordenadas: LatLng(-22.218229, -49.956679),
      estoque: [
        Medicamento(nome: 'Paracetamol 500mg', quantidade: 120),
        Medicamento(nome: 'Dipirona 1g', quantidade: 200)
      ]),
  UnidadeSaude(
      nome: 'UBS Bandeirantes',
      coordenadas: LatLng(-22.202076, -49.969947),
      estoque: [
        Medicamento(nome: 'Amoxicilina 250mg', quantidade: 50),
        Medicamento(nome: 'Ibuprofeno 400mg', quantidade: 150)
      ]),
  UnidadeSaude(
      nome: 'UBS Cascata',
      coordenadas: LatLng(-22.213551, -49.941483),
      estoque: [
        Medicamento(nome: 'Loratadina 10mg', quantidade: 80),
        Medicamento(nome: 'Dipirona 1g', quantidade: 10)
      ]),
  UnidadeSaude(
      nome: 'UBS Castelo Branco',
      coordenadas: LatLng(-22.188219, -49.958947),
      estoque: [
        Medicamento(nome: 'Paracetamol 500mg', quantidade: 300),
        Medicamento(nome: 'Amoxicilina 250mg', quantidade: 0)
      ]),
  UnidadeSaude(
      nome: 'UBS Chico Mendes',
      coordenadas: LatLng(-22.220932, -49.971957),
      estoque: [
        Medicamento(nome: 'Ibuprofeno 400mg', quantidade: 250),
        Medicamento(nome: 'Dipirona 1g', quantidade: 120)
      ]),
  UnidadeSaude(
      nome: 'UBS Costa e Silva',
      coordenadas: LatLng(-22.24092, -49.929256),
      estoque: [Medicamento(nome: 'Loratadina 10mg', quantidade: 90)]),
  UnidadeSaude(
      nome: 'USF J.K.',
      coordenadas: LatLng(-22.210847, -49.962205),
      estoque: [Medicamento(nome: 'Paracetamol 500mg', quantidade: 180)]),
  UnidadeSaude(
      nome: 'UBS Planalto',
      coordenadas: LatLng(-22.250841, -49.936068),
      estoque: [Medicamento(nome: 'Dipirona 1g', quantidade: 220)]),
  UnidadeSaude(
      nome: 'UBS São Judas',
      coordenadas: LatLng(-22.197578, -49.952804),
      estoque: [Medicamento(nome: 'Amoxicilina 250mg', quantidade: 75)]),
  UnidadeSaude(
      nome: 'UBS São Miguel',
      coordenadas: LatLng(-22.207679, -49.942408),
      estoque: [Medicamento(nome: 'Ibuprofeno 400mg', quantidade: 130)]),
  UnidadeSaude(
      nome: 'USF Parque das Nações',
      coordenadas: LatLng(-22.207006, -49.879692),
      estoque: [Medicamento(nome: 'Paracetamol 500mg', quantidade: 20)]),
  UnidadeSaude(
      nome: 'USF Jardim Cavalari',
      coordenadas: LatLng(-22.188261, -49.975131),
      estoque: [Medicamento(nome: 'Dipirona 1g', quantidade: 50)]),
  UnidadeSaude(
      nome: 'USF Vila Real',
      coordenadas: LatLng(-22.248564, -49.944339),
      estoque: [Medicamento(nome: 'Loratadina 10mg', quantidade: 110)]),
  UnidadeSaude(
      nome: 'USF Lácio',
      coordenadas: LatLng(-22.331754, -49.998572),
      estoque: [Medicamento(nome: 'Paracetamol 500mg', quantidade: 60)]),
  UnidadeSaude(
      nome: 'USF Aeroporto',
      coordenadas: LatLng(-22.231939, -49.934559),
      estoque: [Medicamento(nome: 'Ibuprofeno 400mg', quantidade: 0)]),
  UnidadeSaude(
      nome: 'USF Santa Antonieta II',
      coordenadas: LatLng(-22.208314, -49.982592),
      estoque: [Medicamento(nome: 'Dipirona 1g', quantidade: 95)]),
  UnidadeSaude(
      nome: 'UPA Norte (Zona Norte)',
      coordenadas: LatLng(-22.200507, -49.937233),
      estoque: [
        Medicamento(nome: 'Paracetamol 500mg', quantidade: 500),
        Medicamento(nome: 'Dipirona 1g', quantidade: 450)
      ]),
  UnidadeSaude(
      nome: 'UPA Zona Sul',
      coordenadas: LatLng(-22.235632, -49.956892),
      estoque: [
        Medicamento(nome: 'Amoxicilina 250mg', quantidade: 180),
        Medicamento(nome: 'Ibuprofeno 400mg', quantidade: 220)
      ]),
  UnidadeSaude(
      nome: 'Farmácia Municipal Central',
      coordenadas: LatLng(-22.219686, -49.950164),
      estoque: [
        Medicamento(nome: 'Paracetamol 500mg', quantidade: 1000),
        Medicamento(nome: 'Dipirona 1g', quantidade: 1200)
      ]), // Coordenada ajustada para o centro
  UnidadeSaude(
      nome: 'Farmácia Popular do Brasil – Centro',
      coordenadas: LatLng(-22.215356, -49.946855),
      estoque: [
        Medicamento(nome: 'Loratadina 10mg', quantidade: 800),
        Medicamento(nome: 'Ibuprofeno 400mg', quantidade: 900)
      ]),
];
