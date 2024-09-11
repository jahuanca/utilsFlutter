library;
export 'src/data/data_config.dart';
export 'src/data/data_functions.dart';
export 'src/core/button_type.dart';

export 'src/ui/widgets/inputs/input_widget.dart';
export 'src/ui/widgets/buttons/button_widget.dart';
export 'src/ui/widgets/app_bar/app_bar_widget.dart';
export 'src/ui/widgets/images/image_action_widget.dart';


import 'package:global_configuration/global_configuration.dart';
import 'package:utils/src/data/data_config.dart';

void loadConfig(DataConfig data) => GlobalConfiguration().loadFromMap(data.toJson());

// TODO: Export any libraries intended for clients of this package.