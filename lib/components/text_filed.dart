import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldText extends StatelessWidget {
  final String? hintText; // TextField içindeki ipucu metni
  final void Function(String)? onChanged; // Metin değiştirildiğinde tetiklenen işlev
  final TextEditingController? controller; // TextField kontrolcüsü
  final String? Function(String?)? validator; // Form validasyon işlevi
  final TextInputType? keyboardType; // Klavye türü
  final List<TextInputFormatter>? inputFormatters; // Giriş formatlayıcıları
  final Widget? suffixIcon; // Sağ tarafta gösterilecek simge
  final VoidCallback? onSuffixIconPressed; // Sağ simgeye tıklandığında tetiklenen işlev

  const FieldText({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // TextField yüksekliği
      child: TextFormField(
        onChanged: onChanged, // Metin değiştirildiğinde tetiklenen işlev
        keyboardType: keyboardType ?? TextInputType.number, // Klavye türü varsayılan olarak sayı
        validator: validator, // Form validasyon işlevi
        controller: controller, // TextField kontrolcüsü
        inputFormatters: inputFormatters ??
            [
              FilteringTextInputFormatter.digitsOnly, // Sadece rakam girişine izin verir
              LengthLimitingTextInputFormatter(9), // Maksimum uzunluk 9 karakter (8 rakam + 1 boşluk)
              CustomInputFormatter(), // Özel biçimlendirme (Boşluk ekleme)
            ],
        decoration: InputDecoration(
          isDense: true, // İç dolgunun sıkı olmasını sağlar, yüksekliği azaltır
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12), // İçerik dolgusu
          hintText: hintText, // İpucu metni
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
            borderRadius: BorderRadius.circular(10), // Odaklanıldığında ve hata olduğunda kenarların yuvarlatılması
            borderSide: const BorderSide(color: Colors.red, width: 1.2), // Hata durumunda odaklanıldığında kenar çizgisinin rengi ve kalınlığı
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
            icon: suffixIcon!, // Sağda gösterilecek simge
            onPressed: onSuffixIconPressed, // Simgeye tıklandığında tetiklenen işlev
          )
              : null, // Eğer simge yoksa boş bırak
        ),
        style: const TextStyle(
          color: Colors.white, // Kullanıcı tarafından girilen metnin rengi
          fontFamily: 'ClashDisplay', // Yazı tipi
        ),
      ),
    );
  }
}

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Boşluk ekleme
    if (newText.length > 2) {
      newText = newText.substring(0, 2) + ' ' + newText.substring(2);
    }

    // 8 karakterden fazlasını kes
    if (newText.length > 9) {
      newText = newText.substring(0, 9);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length), // İmleci doğru yere yerleştir
    );
  }
}
