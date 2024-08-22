import 'package:flutter/material.dart';
import '../models.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _cardHolderNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  String? _selectedBank;

  void _saveCardInfo() {
    if (_selectedBank != null &&
        _cardHolderNameController.text.isNotEmpty &&
        _cardNumberController.text.isNotEmpty &&
        _expiryDateController.text.isNotEmpty) {
      final cardInfo = CardInfo(
        cardHolderName: _cardHolderNameController.text,
        cardNumber: _cardNumberController.text,
        expiryDate: _expiryDateController.text,
        bankName: _selectedBank!,
      );

      Navigator.pop(context, cardInfo);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Kart Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Kart Sahibinin Adı", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: _cardHolderNameController,
              decoration: InputDecoration(
                hintText: "Adınızı girin",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Kart Numarası", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                hintText: "Kart numaranızı girin",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Son Kullanma Tarihi", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: _expiryDateController,
              decoration: InputDecoration(
                hintText: "MM/YY",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Banka Seçin", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedBank,
              items: const [
                DropdownMenuItem(value: "Rysgal", child: Text("Rysgal")),
                DropdownMenuItem(value: "Senagat", child: Text("Senagat")),
                DropdownMenuItem(value: "Turkmenbashi", child: Text("Türkmenbaşy")),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedBank = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _saveCardInfo,
                child: const Text("Kartı Kaydet"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
