# 2024-12-09 -- v13.0.0
- Raised the minimum supported version of Xcode to 16.0.0.
# 2024-09-25 -- v12.0.0
- Raised the minimum supported version of Xcode to 15.3.0.
- Upgraded the version range of GoogleUtilities/UserDefaults dependency in
  MLKitCommon from ">= 7.13.0, < 8.0" to "~> 8.0".
- Upgraded the version range of GoogleDataTransport dependency in MLKitCommon
  from ">= 9.4.1, < 10.0" to "~> 10.0".
# 2024-04-16 -- v11.0.0
- Updated privacy manifest.
- Upgraded the version range of GoogleToolboxForMac dependency in
  MLKitCommon from "~>2.1" to ">= 4.2.1, < 5.0" to pull in the latest privacy manifest for it.
- Upgraded the version range of GTMSessionFetcher/Core dependency in
  MLKitCommon from ">= 1.1, < 4.0" to ">= 3.3.2, < 4.0"," to pull in the latest privacy manifest for it.
- Upgraded the version range of GoogleDataTransport dependency in
  MLKitCommon from "~>9.0" to ">= 9.4.1, < 10.0" to pull in the latest privacy manifest for it.
- Upgraded the version range of GoogleUtilities/UserDefaults dependency in
  MLKitCommon from "~> 7.0" to ">= 7.13.0, < 8.0" to pull in the latest privacy manifest for it.
# 2024-02-20 -- v10.0.0
- Raised the minimum supported version of Xcode to 15.1.0.
- Added privacy manifest.
- Raised the minimum supported version of iOS from 11.0 to 12.0.
# 2023-03-21 -- v9.0.0
- Raised the minimum supported version of Xcode to 14.2.0.
- Removed support for bitcode.
- Raised the minimum supported version of iOS from 10.0 to 11.0.
- Upgraded the version range of GTMSessionFetcher/Core dependency in
  MLKitCommon from "~> 1.1" to ">= 1.1, < 3.0" to support Firebase 10.
- Fixed compatibility with Firebase.
# 2022-08-09 -- v8.0.0
- Bug fixes.
# 2022-06-28 -- v7.0.0
- Bug fixes.
# 2022-04-26 -- v6.0.0
- Raised the minimum supported version of Xcode to 13.2.1.
# 2021-12-14 -- v5.0.0
- Bug fixes.
# 2021-09-28 -- v4.0.0
- Fixed a bitcode recompilation issue during ipa generation.
- Raised the minimum supported version of Xcode to 12.5.1.
# 2021-08-11 -- v3.1.0
- Bug fixes.
# 2021-06-29 -- v3.0.0
- Raised the minimum supported version of Xcode to 12.4.
- Upgraded the version range of GoogleDataTransport dependency in MLKitCommon
  from 8.x to 9.x.
# 2021-03-02 -- v2.1.0
- Raised the minimum supported version of Xcode to 12.2.
# 2021-01-26 -- v2.0.0
- Bug fixes.
# 2020-12-08 -- v1.0.0
- First release graduated out of Beta.
- Added `RemoteModelSource` and `CustomRemoteModel` classes to support remote
  custom models.
- Added `manifestPath` property and `init(manifestPath:)` method to the
  `LocalModel` class to support initializing a local custom model trained by
  AutoML Vision Edge.
# 2020-10-29 -- v0.64.2
- Upgraded the version range of GoogleUtilities dependency in MLKitCommon from
  6.x to 7.x.
# 2020-10-26 -- v0.64.1
- Upgraded the version range of GoogleDataTransport dependency in MLKitCommon
  from 7.x to 8.x.
# 2020-09-29 -- v0.64.0
- Bug fixes.
# 2020-08-25 -- v0.63.0
- Bug fixes.
# 2020-07-28 -- v0.62.0
- Bug fixes.
# 2020-07-15 -- v0.61.1
- Upgraded the version range of GoogleDataTransport dependency in MLKitCommon
  from 3.2 or higher to 7.x.
- Removed the GoogleDataTransportCCTSupport dependency from MLKitCommon.
# 2020-06-30 -- v0.61.0
- Bug fixes.
# 2020-06 -- v0.60.0
- Initial release of the standalone ML Kit.
