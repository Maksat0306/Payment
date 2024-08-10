import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SevicesValue {
  tmcell,
  telecom,
  astu,
  astuTelefon,
  iptv,
  beletFilim;

  String get asValue {
    switch (this) {
      case SevicesValue.tmcell:
        return 'TMCell';
      case SevicesValue.telecom:
        return 'Telekom Internet';
      case SevicesValue.astu:
        return 'AŞTU Internet';
      case SevicesValue.astuTelefon:
        return "AŞTU Telefon";
      case SevicesValue.iptv:
        return "IP TV";
      case SevicesValue.beletFilim:
        return "Belet Film";
    }
  }

  Widget get asIcons {
    switch (this) {
      case SevicesValue.tmcell:
        return SvgPicture.asset("assets/images/TMCell.svg");
      case SevicesValue.telecom:
        return SvgPicture.asset("assets/images/Telekom Internet.svg");
      case SevicesValue.astu:
        return SvgPicture.asset("assets/images/AŞTU Internet.svg");
      case SevicesValue.astuTelefon:
        return SvgPicture.asset("assets/images/AŞTU Telefon.svg");
      case SevicesValue.iptv:
        return SvgPicture.asset("assets/images/IP TV.svg");
      case SevicesValue.beletFilim:
        return SvgPicture.asset("assets/images/Belet Film.svg");
    }
  }
}
