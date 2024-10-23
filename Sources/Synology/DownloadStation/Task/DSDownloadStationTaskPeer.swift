public struct DSDownloadStationTaskPeer {
    public let address: String
    public let agent: String
    public let progress: Double
    public let downloadSpeed: Int
    public let uploadSpeed: Int
}

extension DSDownloadStationTaskPeer: Decodable {
    enum CodingKeys: String, CodingKey {
        case address
        case agent
        case progress
        case downloadSpeed = "speed_download"
        case uploadSpeed = "speed_upload"
    }
}
