import 'package:fortune_telling/core/models/base_fortune_model.dart';
import 'package:fortune_telling/core/network/contracts/base_network_model.dart';

class WeeklyFortuneModel extends BaseNetworkModel implements BaseFortuneModel {
  @override
  String? burc;

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
    this.fortune,
    this.gezegeni,
    this.mottosu,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return WeeklyFortuneModel(
      burc: json['Burc'],
      mottosu: json['Mottosu'],
      gezegeni: json['Gezegeni'],
      elementi: json['Elementi'],
      fortune: json['GunlukYorum'],
    );
  }
}
