import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberField extends StatelessWidget {
  final String? hintText; // Hint metni, metin alanı boşken gösterilen gri metin.
  final void Function(String)? onChanged; // Kullanıcı metin alanına bir şey yazdığında tetiklenecek işlev.
  final TextEditingController? controller; // Metin alanını kontrol etmek için kullanılan denetleyici.
  final String? Function(String?)? validator; // Form validasyon işlemleri için kullanılan işlev.

  const NumberField({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,  // Metin alanının yüksekliği 50 piksel olarak sabitleniyor.
      child: TextFormField(
        onChanged: onChanged, // Kullanıcı metni değiştirdiğinde tetiklenecek işlev.
        keyboardType: TextInputType.number, // Klavye türü sayısal olarak ayarlanıyor.
        controller: controller, // Metin alanını kontrol etmek için kullanılan denetleyici.
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Sadece sayısal girişe izin verir.
          _NumberInputFormatter(maxValue: 500), // 500'den büyük sayıların girilmesini engeller.
        ],
        decoration: InputDecoration(
          isDense: true, // Metin alanının daha az yer kaplamasını sağlar.
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),  // İçerik dolgusu, yazı ve kenarlar arasındaki boşluk.
          hintText: hintText, // Kullanıcı herhangi bir şey yazmadığında görünen hint metni.
          hintStyle: const TextStyle(color: Colors.grey), // Hint metninin stili (rengi, boyutu vb.).
          filled: true, // Arka plan renginin doldurulmasını sağlar.
          fillColor: const Color(0xFF2D2D2E), // Arka plan rengi.
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Kenarların yuvarlatılma miktarı.
            borderSide: BorderSide.none, // Kenar çizgisi yok, dolayısıyla kenar çizgisi görünmeyecek.
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Etkin durumdaki kenarların yuvarlatılması.
            borderSide: const BorderSide(color: Color(0xFF363738)), // Kenar çizgisinin rengi (etkin durumda).
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Metin alanı odaklandığında kenarların yuvarlatılması.
            borderSide: const BorderSide(color: Color(0xFF4D4F51), width: 0.8), // Odaklanıldığında kenar çizgisinin rengi ve kalınlığı.
          ),
        ),
        style: const TextStyle(color: Colors.white), // Yazı stili, burada yazı rengi beyaz olarak ayarlanmış.
        validator: validator, // Form validasyonu için kullanılan işlev.
      ),
    );
  }
}

class _NumberInputFormatter extends TextInputFormatter {
  final int maxValue;

  _NumberInputFormatter({required this.maxValue});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue; // Eğer metin alanı boşsa, herhangi bir işlem yapmadan devam et.
    }

    final intValue = int.tryParse(newValue.text) ?? 0;
    if (intValue > maxValue) {
      // Eğer girilen sayı 500'den büyükse, eski değeri geri yükle.
      return oldValue;
    }

    return newValue; // Eğer girilen sayı 500 veya daha küçükse, yeni değeri döndür.
  }
}
