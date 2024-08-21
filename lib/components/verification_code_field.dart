import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCodeField extends StatelessWidget {
  final String? hintText; // TextField içindeki ipucu metni
  final void Function(String)? onChanged; // Metin değiştirildiğinde tetiklenen işlev
  final TextEditingController? controller; // TextField kontrolcüsü
  final String? Function(String?)? validator; // Form validasyon işlevi

  const VerificationCodeField({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60, // TextField yüksekliği
      child: TextFormField(
        onChanged: onChanged, // Metin değiştirildiğinde tetiklenen işlev
        keyboardType: TextInputType.number, // Klavye türü sayı olarak ayarlandı
        controller: controller, // TextField kontrolcüsü
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Sadece sayısal girişe izin verir
          LengthLimitingTextInputFormatter(5), // Maksimum 5 haneli sayısal girişe izin verir
        ],
        decoration: InputDecoration(
          isDense: true, // İç dolgunun sıkı olmasını sağlar, yüksekliği azaltır
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12), // İçerik dolgusu
          hintText: hintText ?? 'SMS Kodu', // İpucu metni
          hintStyle: const TextStyle(color: Colors.grey), // İpucu metni stili
          filled: true, // Arka plan renginin doldurulmasını sağlar
          fillColor: const Color(0xFF2D2D2E), // Arka plan rengi
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Kenarların yuvarlatılması
            borderSide: BorderSide.none, // Kenar çizgisi yok
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Etkin durumda kenarların yuvarlatılması
            borderSide: const BorderSide(color: Color(0xFF363738)), // Kenar çizgisinin rengi (etkin durumda)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Odaklandığında kenarların yuvarlatılması
            borderSide: const BorderSide(color: Color(0xFF4D4F51), width: 0.8), // Odaklanıldığında kenar çizgisinin rengi ve kalınlığı
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Hata durumunda kenarların yuvarlatılması
            borderSide: const BorderSide(color: Colors.red, width: 1.0), // Hata durumunda kenar çizgisinin rengi ve kalınlığı
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Odaklandığında ve hata olduğunda kenarların yuvarlatılması
            borderSide: const BorderSide(color: Colors.red, width: 1.2), // Hata durumunda odaklanıldığında kenar çizgisinin rengi ve kalınlığı
          ),
        ),
        style: const TextStyle(
          color: Colors.white, // Kullanıcı tarafından girilen metnin rengi
          fontFamily: 'ClashDisplay', // Yazı tipi
        ),
        validator: validator, // Form validasyonu için kullanılan işlev
      ),
    );
  }
}
