
import 'package:utils/src/core/default_extensions.dart';

extension CalculateTime on DateTime? {
  DateTime lastDateOfTheWeek() {
    
    return firstDateOfTheWeek()
      .finalOfDay()
      .add(const Duration(days: DateTime.daysPerWeek - 1));
  }

  DateTime firstDateOfTheWeek() {
    DateTime dateTime = orNow().initialOfDay();
    return dateTime.subtract(Duration(days: orNow().weekday - 1));
  }

  DateTime initialOfDay() {
    DateTime dateTime = orNow();
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0);
  }

  DateTime finalOfDay(){
    DateTime dateTime = orNow();
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59);
  }

}
