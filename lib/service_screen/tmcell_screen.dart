import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/svg.dart";
import "../../constants/colors.dart";
import "../components/custom_alert_message.dart";
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final amountController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          color: AppColors.darkCard,
          padding: const EdgeInsets.all(16), // İçerikten önce eklenen padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // Column'un sadece içeriği kadar yer kaplamasını sağlar
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
              SizedBox(height: 24), // Metin ile Dropdown arasında boşluk
              CustomDropdown(),
              SizedBox(height: 24),
              FieldText(
                hintText: 'Telefon belgisi',
                suffixIcon: SvgPicture.asset("assets/images/users.svg"),
                keyboardType: TextInputType.phone, // Telefon klavyesini açar
                onSuffixIconPressed: () {
                  // Rehber açma kodu buraya gelecek
                  print('Rehber açıldı');
                },
              ),
              SizedBox(height: 24),
              FieldText(
                hintText: 'Mukdar',
                keyboardType: TextInputType.number, // Sadece numara klavyesi açılır
              ),
              SizedBox(height: 24),
              CustomAlertMessage(
                message: 'Tölegi şu bank kartlary arkal...',
                highlightedText: TextSpan(
                  text: 'Altyn asyr kart (beýleki banklar), Rysgal bank, TDYDB (vnesh) bank, Senagat bank',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Kalın metin
                    color: Colors.white, // Beyaz renk
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _requestPermissions() async {
    await Permission.contacts.request();
  }

  Future<void> _launchContacts() async {
    try {
      PermissionStatus permissionStatus = await Permission.contacts.status;
      if (permissionStatus.isGranted) {
        Iterable<Contact> contacts = await ContactsService.getContacts();
        // Rehberdeki kişilerle ne yapacağınızı burada belirleyin
        print(contacts);
      } else {
        await _requestPermissions();
      }
    } catch (e) {
      print("Rehbere erişim hatası: $e");
    }
  }
}