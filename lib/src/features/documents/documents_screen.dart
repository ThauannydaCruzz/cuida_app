// lib/src/features/documents/documents_screen.dart

import 'package:flutter/material.dart';
import 'package:cuida_app/src/core/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';

class Document {
  final String title;
  final String type; // 'Nota Fiscal', 'Relatório', 'Laudo', 'Receita'
  final String date;
  final String ref; // Número da Nota, ID do Relatório, etc.
  final IconData icon;
  final Color color;

  Document({
    required this.title,
    required this.type,
    required this.date,
    required this.ref,
    required this.icon,
    required this.color,
  });
}

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  final List<Document> _allDocuments = [
    Document(
        title: 'NF-e 0012345',
        type: 'Nota Fiscal',
        date: '01/08/2023',
        ref: 'ABC12345',
        icon: Iconsax.document_text_1,
        color: AppColors.azulSuave),
    Document(
        title: 'Relatório Mensal Estoque Ago',
        type: 'Relatório',
        date: '31/08/2023',
        ref: 'REL-AGO-23',
        icon: Iconsax.document,
        color: Colors.green.shade400),
    Document(
        title: 'Laudo de Auditoria Q2 2023',
        type: 'Laudo',
        date: '15/07/2023',
        ref: 'AUDIT-Q2',
        icon: Iconsax.document_favorite,
        color: Colors.orange.shade400),
    Document(
        title: 'NF-e 0012346',
        type: 'Nota Fiscal',
        date: '05/09/2023',
        ref: 'DEF67890',
        icon: Iconsax.document_text_1,
        color: AppColors.azulSuave),
    Document(
        title: 'Relatório de Saídas Set',
        type: 'Relatório',
        date: '30/09/2023',
        ref: 'REL-SET-23',
        icon: Iconsax.document,
        color: Colors.green.shade400),
  ];

  List<Document> _filteredDocuments = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredDocuments = _allDocuments;
    _searchController.addListener(_filterDocuments);
  }

  void _filterDocuments() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredDocuments = _allDocuments.where((doc) {
        return doc.title.toLowerCase().contains(query) ||
            doc.type.toLowerCase().contains(query) ||
            doc.ref.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterDocuments);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Documentos',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar documentos...',
                prefixIcon: const Icon(Iconsax.search_normal_1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDocuments.length,
              itemBuilder: (context, index) {
                final doc = _filteredDocuments[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  color: doc.color.withOpacity(0.1),
                  child: ListTile(
                    leading: Icon(doc.icon, color: doc.color, size: 30),
                    title: Text(doc.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        '${doc.type} - Ref: ${doc.ref}\nData: ${doc.date}'),
                    trailing: const Icon(Iconsax.arrow_right_3, size: 20),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Abrindo documento: ${doc.title}')),
                      );
                      // Lógica para abrir o documento
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
