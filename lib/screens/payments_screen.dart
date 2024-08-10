import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
        backgroundColor: Colors.red, // Farklı renklerle farklı AppBar'lar tanımlayabilirsiniz
      ),
      body: Center(
        child: Text('This is the Payments Screen'),
      ),
    );
  }
}
