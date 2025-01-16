import 'package:flutter/material.dart';
import 'package:oak_estagio_project/src/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Produtos - Estágio OAK Tecnologia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:
          const HomeView(title: 'Gestor de Produtos - Estágio OAK Tecnologia'),
    );
  }
}
