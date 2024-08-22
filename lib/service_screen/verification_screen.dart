import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toleg/components/custom_continue_button.dart';
import 'package:toleg/components/verification_code_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/custom_alert_message.dart';
import '../constants/colors.dart';
import '../providers.dart';
import '../utils/text_styles.dart'; // Sağlayıcılar için dosya

class VerificationScreen extends ConsumerWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phone = ref.watch(phoneProvider); // Telefon numarasını alıyoruz
    final amount = ref.watch(amountProvider); // Mukdar (amount) değerini alıyoruz

    return Scaffold(
      backgroundColor: AppColors.darkBackgraund,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.darkCard,
        title: const Text(
          'Tassyklamak',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: "ClashDisplay",
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/arrow-left.svg"),
          // Geri butonu simgesi ve rengi
          onPressed: () => Navigator.pop(
              context), // Geri tuşuna basıldığında önceki sayfaya döner
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              borderRadius: BorderRadius.circular(12), // Kenarları yuvarlama
            ),
            padding: const EdgeInsets.all(16), // İçerikten önce eklenen padding
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    /// Nomer gorkezilyan yer
                    Row(
                      children: [
                        const Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Telefon belgisi",
                                style: AppTextStyles.titleStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "993 $phone", // Sağlayıcıdan gelen telefon numarası
                                style: AppTextStyles.titleStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    /// Mukdar gorkezilyan yer
                    Row(
                      children: [
                        const Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Mukdar",
                                style: AppTextStyles.titleStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "$amount TMT", // Sağlayıcıdan gelen mukdar
                                style: AppTextStyles.titleStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),
                    /// TEXT SMS kody
                    const Text(
                      'Sms kody',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'ClashDisplay',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const VerificationCodeField(),
                  ],
                ),
                const SizedBox(height: 16),
                const CustomAlertMessage(
                  textAlign: TextAlign.center,
                  message:
                  'Maglumatlaryň dogrulygyna göz ýetirip sms arkaly 99365**5873 belgisine gelen tassyklaýyş koduny aşaky boşluga dolduryp tölegi tassyklaň.',
                  highlightedText: TextSpan(
                    text: '',
                    style: TextStyle(
                      fontWeight: FontWeight.w600, // Kalın metin
                      color: Colors.white, // Beyaz renk
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                CustomContinueButton(onPressed: () {}),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
