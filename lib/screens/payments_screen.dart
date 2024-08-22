import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  final String appBarTitle = "Tölegler";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: const Center(
        child: Text('This is the Payments Screen'),
      ),
    );
  }
}
