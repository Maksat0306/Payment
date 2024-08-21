import 'package:flutter/material.dart';

class CustomAlertMessage extends StatelessWidget {
  final String message;
  final TextSpan? highlightedText; // Vurgulanmış metin için ek özellik
  final Widget icon; // IconData yerine Widget türü

  const CustomAlertMessage({
    super.key,
    required this.message,
    this.highlightedText,
    this.icon = const SizedBox.shrink(), // Varsayılan olarak boş bir widget
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon, // Burada artık doğrudan bir Widget kullanabiliriz
        const SizedBox(width: 8), // İkon ile metin arasındaki boşluk
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
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
