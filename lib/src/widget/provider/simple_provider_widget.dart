import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleProviderWidget<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    T viewModel,
  ) builder;
  final T Function()? create;
  final T? value;

  const SimpleProviderWidget({
    required T Function() this.create,
    required this.builder,
    super.key,
  }) : value = null;

  const SimpleProviderWidget.value({
    required this.value,
    required this.builder,
    super.key,
  }) : create = null;

  @override
  Widget build(BuildContext context) {
    final child = Consumer<T>(
      builder: (context, viewModel, child) => builder.call(context, viewModel),
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
