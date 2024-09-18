import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toleg/components/custom_continue_button.dart';
import '../components/custom_dropdown.dart';
import '../components/string_filed.dart';
import '../constants/colors.dart';
import '../data/card_info_repo.dart';
import '../data/models.dart';
import '../providers.dart';
import '../utils/text_styles.dart';

class AddCardScreen extends ConsumerStatefulWidget {
  const AddCardScreen({super.key});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends ConsumerState<AddCardScreen> {
  final cardInfoRepo = CardInfoRepo();
  late TextEditingController cardHolderNameController;
  late TextEditingController cardNumberController;
  late TextEditingController expiryDateController;
  String? selectedBank;

  void _saveCardInfo() {
    if (selectedBank != null &&
        cardHolderNameController.text.isNotEmpty &&
        cardNumberController.text.isNotEmpty &&
        expiryDateController.text.isNotEmpty) {
      cardInfoRepo.addCardInfoList(
        CardInfo(
          cardHolderName: cardHolderNameController.text,
          cardNumber: cardNumberController.text,
          expiryDate: expiryDateController.text,
          bankName: selectedBank!,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun')),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    final cardHolder = ref.read(cardNameProvider);
    final cardNumber = ref.read(cardNumberProvider);
    final expiryDate = ref.read(cardNumberProvider);

    cardHolderNameController = TextEditingController(text: cardHolder);
    cardNumberController = TextEditingController(text: cardNumber);
    expiryDateController = TextEditingController(text: expiryDate);

    cardHolderNameController.addListener(() {
      ref.read(phoneProvider.notifier).state = cardHolderNameController.text;
    });

    cardNumberController.addListener(() {
      ref.read(amountProvider.notifier).state = cardNumberController.text;
    });

    cardNumberController.addListener(() {
      ref.read(amountProvider.notifier).state = cardNumberController.text;
    });
  }

  @override
  void dispose() {
    cardHolderNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey, // FormState için GlobalKey kullanın.
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
                        controller: cardHolderNameController,
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
                        controller: cardNumberController,
                        inputFormatters: [SpaceInputFormatter()],
                        validator: (value) {
                          if (value == null || value.replaceAll(' ', '').length != 16) {
                            return 'Lütfen tam 16 karakter giriniz.';
                          }
                          return null;
                        },
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
                        controller: expiryDateController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          // Sadece sayısal girişe izin verir
                          LengthLimitingTextInputFormatter(4),
                          // Maksimum 4 haneli sayısal girişe izin verir
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
                        selectedValue: selectedBank,
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
                            selectedBank = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  CustomContinueButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _saveCardInfo();
                      }
                    },
                    text: 'Karty goş',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
