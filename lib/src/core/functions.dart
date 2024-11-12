import 'package:collection/collection.dart';

Map<String, List<dynamic>> groupListBy(List<dynamic> listAsMap, String key){
  return groupBy(listAsMap, (obj) => obj[key]);
}
