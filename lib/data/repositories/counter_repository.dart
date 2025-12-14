import '../../services/preferences_service.dart';

class CounterRepository {
  CounterRepository();

  static const String _valueKey = 'counter_value';
  static const String _lastUpdatedKey = 'counter_last_updated';

  Future<int> getValue() async {
    final int? stored = PreferencesService.getInt(_valueKey);
    return stored ?? 0;
  }

  Future<DateTime?> getLastUpdated() async {
    final String? iso = PreferencesService.getString(_lastUpdatedKey);
    if (iso == null) return null;
    return DateTime.tryParse(iso);
  }

  Future<void> save({required int value, required DateTime lastUpdated}) async {
    await PreferencesService.setInt(_valueKey, value);
    await PreferencesService.setString(
      _lastUpdatedKey,
      lastUpdated.toIso8601String(),
    );
  }

  Future<void> clear() async {
    await PreferencesService.setInt(_valueKey, 0);
    await PreferencesService.remove(_lastUpdatedKey);
  }
}
