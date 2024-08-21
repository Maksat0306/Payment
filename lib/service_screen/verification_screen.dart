import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toleg/components/custom_continue_button.dart';
import 'package:toleg/components/verification_code_field.dart';
import '../components/custom_alert_message.dart';
import '../constants/colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  @override
  Widget build(BuildContext context) {
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
            // height: 0, // Bu satırı kaldırdım
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Telefon belgisi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'ClashDisplay',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("993 65 855873",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'ClashDisplay',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    /// TEXT SMS kody
                    Text(
                      'Sms kody',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'ClashDisplay',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8),
                    VerificationCodeField(),
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
        
                CustomContinueButton(onPressed: (){}),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
