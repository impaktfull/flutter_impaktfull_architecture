import 'package:flutter/widgets.dart';

late Theme Function<Theme>(BuildContext context) themeLookup;
late Localization Function<Localization>(BuildContext context)
    localizationLookup;

class ThemeLocalizer<Theme, Localization> extends StatelessWidget {
  final Widget Function(BuildContext context, Theme theme)? builderTheme;
  final Widget Function(BuildContext context, Localization localization)?
      builderLocalizations;
  final Widget Function(
      BuildContext context, Theme theme, Localization localization)? builder;

  const ThemeLocalizer({
    this.builder,
    this.builderTheme,
    this.builderLocalizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (builder != null) {
      return builder!(
          context, themeLookup(context), localizationLookup(context));
    } else if (builderTheme != null) {
      return builderTheme!(context, themeLookup(context));
    } else if (builderLocalizations != null) {
      return builderLocalizations!(context, localizationLookup(context));
    }
    throw ArgumentError(
        'builder, builderTheme or builderLocalizations should be passed');
  }
}
