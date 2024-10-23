public struct DSDownloadStationTaskFile {
    public typealias Priority = DSDownloadStationTaskPriority

    public let name: String
    public let size: UInt64
    public let downloadedSize: UInt64
    public let priority: Priority?
    // TODO

}

extension DSDownloadStationTaskFile: Decodable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.size = try container.decode(UInt64.self, forKey: .size)
        self.downloadedSize = try container.decode(UInt64.self, forKey: .downloadedSize)
        self.priority = try? container.decode(DSDownloadStationTaskPriority.self, forKey: .priority)
    }


    enum CodingKeys: String, CodingKey {
        case name = "filename"
        case size
        case downloadedSize = "size_downloaded"
        case priority
    }
    // TODO
}
