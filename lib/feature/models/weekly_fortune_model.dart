import 'package:fortune_telling/core/network/contracts/base_network_model.dart';

import 'base_fortune_model.dart';

class WeeklyFortuneModel extends BaseNetworkModel implements BaseFortuneModel {
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

  WeeklyFortuneModel({
    this.burc,
    this.elementi,
    this.zaman,
    this.fortune,
    this.gezegeni,
    this.mottosu,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return WeeklyFortuneModel(
      burc: json['Burc'],
      zaman: json['zaman'] ?? "",
      mottosu: json['Mottosu'],
      gezegeni: json['Gezegeni'],
      elementi: json['Elementi'],
      fortune: json['GunlukYorum'],
    );
  }
}
