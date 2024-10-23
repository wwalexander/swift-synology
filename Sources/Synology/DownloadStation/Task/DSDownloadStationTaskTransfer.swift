public struct DSDownloadStationTaskTransfer {
    public let downloadedSize: UInt64
    public let uploadedSize: UInt64
    public let downloadSpeed: UInt64
    public let uploadSpeed: UInt64
}

extension DSDownloadStationTaskTransfer: Decodable {
    enum CodingKeys: String, CodingKey {
        case downloadedSize = "size_downloaded"
        case uploadedSize = "size_uploaded"
        case downloadSpeed = "speed_download"
        case uploadSpeed = "speed_upload"
    }
}
