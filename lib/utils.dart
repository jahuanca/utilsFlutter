library;
export 'src/data/data_config.dart';
export 'src/data/data_functions.dart';
export 'src/core/button_type.dart';
export 'src/core/storage_type.dart';
export 'src/core/validators.dart';
export 'src/core/type_snackbar.dart';
export 'src/core/ids_get.dart';
export 'src/core/extensions.dart';
export 'src/core/functions.dart';

export 'src/ui/widgets/inputs/input_widget.dart';
export 'src/ui/widgets/inputs/password_input_widget.dart';
export 'src/ui/widgets/check_box/check_box_widget.dart';
export 'src/ui/widgets/buttons/button_widget.dart';
export 'src/ui/widgets/icons/icon_widget.dart';
export 'src/ui/widgets/buttons/icon_button_widget.dart';
export 'src/ui/widgets/app_bar/app_bar_widget.dart';
export 'src/ui/widgets/images/image_action_widget.dart';
export 'src/ui/widgets/items_list/item_list_image_data_widget.dart';
export 'src/ui/widgets/tags/tag_widget.dart';
export 'src/ui/widgets/loading/loading_widget.dart';
export 'src/ui/utils/paddings.dart';

export 'src/ui/widgets/bottom_navigation/bottom_navigation_bar_widget.dart' ;
export 'src/ui/widgets/bottom_navigation/bottom_navigation_item_widget.dart';

export 'src/ui/widgets/dialogs/show_dialog_widget.dart';
export 'src/ui/widgets/dialogs/show_alert_widget.dart';
export 'src/ui/widgets/snackbar/show_snackbar_widget.dart';
//sharedPreferences
export 'src/data/user_preferences.dart';
//http
export 'src/data/app_http_manager.dart';
export 'src/data/app_response_http.dart';
export 'src/data/result_type.dart';


import 'package:global_configuration/global_configuration.dart';
import 'package:utils/src/data/data_config.dart';


void loadConfig(DataConfig data) => GlobalConfiguration().loadFromMap(data.toJson());

// TODO: Export any libraries intended for clients of this package.