class ImpaktfullVersionRequirements {
  final ImpaktfullVersionRequirement latest;
  final ImpaktfullVersionRequirement? min;

  ImpaktfullVersionRequirements({
    required this.latest,
    this.min,
  });
}

class ImpaktfullVersionRequirement {
  final int buildNumber;
  final String? updateUrl;
  final String? versionNumber;

  ImpaktfullVersionRequirement({
    required this.buildNumber,
    this.updateUrl,
    this.versionNumber,
  });
}
