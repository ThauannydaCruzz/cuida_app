// lib/src/features/home/home_screen.dart

import 'package:flutter/material.dart';
import 'package:cuida_app/src/features/stock/stock_management_screen.dart';
import 'package:cuida_app/src/features/map/map_screen.dart';
import 'package:cuida_app/src/features/reports/reports_screen.dart';
import 'package:cuida_app/src/features/documents/documents_screen.dart'; // NOVO IMPORT
import 'package:cuida_app/src/core/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Ainda 4 abas, mas a última mudou
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Painel CUIDA',
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 1,
          actions: [
            IconButton(
              icon: const Icon(Iconsax.logout, color: Colors.black54),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
          bottom: TabBar(
            labelColor: AppColors.azulSuave,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.azulSuave,
            indicatorWeight: 3,
            tabs: const [
              Tab(icon: Icon(Iconsax.home_2), text: 'Início'),
              Tab(icon: Icon(Iconsax.box), text: 'Estoque'),
              Tab(icon: Icon(Iconsax.map_1), text: 'Mapa'),
              // ABA ATUALIZADA: Documentos
              Tab(icon: Icon(Iconsax.document_1), text: 'Docs'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildHomeDashboard(context),
            const StockManagementScreen(),
            const MapScreen(),
            // Página de Documentos agora
            const DocumentsScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeDashboard(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Olá, Gestor!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Resumo do dia e atalhos rápidos.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          _buildStatCard(
            context: context,
            title: 'Estoque Total',
            value: '8.520 un.',
            icon: Iconsax.box,
            color: AppColors.azulSuave,
            onTap: () {
              DefaultTabController.of(context)
                  .animateTo(1); // Navega para a aba de Estoque
            },
          ),
          _buildStatCard(
            context: context,
            title: 'Itens em Alerta',
            value: '17 Itens',
            subtitle: 'Estoque baixo ou vencimento próximo',
            icon: Iconsax.warning_2,
            color: Colors.orange.shade400,
            onTap: () {},
          ),
          _buildStatCard(
            context: context,
            title: 'Gerar Relatórios',
            value: 'Análise de Dados',
            subtitle: 'Visualize entradas, saídas e mais',
            icon: Iconsax.document_text,
            color: Colors.purple.shade300,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReportsScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required String title,
    required String value,
    String? subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(icon, size: 32, color: Colors.white.withOpacity(0.8)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Text(value,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(subtitle,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12)),
                    ]
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
