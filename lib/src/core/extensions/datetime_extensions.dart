
import 'package:utils/src/core/default_extensions.dart';

extension CalculateTime on DateTime? {
  DateTime lastDateOfTheWeek() => firstDateOfTheWeek()
    .add(const Duration(days: DateTime.daysPerWeek - 1));

  DateTime firstDateOfTheWeek() => orNow()
    .subtract(Duration(days: orNow().weekday - 1));

}
