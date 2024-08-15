import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2E), // Arka plan rengi
        // border: Border.all(color: Colors.white70), // Sınır rengi
        borderRadius: BorderRadius.circular(8), // Köşe yuvarlama
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true, // DropdownButton'ın genişliğini genişletir
          value: _selectedValue,
          hint: Text(
            'Karty saýla',
            style: TextStyle(color: Colors.white70),
          ),
          icon: Icon(Icons.arrow_drop_down, color: Colors.white70), // Ok ikonu
          dropdownColor: Color(0xFF2A2A2A), // DropDown menüsünün arka plan rengi
          items: ['Kart 1', 'Kart 2', 'Kart 3'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.white70), // Menüdeki metin rengi
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
