import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactPickerScreen extends StatefulWidget {
  @override
  _ContactPickerScreenState createState() => _ContactPickerScreenState();
}

class _ContactPickerScreenState extends State<ContactPickerScreen> {
  Iterable<Contact>? _contacts;
  String? _selectedPhoneNumber;

  @override
  void initState() {
    super.initState();
    _requestPermissionsAndLoadContacts();
  }

  Future<void> _requestPermissionsAndLoadContacts() async {
    PermissionStatus permissionStatus = await Permission.contacts.status;
    if (permissionStatus.isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts;
      });
    } else if (permissionStatus.isDenied) {
      permissionStatus = await Permission.contacts.request();
      if (permissionStatus.isGranted) {
        Iterable<Contact> contacts = await ContactsService.getContacts();
        setState(() {
          _contacts = contacts;
        });
      }
    }
  }

  void _selectContact(Contact contact) {
    if (contact.phones!.isNotEmpty) {
      setState(() {
        _selectedPhoneNumber = contact.phones!.first.value;
      });
      print('Seçilen Telefon Numarası: $_selectedPhoneNumber');
    } else {
      print('Bu kişinin telefon numarası yok.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kişi Seç'),
      ),
      body: _contacts == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, index) {
          Contact contact = _contacts!.elementAt(index);
          return ListTile(
            title: Text(contact.displayName ?? 'İsimsiz'),
            subtitle: Text(contact.phones!.isNotEmpty
                ? contact.phones!.first.value!
                : 'Telefon numarası yok'),
            onTap: () => _selectContact(contact),
          );
        },
      ),
    );
  }
}
