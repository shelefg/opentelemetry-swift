// Copyright 2020, OpenTelemetry Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import OpenTelemetrySdk

public class InMemoryExporter: SpanExporter {
    private var finishedSpanItems: [SpanData] = []
    private var isRunning: Bool = true

    public init() {}

    public func getFinishedSpanItems() -> [SpanData] {
        return finishedSpanItems
    }

    public func export(spans: [SpanData]) -> SpanExporterResultCode {
        guard isRunning else {
            return .failure
        }

        finishedSpanItems.append(contentsOf: spans)
        return .success
    }

    public func flush() -> SpanExporterResultCode {
        guard isRunning else {
            return .failure
        }

        return .success
    }

    public func reset() {
        finishedSpanItems.removeAll()
    }

    public func shutdown() {
        finishedSpanItems.removeAll()
        isRunning = false
    }
}
