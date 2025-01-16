import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductController extends ChangeNotifier {
  final List<ProductModel> products = [
    ProductModel(
        name: 'Apple iPhone 13',
        description:
            'Modelo mais recente do iPhone com desempenho avançado e câmera de alta qualidade.',
        value: 5999.94,
        isAvailableForSale: false),
    ProductModel(
        name: 'Samsung Galaxy S21',
        description:
            'Smartphone premium da Samsung com tecnologia de ponta e design moderno.',
        value: 4799.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Sony WH-1000XM4',
        description:
            'Fones de ouvido com cancelamento de ruído e qualidade de som excepcional.',
        value: 2099.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Dell XPS 13',
        description:
            'Notebook de alto desempenho, ideal para produtividade e mobilidade.',
        value: 7199.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Apple MacBook Pro',
        description:
            'Notebook poderoso, ideal para profissionais que buscam desempenho e eficiência.',
        value: 7799.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Google Pixel 6',
        description:
            'Último lançamento da Google com Android puro e câmera de alta qualidade.',
        value: 4199.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Amazon Echo Dot',
        description: 'Caixa de som inteligente com assistente Alexa integrado.',
        value: 299.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Apple Watch Series 7',
        description:
            'Relógio inteligente com recursos avançados de monitoramento de saúde.',
        value: 2399.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Nintendo Switch',
        description:
            'Console de jogos portátil e versátil, ideal para diversão em qualquer lugar.',
        value: 1799.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Sony PlayStation 5',
        description:
            'Console de jogos de última geração com gráficos impressionantes.',
        value: 2999.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Microsoft Xbox Series X',
        description:
            'Console de jogos de última geração com desempenho superior.',
        value: 2999.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Bose QuietComfort 35 II',
        description:
            'Fones de ouvido com cancelamento de ruído líder no mercado.',
        value: 1799.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Apple AirPods Pro',
        description: 'Fones de ouvido sem fio com cancelamento de ruído ativo.',
        value: 1499.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Samsung Galaxy Buds Pro',
        description:
            'Fones de ouvido sem fio com cancelamento de ruído e som cristalino.',
        value: 1199.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Fitbit Charge 5',
        description:
            'Pulseira fitness com monitoramento avançado de saúde e exercícios.',
        value: 1079.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'GoPro HERO9',
        description:
            'Câmera de ação com resolução 5K e estabilização de imagem.',
        value: 2399.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Canon EOS R5',
        description:
            'Câmera mirrorless profissional com recursos avançados e alta qualidade.',
        value: 23399.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'DJI Mavic Air 2',
        description:
            'Drone compacto com câmera 4K e excelente estabilidade de voo.',
        value: 4799.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Kindle Paperwhite',
        description:
            'Leitor de e-books com tela de alta resolução e iluminação ajustável.',
        value: 779.94,
        isAvailableForSale: true),
    ProductModel(
        name: 'Apple iPad Pro',
        description:
            'Tablet de alto desempenho com tela de alta resolução e suporte a acessórios profissionais.',
        value: 5999.94,
        isAvailableForSale: true),
  ];

  void insertProduct(ProductModel product) {
    products.insert(0, product);
    notifyListeners();
  }

  void updateProduct(ProductModel product) {
    final index = products.indexWhere((p) => p.name == product.name);
    if (index != -1) {
      products[index] = product;
      notifyListeners();
    }
  }

  void removeProduct(ProductModel product) {
    products.remove(product);
    notifyListeners();
  }

  void toggleAvailability(ProductModel product) {
    product.toggleAvailability();
    notifyListeners();
  }
}
