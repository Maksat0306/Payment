import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum OtherServicesValue {
  tut,
  jayJemagat,
  suw;

  String get asValue {
    switch (this) {
      case OtherServicesValue.tut:
        return 'Tut suw\n19L';
      case OtherServicesValue.jayJemagat:
        return 'Jemagat\ntölegleri';
      case OtherServicesValue.suw:
        return 'Suw\ntölegi';
    }
  }

  Widget get asIcons {
    switch (this) {
      case OtherServicesValue.tut:
        return Image.asset("assets/images/tut.png");
      case OtherServicesValue.jayJemagat:
        return SvgPicture.asset("assets/images/Jemagat Tölegleri.svg");
      case OtherServicesValue.suw:
        return SvgPicture.asset("assets/images/suw.svg");
    }
  }
}
