import Foundation

public struct DSDownloadStationTaskTracker {
    public let url: URL
    public let status: String
    public let update: TimeInterval
    public let seeds: Int
    public let peers: Int
}


extension DSDownloadStationTaskTracker: Decodable {
    enum CodingKeys: String, CodingKey {
        case url
        case status
        case update = "update_timer"
        case seeds
        case peers
    }
}

