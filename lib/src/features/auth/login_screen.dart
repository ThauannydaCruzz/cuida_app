// lib/src/features/auth/login_screen.dart

import 'package:flutter/material.dart';
import 'package:cuida_app/src/core/theme/app_colors.dart';
import 'package:cuida_app/src/features/home/home_screen.dart';
import 'package:cuida_app/src/features/auth/signup_screen.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulSuave,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Login',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'E-mail Corporativo',
                      prefixIcon: const Icon(Iconsax.sms),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: const Icon(Iconsax.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (Route<dynamic> route) => false);
                    },
                    child: const Text('Entrar'),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Não tem uma conta?",
                        style: TextStyle(color: Colors.grey[600])),
                    TextButton(
                      onPressed: () {
                        // CORREÇÃO ESTÁ AQUI: SEM 'const'
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: const Text('Cadastre-se'),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text('[Pular Login (Dev)]',
                        style: TextStyle(color: Colors.grey[600])),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
