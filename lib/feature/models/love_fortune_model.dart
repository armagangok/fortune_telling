import 'package:fortune_telling/core/network/contracts/base_network_model.dart';

class LoveFortuneModel extends BaseNetworkModel {
  String? burc;
  String? ozellik;
  String? baslik;
  String? yorum;
  String? unluler;

  LoveFortuneModel(
      {this.burc, this.ozellik, this.baslik, this.yorum, this.unluler});

  @override
  fromJson(Map<String, dynamic> json) {
    return LoveFortuneModel(
      burc: json['Burc'],
      ozellik: json['Ozellik'] ?? "",
      baslik: json['Baslik'],
      yorum: json['Yorum'],
      unluler: json['Unluler'],
    );
  }

  /* LoveFortuneModel.fromJson(Map<String, dynamic> json) {
    burc = json['Burc'];
    ozellik = json['Ozellik'];
    baslik = json['Baslik'];
    yorum = json['Yorum'];
    unluler = json['Unluler'];
  } */

  /*
    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Burc'] = this.burc;
    data['Ozellik'] = this.ozellik;
    data['Baslik'] = this.baslik;
    data['Yorum'] = this.yorum;
    data['Unluler'] = this.unluler;
    return data;
  }*/
}
