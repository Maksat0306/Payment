import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sazlamalar"),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {},
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            buildCustomListTile("Siziň belgiňiz:", "+993 65 855873"),
            buildCustomListTile("Aktiw tarif plany:", "Sowgat 1000+"),
            buildCustomListTile("Dil", "Türkmen", hasNavigation: true),
            buildCustomListTile("Habarlasmak", "", hasNavigation: true),
            buildCustomListTile("Açar söz goý", "", hasNavigation: true),
            buildCustomListTile("Täze wersiýany ýükle (2,24 MB)", "", hasNavigation: true),
            buildThemeSwitch(),
            buildContactTile("+993 65 55 66 99"),
          ],
        ),
      ),
    );
  }

  Widget buildCustomListTile(String title, String subtitle, {bool hasNavigation = false}) {
    return Container(
      color: Colors.black45, // Arka plan rengi
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // İç boşluk ayarı
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Elemanları uçlara yasla
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Metinleri sola yasla
              children: [
                Text(title, style: TextStyle(color: Colors.white, fontSize: 16)), // Başlık metni
                SizedBox(height: 4), // Metinler arası boşluk
                Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 14)), // Alt başlık metni
              ],
            ),
          ),
          if (hasNavigation) // Yönlendirme ikonu varsa göster
            Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }


  Widget buildThemeSwitch() {
    return ListTile(
      title: Text('Theme', style: TextStyle(color: Colors.white)),
      tileColor: Colors.black45,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Light', style: TextStyle(color: Colors.white)),
          Switch(value: true, onChanged: (val) {}),
          Text('Dark', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget buildContactTile(String number) {
    return ListTile(
      tileColor: Colors.brown,
      title: Text('Ähli soraglar üçin jaň ediň:', style: TextStyle(color: Colors.white)),
      subtitle: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.phone, color: Colors.white),
            Text(number, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
