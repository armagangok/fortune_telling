import '../../core/network/contracts/base_network_model.dart';
import 'base_fortune_model.dart';

class YearlyFortuneModel extends BaseNetworkModel implements BaseFortuneModel {
  @override
  String? burc;

  @override
  String? zaman;

  @override
  String? elementi;

  @override
  String? fortune;

  @override
  String? gezegeni;

  @override
  String? mottosu;

  YearlyFortuneModel({
    this.burc,
    this.zaman,
    this.elementi,
    this.fortune,
    this.gezegeni,
    this.mottosu,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return YearlyFortuneModel(
      burc: json['Burc'],
      zaman: json['Zaman'] ?? "",
      mottosu: json['Mottosu'],
      gezegeni: json['Gezegeni'],
      elementi: json['Elementi'],
      fortune: json['Yorum'],
    );
  }
}
