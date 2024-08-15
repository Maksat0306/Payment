import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldText extends StatelessWidget {
  final String? hintText; // Hint metni, metin alanı boşken gösterilen gri metin.
  final void Function(String)? onChanged; // Kullanıcı metin alanına bir şey yazdığında tetiklenecek işlev.
  final TextEditingController? controller; // Metin alanını kontrol etmek için kullanılan denetleyici.
  final String? Function(String?)? validator; // Form validasyon işlemleri için kullanılan işlev.
  final TextInputType? keyboardType; // Klavye türü, örneğin sayı, metin, telefon vb.
  final List<TextInputFormatter>? inputFormatters; // Giriş formatlarını belirlemek için kullanılan formatlayıcılar.
  final Widget? suffixIcon; // Metin alanının sağ tarafında gösterilecek simge.
  final VoidCallback? onSuffixIconPressed; // Sağdaki simgeye tıklandığında çalışacak işlev.

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
      height: 50,  // Metin alanının yüksekliği 44 piksel olarak sabitleniyor.
      child: TextFormField(
        onChanged: onChanged, // Kullanıcı metni değiştirdiğinde tetiklenecek işlev.
        keyboardType: keyboardType ?? TextInputType.text, // Klavye türü ayarlanıyor, varsayılan metin klavyesi.
        validator: validator, // Form validasyonu için kullanılan işlev.
        controller: controller, // Metin alanını kontrol etmek için kullanılan denetleyici.
        inputFormatters: inputFormatters, // Giriş formatlarını belirlemek için kullanılan formatlayıcılar.
        decoration: InputDecoration(
          isDense: true, // Metin alanının daha az yer kaplamasını sağlar.
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),  // İçerik dolgusu, yazı ve kenarlar arasındaki boşluk.
          hintText: hintText, // Kullanıcı herhangi bir şey yazmadığında görünen hint metni.
          hintStyle: TextStyle(color: Colors.grey), // Hint metninin stili (rengi, boyutu vb.).
          filled: true, // Arka plan renginin doldurulmasını sağlar.
          fillColor: Color(0xFF2D2D2E), // Arka plan rengi.
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Kenarların yuvarlatılma miktarı.
            borderSide: BorderSide.none, // Kenar çizgisi yok, dolayısıyla kenar çizgisi görünmeyecek.
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Etkin durumdaki kenarların yuvarlatılması.
            borderSide: BorderSide(color: Color(0xFF363738)), // Kenar çizgisinin rengi (etkin durumda).
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Metin alanı odaklandığında kenarların yuvarlatılması.
            borderSide: BorderSide(color: Color(0xFF4D4F51), width: 0.8), // Odaklanıldığında kenar çizgisinin rengi ve kalınlığı.
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
            icon: suffixIcon!, // Sağda yer alan simge.
            onPressed: onSuffixIconPressed, // Simgeye tıklandığında çalışacak işlev.
          )
              : null, // Eğer `suffixIcon` sağlanmamışsa, sağda herhangi bir simge gösterilmez.
        ),
        style: TextStyle(color: Colors.white), // Yazı stili, burada yazı rengi beyaz olarak ayarlanmış.
      ),
    );
  }
}
