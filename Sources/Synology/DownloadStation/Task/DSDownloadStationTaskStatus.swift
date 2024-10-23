public enum DSDownloadStationTaskStatus: String, Decodable {
    case waiting
    case downloading
    case paused
    case finishing
    case finished
    case hashChecking = "hash_checking"
    case seeding
    case fileHostingWaiting = "filehosting_waiting"
    case extracting
    case error
}

extension DSDownloadStationTaskStatus: CustomStringConvertible {
    public var description: String {
        switch self {
        case .waiting: "Waiting"
        case .downloading: "Downloading"
        case .paused: "Paused"
        case .finishing: "Finishing"
        case .finished: "Finished"
        case .hashChecking: "Checking hash"
        case .seeding: "Seeding"
        case .fileHostingWaiting: "Waiting for file hosting"
        case .extracting: "Extracting"
        case .error: "Error"
        }
    }
}
