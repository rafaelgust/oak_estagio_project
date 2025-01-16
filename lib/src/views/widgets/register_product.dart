import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/product_model.dart';

class RegisterProduct extends StatefulWidget {
  final Function(ProductModel)? onSave;

  const RegisterProduct({
    super.key,
    this.onSave,
  });

  @override
  State<RegisterProduct> createState() => _RegisterProductState();
}

class _RegisterProductState extends State<RegisterProduct> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  bool _isAvailableForSale = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  Future<void> _saveProduct() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final product = ProductModel(
        name: _nameController.text,
        description: _descriptionController.text,
        value: double.parse(_valueController.text.replaceAll(',', '.')),
        isAvailableForSale: _isAvailableForSale,
      );

      await widget.onSave?.call(product);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produto salvo com sucesso!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar produto: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  String? _validateValue(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }

    final doubleValue = double.tryParse(value.replaceAll(',', '.'));
    if (doubleValue == null) {
      return 'Digite um valor válido';
    }

    if (doubleValue <= 0) {
      return 'O valor deve ser maior que zero';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 450,
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              validator: _validateNotEmpty,
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
              validator: _validateNotEmpty,
              maxLines: 3,
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: _valueController,
              decoration: const InputDecoration(
                labelText: 'Valor do Produto',
                border: OutlineInputBorder(),
                prefixText: 'R\$ ',
              ),
              validator: _validateValue,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]')),
              ],
              textInputAction: TextInputAction.done,
            ),
            const Text('Disponibilidade para venda'),
            Row(
              spacing: 8.0,
              children: [
                Switch(
                  value: _isAvailableForSale,
                  onChanged: (value) {
                    setState(() => _isAvailableForSale = value);
                  },
                ),
                Text(_isAvailableForSale ? 'Disponível' : 'Indisponível'),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveProduct,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Criar Produto'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
