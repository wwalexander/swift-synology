public enum DSDownloadStationTaskPriority: String, Decodable {
    case low
    case normal
    case high
}

extension DSDownloadStationTaskPriority: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.low, .low): false
        case (.low, _): true
        case (.normal, .normal): false
        case (.normal, _): true
        case (.high, _): false
        }
    }
}

extension DSDownloadStationTaskPriority: CustomStringConvertible {
    public var description: String {
        switch self {
        case .low: "Low"
        case .normal: "Normal"
        case .high: "High"
        }
    }
}
