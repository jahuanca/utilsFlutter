
import 'package:global_configuration/global_configuration.dart';
import 'package:utils/src/core/strings.dart';

//colors
primaryColor() => GlobalConfiguration().get(primaryColorString);
secondaryColor() => GlobalConfiguration().get(secondaryColorString);
cardColor() => GlobalConfiguration().get(cardColorString);
infoColor() => GlobalConfiguration().get(infoColorString);
dangerColor() => GlobalConfiguration().get(dangerColorString);
primaryTextColor() => GlobalConfiguration().get(primaryTextColorString);
backgroundPageColor() => GlobalConfiguration().get(backgroundPageColorString);

//dimens
borderRadius() => GlobalConfiguration().get(borderRadiusString);
dimensionInput() => GlobalConfiguration().get(dimensionInputString);

//styles
titleTextAppBarStyle() => GlobalConfiguration().get(titleTextAppBarStyleString);