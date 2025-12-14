import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../resources/app_config.dart';
import '../../../router/app_router.dart';
import '../../../services/rating_service.dart';
import '../../cubit/counter/counter_cubit.dart';
import '../../cubit/counter/counter_state.dart';
import '../../design/token/app_spacing.dart';
import '../../widgets/counter_display.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await RatingService.requestReview();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text(AppConfig.appName),
        trailingActions: <Widget>[
          PlatformIconButton(
            onPressed: () => context.push(AppRouter.settings),
            icon: Icon(context.platformIcons.settings),
          ),
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (BuildContext context, CounterState state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CounterDisplay(),
                const SizedBox(height: AppSpacing.lg),
                _buildActionButtons(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PlatformIconButton(
          onPressed: () => _onDecrement(context),
          icon: Icon(context.platformIcons.remove),
        ),
        const SizedBox(width: AppSpacing.md),
        PlatformIconButton(
          onPressed: () => _onReset(context),
          icon: Icon(context.platformIcons.refresh),
        ),
        const SizedBox(width: AppSpacing.md),
        PlatformIconButton(
          onPressed: () => _onIncrement(context),
          icon: Icon(context.platformIcons.add),
        ),
      ],
    );
  }

  void _onIncrement(BuildContext context) {
    context.read<CounterCubit>().increment();
    HapticFeedback.lightImpact();
  }

  void _onDecrement(BuildContext context) {
    context.read<CounterCubit>().decrement();
    HapticFeedback.lightImpact();
  }

  void _onReset(BuildContext context) {
    context.read<CounterCubit>().reset();
    HapticFeedback.lightImpact();
  }
}
