import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/counter_repository.dart';
import '../../cubit/counter/counter_cubit.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<CounterRepository>(
      create: (BuildContext _) => CounterRepository(),
      child: BlocProvider<CounterCubit>(
        create: (BuildContext ctx) =>
            CounterCubit(repository: ctx.read<CounterRepository>())..start(),
        child: const HomeView(),
      ),
    );
  }
}
