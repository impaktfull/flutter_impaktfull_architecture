import 'package:impaktfull_architecture/src/model/data/country/country.dart';

abstract class CountryLocalizationValues {
  String get languageCode;
  String localize(Country country);
}
