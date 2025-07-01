import 'package:impaktfull_architecture/src/model/data/country/country.dart';
import 'package:impaktfull_architecture/src/model/data/country/localizations/country_localizations_values.dart';
import 'package:impaktfull_architecture/src/model/data/country/localizations/country_localizations_values_en.dart';
import 'package:impaktfull_architecture/src/model/data/country/localizations/country_localizations_values_fr.dart';
import 'package:impaktfull_architecture/src/model/data/country/localizations/country_localizations_values_nl.dart';

class CountryLocalizations {
  final List<CountryLocalizationValues> values = [
    CountryLocalizationValuesNl(),
    CountryLocalizationValuesFr(),
    CountryLocalizationValuesEn(),
  ];

  String localize(Country country, String languageCode) {
    final values =
        this.values.where((value) => value.languageCode == languageCode);
    if (values.isEmpty) {
      return country.name;
    }
    return values.first.localize(country);
  }
}
