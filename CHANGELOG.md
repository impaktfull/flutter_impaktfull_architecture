# 0.23.1

## Fix

- Exported `Country` enum

# 0.23.0

## Feat

- Added `Country` enum with phone code and country code
- Added `CountryLocalizations` to localize countries

# 0.22.1

## Fix

- Removed library declaration (analyzer issue)

# 0.22.0

## Feat

- Added github deploy key support in github actions

## Fix

- Updated dependencies

# 0.21.0

## Feat

- Allow snacky 0.0.1 to 1.0.0

# 0.19.0 - 0.20.0 - 0.20.1

## Feat

- Added UserAgentUtil to get the user agent

# 0.18.0 - 0.18.1

## Feat

- Added KeychainCleanupUtil to cleanup the keychain

# 0.16.1 - 0.17.0

## Feat

- Added `PlatformUtil` to get the current platform

# 0.16.0

## BREAKING

- Added `isEnabled` to ImpaktfullAnalyticsUtil and ImpaktfullCrashReportingUtil

# 0.15.0 - 0.15.1

## BREAKING

- Simplified ImpaktfullAnalyticsUtil and ImpaktfullCrashReportingUtil

# 0.14.0

## BREAKING

- Remove `enabled` from the init function of ImpaktfullAnalyticsUtil and ImpaktfullCrashReportingUtil

# 0.13.0

## BREAKING

- Added logUnhandledError to ImpaktfullCrashReportingUtil

# 0.12.0

## Feat

- Added ImpaktfullAnalyticsUtil and ImpaktfullCrashReportingUtil
- Added MultiInstanceAnalyticsUtil and MultiInstanceCrashReportingUtil

# 0.11.0

## Feat

- DateFormatterUtil now supports locales

# 0.10.0

## Feat

- Added AppSettings to open the app settings

# 0.9.0

## Feat

- Added ColorExtension to have a non deprecated withOpacityPercentage to replace withOpacity

# 0.8.1

## Fix

- License update to 2025

# 0.8.0

## Feat

- Added better support for installing an update with the ImpaktfullVersionCheckRepository

# 0.7.1

## Fix

- Exports

# 0.7.0

## Feat

- Added takeAtLeast extension for Future

# 0.6.0

## Feat

- Added url_strategy.dart for web support
- Added flutter_web_plugins as a dependency

# 0.5.3

## Fix

- Security update, requires shared_preferences_android to be 2.3.4.

# 0.5.2

## Fix

- Security update, requires shared_preferences_android to be 2.3.4.

# 0.5.1

## Fix

- Made the MultiListenerStreamController more versatile by adding a streamOrNull, value, valueOrNull and hasValue property

# 0.5.0

## Feat

- Added a MultiListenerStreamController that is a simplified version of the BehaviorSubject from RxDart

# 0.4.0

## Feat

- Added a SimpleProviderWidget that is a simplified version of the ProviderWidget

# 0.3.2

## Feat

- exposed intl package

# 0.3.1

## Fix

- impaktfull dependencies updated

# 0.3.0

## Breaking

- Support for Flutter 3.22.x
- intl updated to 0.19.0

# 0.2.0

## Breaking

- Renamed VersionCheckResult to ImpaktfullVersionCheckResult
- Renamed VersionRequirements to ImpaktfullVersionRequirements
- Renamed VersionCheckService to ImpaktfullVersionCheckService
- Renamed NoopVersionCheckService to ImpaktfullNoopVersionCheckService
- Renamed VersionCheckRepository to ImpaktfullVersionCheckRepository
- Renamed RemoteConfigRepository to ImpaktfullRemoteConfigRepository
- connectivity_plus fixed breaking changes `ConnectivityResult` -> `List<ConnectivityResult>`

## Update

- Version bump all package to support iOS Privacy Manifest.

## Feat

- ImpaktfullVersionCheckRepo now has a `hasRequiredUpdateAvailable` method
- ImpaktfullVersionCheckRepo now has a `hasUpdateAvailable` method

# 0.1.1

## Fix

- RemoteConfigRepository bug with setting the actual remote config

# 0.1.0

## Feat

- VersionCheckRepository & service & models
- RemoteConfigRepository & models

## Fix

- Dependency issues where certain dependencies were not registred in getIt

# 0.0.11

## Fix

- ImpaktfullLogger fix logging priority bug
- ImpaktfullLogger fix log to listeners (always and let the listener decide if it should log or not)

# 0.0.10

## Update

- impaktfull_ui to 0.2.0

# 0.0.9

## Update

- Updated readme with disclaimer everything under <1.0.0 should not be used unless you want to test it

# 0.0.8

## Breaking

- `builderLocalizations` -> `builderLocalization` in ThemeLocalizer
- SimpleLocalizedError becomes SimpelLocalizedMesasgeError

## Feat

- SimpleLocalizedError is a new error that does not require any parameters
- DownUpPageRoute added
- CombiningSmartInterceptor added for dio
- ImpaktfullLogger added (possible to attach another logger to the global ImpaktfullLogger, so it can be used as a facade for multiple loggers)
- BaseProviderWidget possible to use `value` instead of `create` for singleton dependencies
-

# 0.0.7

## Fix

- Text style medium instead of w600

## Removed

- StatusBar because it is added in `impaktfull_ui`

# 0.0.6

## Fix

- Added pub.dev badge

# 0.0.5

## Fix

- Added `impaktfull_ui` as a dependency

# 0.0.4

## Fix

- SimpleLocalizedError toString

# 0.0.3

# Feat

- SimpleLocalizedError

# 0.0.2

# Feat

- Added GitHub Actions for CI/CD

# 0.0.1

- Initial release
