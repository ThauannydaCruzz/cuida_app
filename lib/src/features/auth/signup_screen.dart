// lib/src/features/auth/signup_screen.dart

import 'package:flutter/material.dart';
import 'package:cuida_app/src/core/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  static const List<String> _healthUnits = [
    'UBS Alto Cafezal',
    'UBS Bandeirantes',
    'UBS Cascata',
    'Farmácia Municipal Central',
    'UPA Norte (Zona Norte)', /* ...coloque o resto da sua lista aqui... */
  ];

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulSuave,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Criar Conta',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Nome Completo',
                        prefixIcon: Icon(Iconsax.user),
                        border: OutlineInputBorder()),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Campo obrigatório'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Matrícula',
                        // CORREÇÃO: O ícone correto é 'personalcard'
                        prefixIcon: Icon(Iconsax.personalcard),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Campo obrigatório'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Função',
                        // CORREÇÃO: O ícone correto é 'briefcase'
                        prefixIcon: Icon(Iconsax.briefcase),
                        border: OutlineInputBorder()),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Campo obrigatório'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'E-mail Corporativo',
                        prefixIcon: Icon(Iconsax.sms),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || !value.contains('@'))
                        return 'E-mail inválido';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: Icon(Iconsax.lock),
                        border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) => value == null || value.length < 6
                        ? 'A senha deve ter no mínimo 6 caracteres'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Confirmar Senha',
                        prefixIcon: Icon(Iconsax.lock),
                        border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text)
                        return 'As senhas não coincidem';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty)
                        return const Iterable<String>.empty();
                      return _healthUnits.where((option) => option
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()));
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onFieldSubmitted) {
                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: const InputDecoration(
                            labelText: 'Unidade de Trabalho',
                            prefixIcon: Icon(Iconsax.hospital),
                            border: OutlineInputBorder()),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Campo obrigatório'
                            : null,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Lógica de cadastro aqui
                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
