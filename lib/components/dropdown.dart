import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String? selectedValue; // Seçilen değeri tutar
  final ValueChanged<String?>? onChanged; // Değer değiştiğinde çağrılan işlev
  final bool showError; // Hata mesajını gösterip göstermeyeceğimizi kontrol eder

  const CustomDropdown({
    super.key,
    this.selectedValue,
    this.onChanged,
    this.showError = false, // Varsayılan olarak hata mesajı gösterilmez
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String? _selectedValue;
  bool _isDropdownValid = true;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue; // Başlangıç değeri olarak dışarıdan gelen değeri ayarlıyoruz
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48, // Dropdown yüksekliği
          padding: const EdgeInsets.symmetric(horizontal: 12.0), // İçerik yatay dolgu
          decoration: BoxDecoration(
            color: const Color(0xFF2D2D2E), // Arka plan rengi
            border: Border.all(
              color: _isDropdownValid ? const Color(0xFF363738) : Colors.red, // Geçerli değilse kırmızı sınır
            ), // Sınır rengi
            borderRadius: BorderRadius.circular(8), // Köşe yuvarlama
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true, // Dropdown genişliğini konteyner boyutuna genişletir
              value: _selectedValue, // Seçili değeri ayarlıyoruz
              hint: const Text(
                'Karty saýla',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'ClashDisplay'), // Varsayılan metin rengi
              ),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white70), // Dropdown oku
              dropdownColor: const Color(0xFF2A2A2A), // Dropdown menüsünün arka plan rengi
              items: ['Kart 1', 'Kart 2', 'Kart 3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value, // Her bir seçeneğin değeri
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white70, // Menüdeki metin rengi
                      fontFamily: 'ClashDisplay', // Özel yazı tipi
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue; // Seçilen değeri güncelle
                  _isDropdownValid = newValue != null; // Seçim yapılmadıysa geçerli değil olarak işaretle
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue); // Değer değiştiğinde dışarıdan gelen işlevi çağır
                }
              },
            ),
          ),
        ),
        if (!_isDropdownValid && widget.showError) // Hata mesajını sadece geçerli değilse göster
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Text(
              'Lütfen bir kart seçin',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
