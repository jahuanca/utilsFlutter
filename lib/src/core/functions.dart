import 'package:flutter/services.dart';

Map<T, List<S>> groupBy<S, T>(
    {required Iterable<S> values, required T Function(S) functionKey}) {
  Map<T, List<S>> map = <T, List<S>>{};
  for (S element in values) {
    (map[functionKey(element)] ??= []).add(element);
  }
  return map;
}

Future<void> copyToClipboard(String data) => Clipboard.setData(
  ClipboardData(text: data)
);
