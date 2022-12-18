import 'package:fortune_telling/data/entitity/fortune_entity.dart';

import '../../core/network/contracts/base_network_model.dart';

class FortuneModel extends BaseNetworkModel implements FortuneEntity {
  @override
  String? baslik;

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

  @override
  String? ozellik;

  @override
  String? unluler;

  @override
  String? yorum;

  @override
  String? zaman;

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
