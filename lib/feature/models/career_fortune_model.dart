import 'base_fortune_feature_model.dart';

class CareerFortuneModel extends BaseFortuneFeatureModel {
  String? burc;

  String? ozellik;

  String? baslik;

  String? yorum;

  String? unluler;

  CareerFortuneModel(
      {this.burc, this.ozellik, this.baslik, this.yorum, this.unluler});

  @override
  fromJson(Map<String, dynamic> json) {
    return CareerFortuneModel(
      burc: json['Burc'],
      ozellik: json['Ozellik'],
      baslik: json['Baslik'],
      yorum: json['Yorum'],
      unluler: json['Unluler'],
    );
  }

   /*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Burc'] = burc;
    data['Ozellik'] = ozellik;
    data['Baslik'] = baslik;
    data['Yorum'] = yorum;
    data['Unluler'] = unluler;
    return data;
  } */

  /* CareerFortuneModel.fromJson(Map<String, dynamic> json) {
    burc = json['Burc'];
    ozellik = json['Ozellik'];
    baslik = json['Baslik'];
    yorum = json['Yorum'];
    unluler = json['Unluler'];
  } */
}
