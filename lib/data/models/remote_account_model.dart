import 'package:ForDev/data/http/http.dart';
import 'package:ForDev/domain/entities/account_entity.dart';

class RemoteAccountModel {
  final String accessToken;

  RemoteAccountModel(this.accessToken);

  factory RemoteAccountModel.fromJson(Map json) {
    if(!json.containsKey('accessToken')) {
      throw HttpError.invalidData;
    }

    return RemoteAccountModel(json['accessToken']);
  }
    

  AccountEntity toEntity() => AccountEntity(accessToken);
}