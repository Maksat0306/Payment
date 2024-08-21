import 'package:flutter/material.dart';

class CustomAlertMessage extends StatelessWidget {
  final String message;
  final TextSpan? highlightedText;
  final Widget? icon; // Icon artık null olabilir
  final TextAlign textAlign; // Metnin hizalanmasını kontrol eder

  const CustomAlertMessage({
    super.key,
    required this.message,
    this.highlightedText,
    this.icon,
    this.textAlign = TextAlign.start, // Varsayılan olarak sola hizalı
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) icon!, // Icon null değilse göster
        if (icon != null) const SizedBox(width: 8), // Eğer icon varsa, boşluk ekle
        Expanded(
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                fontFamily: 'ClashDisplay',
                fontWeight: FontWeight.w500,
                color: Colors.white70,
                height: 1.6,
              ),
              children: [
                TextSpan(text: message),
                if (highlightedText != null) highlightedText!,
              ],
            ),
            textAlign: textAlign, // Metnin hizalanması burada ayarlanır
          ),
        ),
      ],
    );
  }
}
