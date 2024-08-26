import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toleg/components/custom_continue_button.dart';
import '../components/custom_dropdown.dart';
import '../components/string_filed.dart';
import '../constants/colors.dart';
import '../models.dart';
import '../utils/text_styles.dart';

class AddCardScreen extends ConsumerStatefulWidget {
  const AddCardScreen({super.key});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends ConsumerState<AddCardScreen> {
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  String? _selectedBank;

  void _saveCardInfo() {
    if (_selectedBank != null &&
        _cardHolderNameController.text.isNotEmpty &&
        _cardNumberController.text.isNotEmpty &&
        _expiryDateController.text.isNotEmpty) {
      final cardInfo = CardInfo(
        cardHolderName: _cardHolderNameController.text,
        cardNumber: _cardNumberController.text,
        expiryDate: _expiryDateController.text,
        bankName: _selectedBank!,
      );

      Navigator.pop(context, cardInfo);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// APPBAR
      appBar: AppBar(
        title: const Text("Täze kart goş"),
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/arrow-left.svg"),
          onPressed: () => Navigator.of(context).pop(),
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

      /// BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Familiýasy Ady',
                      style: AppTextStyles.inputUnderText,
                    ),
                    const SizedBox(height: 8),
                    StringFiled(
                      hintText: "Familiýasy Ady",
                      controller: _cardHolderNameController,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kart belgisi',
                      style: AppTextStyles.inputUnderText,
                    ),
                    const SizedBox(height: 8),
                    StringFiled(
                      hintText: "Kart belgisi",
                      controller: _cardNumberController,
                      inputFormatters: [
                        SpaceInputFormatter(), // Her 4 karakterde bir boşluk ekle, maksimum 16 karakter
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kartyň Möhleti',
                      style: AppTextStyles.inputUnderText,
                    ),
                    const SizedBox(height: 8),
                    StringFiled(
                      hintText: "( Aý / Ýyl )",
                      controller: _expiryDateController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Sadece sayısal girişe izin verir
                        LengthLimitingTextInputFormatter(4), // Maksimum 4 haneli sayısal girişe izin verir
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bank saýla',
                      style: AppTextStyles.inputUnderText,
                    ),
                    const SizedBox(height: 8),
                    CustomDropdown(
                      selectedValue: _selectedBank,
                      // 'value' yerine 'selectedValue' kullanılıyor
                      items: [
                        'Altyn asyr kart (beýleki banklar)',
                        'Rysgal bank',
                        'TDYDB (ýnesh) bank',
                        'Senagat bank'
                      ],
                      hintText: 'Bank saýla',
                      onChanged: (value) {
                        setState(() {
                          _selectedBank = value;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),


                CustomContinueButton(
                  onPressed: _saveCardInfo,
                  text: 'Karty goş',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
