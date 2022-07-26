import '../../core/network/contracts/base_network_model.dart';
import 'base_fortune_model.dart';

class MonthlyFortuneModel extends BaseNetworkModel implements BaseFortuneModel {
  @override
  String? burc;

  @override
  String? zaman;

  @override
  String? elementi;

  @override
  String? gezegeni;

  @override
  String? mottosu;

  @override
  String? fortune;

  MonthlyFortuneModel({
    this.burc,
    this.zaman,
    this.elementi,
    this.gezegeni,
    this.mottosu,
    this.fortune,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return MonthlyFortuneModel(
      burc: json['Burc'],
      zaman: json['zaman'] ?? "",
      mottosu: json['Mottosu'],
      gezegeni: json['Gezegeni'],
      elementi: json['Elementi'],
      fortune: json['AylikYorum'],
    );
  }
}
