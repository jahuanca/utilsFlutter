import 'package:utils/src/core/constants.dart';
import 'package:utils/src/core/default_extensions.dart';
import 'package:utils/src/data/enum_auth.dart';

class NetworkConfig {
  bool showLog;
  String? urlServer;
  String basicAuthUsername;
  String basicAuthPassword;
  EnumAuth authentication;
  int? valueOfTimeOut;

  NetworkConfig({
    this.showLog = true,
    this.urlServer,
    this.basicAuthUsername = emptyString,
    this.basicAuthPassword = emptyString,
    this.authentication = EnumAuth.none,
    this.valueOfTimeOut = defaultTimeOut,
  });

  factory NetworkConfig.fromJson(Map<String, dynamic> json) => NetworkConfig(
        showLog: json["showLog"],
        urlServer: json["urlServer"],
        basicAuthUsername: json["basicAuthUsername"],
        basicAuthPassword: json["basicAuthPassword"],
        authentication: json["authentication"],
        valueOfTimeOut: json["valueOfTimeOut"],
      );

  Map<String, dynamic> toJson() => {
        "showLog": showLog,
        "urlServer": urlServer,
        "basicAuthUsername": basicAuthUsername,
        "basicAuthPassword": basicAuthPassword,
        "authentication": authentication,
        'valueOfTimeOut': valueOfTimeOut,
      };
}
