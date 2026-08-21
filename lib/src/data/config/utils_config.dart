
import 'package:utils/src/data/config/data_config.dart';

class UtilConfig {
  static DataConfig _config = DataConfig();

  static void configure(DataConfig config) {
    _config = config;
  }

}

DataConfig get config  => UtilConfig._config;