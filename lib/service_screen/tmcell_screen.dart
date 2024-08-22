import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/svg.dart";
import "package:toleg/components/number_field.dart";
import "package:toleg/service_screen/verification_screen.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "../../constants/colors.dart";
import "../components/custom_alert_message.dart";
import "../components/custom_payment_button.dart";
import "../components/custom_text_button.dart";
import "../components/dropdown.dart";
import "../components/text_filed.dart";
import '../providers.dart'; // Sağlayıcılar için dosya

class TmcellScreen extends ConsumerStatefulWidget {
  const TmcellScreen({super.key});

  @override
  _TmcellScreenState createState() => _TmcellScreenState();
}

class _TmcellScreenState extends ConsumerState<TmcellScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isDropdownValid = true; // Başlangıçta hata mesajı gösterilmez

  late TextEditingController phoneController;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();

    final phone = ref.read(phoneProvider);
    final amount = ref.read(amountProvider);

    phoneController = TextEditingController(text: phone);
    amountController = TextEditingController(text: amount);

    phoneController.addListener(() {
      ref.read(phoneProvider.notifier).state = phoneController.text;
    });

    amountController.addListener(() {
      ref.read(amountProvider.notifier).state = amountController.text;
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCard = ref.watch(selectedCardProvider.state);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
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
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Telefon belgisi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'ClashDisplay',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FieldText(
                        hintText: 'Telefon belgisi',
                        controller: phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bu alan boş bırakılamaz';
                          }
                          return null;
                        },
                        suffixIcon: SvgPicture.asset("assets/images/users.svg"),
                        keyboardType: TextInputType.phone,
                        onSuffixIconPressed: () async {
                          final String? phoneNumber = await _pickContact();
                          if (phoneNumber != null) {
                            phoneController.text = phoneNumber;
                          }
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mukdar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'ClashDisplay',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      NumberField(
                        controller: amountController,
                        hintText: 'Mukdar',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bu alan boş bırakılamaz';
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
                        'Kart saýla',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'ClashDisplay',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomDropdown(
                        selectedValue: selectedCard.state,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCard.state = newValue;
                            _isDropdownValid = true;
                          });
                        },
                      ),
                      if (!_isDropdownValid)
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Lütfen bir kart seçin',
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomAlertMessage(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SvgPicture.asset("assets/images/info.svg"),
                    ),
                    message: 'Tölegi şu bank kartlary arkal...',
                    highlightedText: const TextSpan(
                      text: 'Altyn asyr kart (beýleki banklar), Rysgal bank, TDYDB (vnesh)(bank, Senagat bank',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextButton(
                    text: 'Kömek gerekmi?',
                    onPressed: () {
                      print('Kömek gerekmi? butonuna tıklandı!');
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomPaymentButton(
                    amountController: amountController,
                    onPressed: () {
                      setState(() {
                        _isDropdownValid = selectedCard.state != null;
                      });

                      if (formKey.currentState?.validate() == true && _isDropdownValid) {
                        print('Ödeme işlemi başlatıldı: ${amountController.text} TMT');

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const VerificationScreen()),
                        );
                      } else {
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
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
