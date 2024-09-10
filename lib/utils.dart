library;

import 'package:global_configuration/global_configuration.dart';
import 'package:utils/src/data/data_config.dart';
export 'src/data/data_config.dart';
export 'src/ui/widgets/input_label_widget.dart';
export 'src/ui/widgets//input_login_widget.dart';
export 'src/data/data_config.dart' show DataConfig;
export 'src/data/data_functions.dart';

void loadConfig(DataConfig data) => GlobalConfiguration().loadFromMap(data.toJson());

// TODO: Export any libraries intended for clients of this package.