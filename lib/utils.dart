library;

import 'package:global_configuration/global_configuration.dart';
import 'package:utils/src/data/colors_data.dart';
export 'src/data/colors_data.dart';
export 'src/ui/widgets/input_label_widget.dart' show InputLabelWidget;
export 'src/data/colors_data.dart' show ColorsData;
export 'src/data/data.dart';

void loadConfig(ColorsData data) => GlobalConfiguration().loadFromMap(data.toJson());

// TODO: Export any libraries intended for clients of this package.