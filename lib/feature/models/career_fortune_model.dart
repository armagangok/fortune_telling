import 'package:fortune_telling/core/network/contracts/base_network_model.dart';

class CareerFortuneModel extends BaseNetworkModel {
  String? burc;
  String? ozellik;
  String? baslik;
  String? yorum;
  String? unluler;

  CareerFortuneModel(
      {this.burc, this.ozellik, this.baslik, this.yorum, this.unluler});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Burc'] = this.burc;
    data['Ozellik'] = this.ozellik;
    data['Baslik'] = this.baslik;
    data['Yorum'] = this.yorum;
    data['Unluler'] = this.unluler;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return CareerFortuneModel(
      burc: json['Burc'],
      ozellik: json['Ozellik'] ?? "",
      baslik: json['Baslik'],
      yorum: json['Yorum'],
      unluler: json['Unluler'],
    );
  }

  /* CareerFortuneModel.fromJson(Map<String, dynamic> json) {
    burc = json['Burc'];
    ozellik = json['Ozellik'];
    baslik = json['Baslik'];
    yorum = json['Yorum'];
    unluler = json['Unluler'];
  } */
}
