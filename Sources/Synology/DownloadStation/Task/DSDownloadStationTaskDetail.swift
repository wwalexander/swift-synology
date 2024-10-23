import Foundation

public struct DSDownloadStationTaskDetail {
    public typealias Priority = DSDownloadStationTaskPriority

    public let destination: String
    public let uri: String
    public let created: Date
    public let priority: Priority?
    public let totalPeers: Int
    public let connectedSeeders: Int
    public let connectedLeechers: Int
}

extension DSDownloadStationTaskDetail: Decodable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.destination = try container.decode(String.self, forKey: .destination)
        self.uri = try container.decode(String.self, forKey: .uri)
        let timeIntervalSince1970UntilCreated = try container.decode(TimeInterval.self, forKey: .created)
        self.created = Date(timeIntervalSince1970: timeIntervalSince1970UntilCreated)
        self.priority = try container.decodeIfPresent(DSDownloadStationTaskDetail.Priority.self, forKey: .priority)
        self.totalPeers = try container.decode(Int.self, forKey: .totalPeers)
        self.connectedSeeders = try container.decode(Int.self, forKey: .connectedSeeders)
        self.connectedLeechers = try container.decode(Int.self, forKey: .connectedLeechers)
    }

    enum CodingKeys: String, CodingKey {
        case destination
        case uri
        case created = "create_time"
        case priority
        case totalPeers = "total_peers"
        case connectedSeeders = "connected_seeders"
        case connectedLeechers = "connected_leechers"
    }


}
