/*
 * Copyright The OpenTelemetry Authors
 * SPDX-License-Identifier: Apache-2.0
 */

import Foundation

/// Holds information about the instrumentation library specified when creating an instance of
/// TracerSdk using TracerProviderSdk.
public struct InstrumentationLibraryInfo: Hashable, Codable {
    public private(set) var name: String = ""
    public private(set) var version: String?

    ///  Creates a new empty instance of InstrumentationLibraryInfo.
    public init() {
    }

    ///  Creates a new instance of InstrumentationLibraryInfo.
    ///  - Parameters:
    ///    - name: name of the instrumentation library
    ///    - version: version of the instrumentation library (e.g., "semver:1.0.0"), might be nil
    public init(name: String, version: String? = nil) {
        self.name = name
        self.version = version
    }
}
