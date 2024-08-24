import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StringFiled extends StatelessWidget {
  final String? hintText; // TextField içindeki ipucu metni
  final void Function(String)? onChanged; // Metin değiştirildiğinde tetiklenen işlev
  final TextEditingController? controller; // TextField kontrolcüsü
  final String? Function(String?)? validator; // Form validasyon işlevi
  final TextInputType? keyboardType; // Klavye türü
  final List<TextInputFormatter>? inputFormatters; // Giriş formatlayıcıları
  final Widget? suffixIcon; // Sağ tarafta gösterilecek simge
  final VoidCallback? onSuffixIconPressed; // Sağ simgeye tıklandığında tetiklenen işlev

  const StringFiled({
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
        keyboardType: keyboardType ?? TextInputType.text, // Klavye türü varsayılan olarak sayı
        validator: validator, // Form validasyon işlevi
        controller: controller, // TextField kontrolcüsü
        inputFormatters: inputFormatters,
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
            borderRadius: BorderRadius.circular(8), // Odaklandığında kenarların yuvarlatılması
            borderSide: const BorderSide(color: Color(0xFF4D4F51), width: 1.0), // Odaklanıldığında kenar çizgisinin rengi ve kalınlığı
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Hata durumunda kenarların yuvarlatılması
            borderSide: const BorderSide(color: Colors.red, width: 1.0), // Hata durumunda kenar çizgisinin rengi ve kalınlığı
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Odaklanıldığında ve hata olduğunda kenarların yuvarlatılması
            borderSide: const BorderSide(color: Colors.red, width: 1.0), // Hata durumunda odaklanıldığında kenar çizgisinin rengi ve kalınlığı
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



class SpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Yeni metinden boşlukları kaldır
    final text = newValue.text.replaceAll(' ', '');

    // Eğer metin uzunluğu 16'dan fazlaysa, eski değeri döndür
    if (text.length > 16) {
      return oldValue;
    }

    // Metni boşluklarla biçimlendirmek için bir StringBuffer kullanıyoruz
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]); // Karakteri ekle
      final nonSpaceCharacters = i + 1; // Toplam karakter sayısı (boşluksuz)
      if (nonSpaceCharacters % 4 == 0 && nonSpaceCharacters != text.length) {
        buffer.write(' '); // Her 4 karakterde bir boşluk ekle
      }
    }

    // Son haliyle yeni metni alıyoruz
    final newText = buffer.toString();

    // Seçim aralığını metnin sonuna ayarlayarak yeni değeri döndürüyoruz
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}




