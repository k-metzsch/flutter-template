import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/counter_repository.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit({required CounterRepository repository})
    : _repository = repository,
      super(const CounterState());

  final CounterRepository _repository;

  Future<void> start() async {
    emit(state.copyWith(status: CounterStatus.loading));
    try {
      final int value = await _repository.getValue();
      final DateTime? lastUpdated = await _repository.getLastUpdated();
      emit(
        state.copyWith(
          status: CounterStatus.success,
          value: value,
          lastUpdated: lastUpdated,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: CounterStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> increment() async {
    final int newValue = state.value + 1;
    final DateTime now = DateTime.now();

    emit(state.copyWith(value: newValue, lastUpdated: now));
    try {
      await _repository.save(value: newValue, lastUpdated: now);
    } catch (_) {
      // Optionally handle persistence failure (revert / emit error)
    }
  }

  Future<void> decrement() async {
    final int newValue = state.value - 1;
    final DateTime now = DateTime.now();

    emit(state.copyWith(value: newValue, lastUpdated: now));
    try {
      await _repository.save(value: newValue, lastUpdated: now);
    } catch (_) {
      // Optionally handle persistence failure
    }
  }

  Future<void> reset() async {
    emit(state.copyWith(value: 0));
    await _repository.clear();
  }
}
