import 'package:hive/hive.dart';
import 'package:toleg/data/models.dart';

class CardInfoRepo {
  String favoriteNotes = 'card_info';

  final _hive = Hive.box<CardInfo>('card_info');

  List<CardInfo>? getCardInfoList() {
    return _hive.values.toList();
  }

  List<CardInfo> addCardInfoList(CardInfo notes) {
    _hive.add(notes);
    return _hive.values.toList();
  }

  List<CardInfo> removeCardInfoList(String id) {
    _hive.deleteAt(
      _hive.values.toList().indexWhere((element) => element.id == id),
    );

    return _hive.values.toList();
  }

  List<CardInfo> updateCardInfoList(int index, CardInfo notes) {
    _hive.putAt(index, notes);
    return _hive.values.toList();
  }

  void deleteAll() {
    _hive.clear();
  }
}
