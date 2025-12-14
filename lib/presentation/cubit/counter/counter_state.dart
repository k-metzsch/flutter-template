import 'package:equatable/equatable.dart';

enum CounterStatus { initial, loading, success, failure }

final class CounterState extends Equatable {
  const CounterState({
    this.status = CounterStatus.initial,
    this.value = 0,
    this.lastUpdated,
    this.errorMessage,
  });

  final CounterStatus status;
  final int value;
  final DateTime? lastUpdated;
  final String? errorMessage;

  int get count => value;

  CounterState copyWith({
    CounterStatus? status,
    int? value,
    DateTime? lastUpdated,
    String? errorMessage,
  }) {
    return CounterState(
      status: status ?? this.status,
      value: value ?? this.value,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    status,
    value,
    lastUpdated,
    errorMessage,
  ];
}
