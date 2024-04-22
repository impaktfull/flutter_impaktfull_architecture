class VersionRequirements {
  final VersionRequirement latest;
  final VersionRequirement? min;

  VersionRequirements({
    required this.latest,
    this.min,
  });
}

class VersionRequirement {
  final int buildNumber;
  final String? updateUrl;
  final String? versionNumber;

  VersionRequirement({
    required this.buildNumber,
    this.updateUrl,
    this.versionNumber,
  });
}
