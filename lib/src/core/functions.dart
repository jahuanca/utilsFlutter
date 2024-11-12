
Map<T, List<S>> groupBy<S, T>(
  {
    required Iterable<S> values, 
    required T Function(S) key
  }) {
  Map<T, List<S>> map = <T, List<S>>{};
  for (S element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
}