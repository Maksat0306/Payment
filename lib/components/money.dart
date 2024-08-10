import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Money extends StatelessWidget {
  const Money({super.key});

  final double value = 80.31; // Sunucudan gelen double değer

  @override
  Widget build(BuildContext context) {
    // Double değeri string'e çevirip parçalama
    String valueString =
        value.toStringAsFixed(2); // Noktadan sonra 2 basamak tutar
    List<String> parts =
        valueString.split('.'); // Noktadan önce ve sonra ayırır

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(16), // const ekledim
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '65 142536 belgisiniň hasaby:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'ClashDisplay',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: parts[0], // Noktadan önceki kısım
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontFamily: 'ClashDisplay',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: '.${parts[1]}', // Noktadan sonraki kısım
                            style: const TextStyle(
                              color: Color(0xFF8D8C8D),
                              fontSize: 42,
                              fontFamily: 'ClashDisplay',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Butona tıklanınca ne olacağını buraya yazabilirsiniz
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF303031),
                        // Butonun arka plan rengi
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              24), // Butonun yuvarlatılmış köşeleri
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8), // Butonun iç boşlukları
                      ),
                      icon: const Icon(
                        Icons.add, // Butonun içinde gösterilen ikon
                        color: Colors.white, // İkonun rengi
                        size: 20, // İkonun boyutu
                      ),
                      label: const Text(
                        'Hasaby doldur',
                        style: TextStyle(
                          color: Colors.white, // Yazının rengi
                          fontSize: 14, // Yazının boyutu
                          fontFamily: 'ClashDisplay', // Yazı tipi
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
