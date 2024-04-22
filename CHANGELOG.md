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
