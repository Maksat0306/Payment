import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAlertMessage extends StatelessWidget {
  final String message;
  final TextSpan? highlightedText; // Vurgulanmış metin için ek özellik
  final Widget icon; // IconData yerine Widget türü

  const CustomAlertMessage({
    Key? key,
    required this.message,
    this.highlightedText,
    this.icon = const Icon(Icons.info, color: Colors.white70, size: 20), // Varsayılan olarak bilgi simgesi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon, // Burada artık doğrudan bir Widget kullanabiliriz
        SizedBox(width: 8), // İkon ile metin arasındaki boşluk
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'ClashDisplay',
                fontWeight: FontWeight.w500,
                color: Colors.white70, // Ana metin rengi
                height: 1.6, // Satır yüksekliği (line height)
              ),
              children: [
                TextSpan(text: message),
                if (highlightedText != null) highlightedText!,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
