import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/app_localizations.dart';
import '../cubit/counter/counter_cubit.dart';
import '../cubit/counter/counter_state.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (BuildContext context, CounterState state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${AppLocalizations.counter}:  ${state.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (state.status == CounterStatus.loading)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: CircularProgressIndicator.adaptive(),
              ),
            if (state.lastUpdated != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Last: ${state.lastUpdated}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          ],
        );
      },
    );
  }
}
