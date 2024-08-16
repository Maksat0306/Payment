import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/svg.dart";
import "package:toleg/components/number_field.dart";
import "../../constants/colors.dart";
import "../components/custom_alert_message.dart";
import "../components/custom_payment_button.dart";
import "../components/custom_text_button.dart";
import "../components/dropdown.dart";
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

import "../components/text_filed.dart";

class TmcellScreen extends StatefulWidget {
  const TmcellScreen({super.key});

  @override
  State<TmcellScreen> createState() => _TmcellScreenState();
}

class _TmcellScreenState extends State<TmcellScreen> {
  final TextEditingController _amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose(); // Kontrolcüyü temizleme
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackgraund,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.darkCard,
        title: const Text(
          'Tmcell',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: "ClashDisplay",
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/arrow-left.svg"),
          // Geri butonu simgesi ve rengi
          onPressed: () =>
              Navigator.of(context)
                  .pop(), // Geri tuşuna basıldığında önceki sayfaya döner
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              "assets/images/komek_gerek.svg",
              height: 26,
              width: 26,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView( // Ekleme buraya
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              borderRadius: BorderRadius.circular(12), // Kenarları yuvarlama
            ),
            padding: const EdgeInsets.all(16), // İçerikten önce eklenen padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // Column'un sadece içeriği kadar yer kaplamasını sağlar
              children: [
                Row(
                  children: [
                    Text(
                      'Töleg maglumatlary',
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

                SizedBox(height: 24), // Metin ile Dropdown arasında boşluk

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TEXT Telefon belgisi
                    Text(
                      'Telefon belgisi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'ClashDisplay',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8),
                    FieldText(
                      hintText: 'Telefon belgisi',
                      suffixIcon: SvgPicture.asset("assets/images/users.svg"),
                      keyboardType: TextInputType.phone, // Telefon klavyesini açar
                        onSuffixIconPressed: () async {
                          final String? phoneNumber = await _pickContact();
                          if (phoneNumber != null) {
                            phoneController.text = phoneNumber;
                          }
                        },
                    ),
                  ],
                ),

                SizedBox(height: 24),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TEXT Mukdar
                    Text(
                      'Mukdar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'ClashDisplay',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8),
                    NumberField(
                      controller: _amountController,
                      hintText: 'Mukdar',
                    ),
                  ],
                ),

                SizedBox(height: 24),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TEXT Kart saýla
                    Text(
                      'Kart saýla',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'ClashDisplay',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomDropdown(),
                  ],
                ),

                SizedBox(height: 16),

                CustomAlertMessage(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SvgPicture.asset("assets/images/info.svg"),
                  ),
                  message: 'Tölegi şu bank kartlary arkal...',
                  highlightedText: TextSpan(
                    text: 'Altyn asyr kart (beýleki banklar), Rysgal bank, TDYDB (vnesh) bank, Senagat bank',
                    style: TextStyle(
                      fontWeight: FontWeight.w600, // Kalın metin
                      color: Colors.white, // Beyaz renk
                    ),
                  ),
                ),

                SizedBox(height: 16),

                CustomTextButton(
                  text: 'Kömek gerekmi?', // Butonun metni
                  onPressed: () {
                    // Butona tıklanınca çalışacak işlev
                    print('Kömek gerekmi? butonuna tıklandı!');
                  },
                ),
                SizedBox(height: 16),
                CustomPaymentButton(
                  amountController: _amountController,
                  onPressed: () {
                    // Butona tıklanınca çalışacak işlev
                    print('Ödeme işlemi başlatıldı: ${_amountController.text} TMT');
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> _pickContact() async {
    const platform = MethodChannel('contacts');
    try {
      final String? phoneNumber = await platform.invokeMethod('pickContact');
      return phoneNumber;
    } on PlatformException catch (e) {
      print("Failed to pick contact: '${e.message}'.");
      return null;
    }
  }
}
