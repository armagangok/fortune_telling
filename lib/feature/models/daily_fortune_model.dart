import '../../core/network/contracts/base_network_model.dart';
import 'base_fortune_model.dart';

class DailyFortuneModel extends BaseNetworkModel implements BaseFortuneModel {
  @override
  String? burc;

  @override
  String? mottosu;

  @override
  String? zaman;

  @override
  String? gezegeni;

  @override
  String? elementi;

  @override
  String? fortune;

  DailyFortuneModel({
    this.burc,
    this.mottosu,
    this.zaman,
    this.gezegeni,
    this.elementi,
    this.fortune,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return DailyFortuneModel(
      burc: json['Burc'],
      zaman: json['Zaman'],
      mottosu: json['Mottosu'],
      gezegeni: json['Gezegeni'],
      elementi: json['Elementi'],
      fortune: json['GunlukYorum'],
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'burc': burc,
  //     'mottosu': mottosu,
  //     'gezegeni': gezegeni,
  //     'elementi': elementi,
  //     'gunlukYorum': gunlukYorum,
  //   };
  // }

  // factory TestModel.fromMap(Map<String, dynamic> map) {
  //   return TestModel(
  //     burc: map['burc'],
  //     mottosu: map['mottosu'],
  //     gezegeni: map['gezegeni'],
  //     elementi: map['elementi'],
  //     gunlukYorum: map['gunlukYorum'],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory TestModel.fromJson(String source) {
  //   return TestModel.fromMap(json.decode(source));
  // }
}
