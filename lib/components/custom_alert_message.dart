import 'package:flutter/material.dart';

class CustomAlertMessage extends StatelessWidget {
  final String message;
  final TextSpan? highlightedText; // Vurgulanmış metin için ek özellik
  final IconData icon;

  const CustomAlertMessage({
    Key? key,
    required this.message,
    this.highlightedText,
    this.icon = Icons.info, // Varsayılan olarak bilgi simgesi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white70, size: 20), // Simgesi
        SizedBox(width: 8), // İkon ile metin arasındaki boşluk
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white70, // Ana metin rengi
                height: 1.5, // Satır yüksekliği (line height)
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
