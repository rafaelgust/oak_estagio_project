//  - Nome do produto - campo de texto
//  - Descrição do produto - campo de texto
//  - Valor do produto - campo de valor
//  - Disponível para venda - campo com 2 opções: sim / não

import 'package:intl/intl.dart';

class ProductModel {
  final String name;
  final String description;
  final double value;
  bool isAvailableForSale;

  ProductModel({
    required this.name,
    required this.description,
    required this.value,
    this.isAvailableForSale = false,
  });

  String convertToReal() {
    final format = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return format.format(value);
  }

  void toggleAvailability() {
    isAvailableForSale = !isAvailableForSale;
  }
}
