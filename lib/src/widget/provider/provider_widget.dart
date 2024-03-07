import 'package:flutter/material.dart';
import 'package:impaktfull_architecture/src/widget/theme/theme_localizer.dart';
import 'package:provider/provider.dart';

class BaseProviderWidget<T extends ChangeNotifier, Theme, Localization>
    extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    T viewModel,
  )? builder;
  final Widget Function(
    BuildContext context,
    T viewModel,
    Theme theme,
    Localization localization,
  )? builderWithThemeAndLocalizations;
  final T Function()? create;
  final T? value;

  const BaseProviderWidget({
    required T Function() this.create,
    this.builder,
    this.builderWithThemeAndLocalizations,
    super.key,
  }) : value = null;

  const BaseProviderWidget.value({
    required this.value,
    this.builder,
    this.builderWithThemeAndLocalizations,
    super.key,
  }) : create = null;

  @override
  Widget build(BuildContext context) {
    final child = Consumer<T>(
      builder: (context, viewModel, child) {
        if (builder != null) {
          return builder!.call(
            context,
            viewModel,
          );
        } else if (builderWithThemeAndLocalizations != null) {
          return builderWithThemeAndLocalizations!(
            context,
            viewModel,
            themeLookup(context),
            localizationLookup(context),
          );
        }
        throw ArgumentError(
            'builder and builderWithThemeAndLocalizations are null');
      },
    );
    if (value != null) {
      return ChangeNotifierProvider<T>.value(
        value: value!,
        child: child,
      );
    }
    return ChangeNotifierProvider<T>(
      create: (context) => create!(),
      child: child,
    );
  }
}
