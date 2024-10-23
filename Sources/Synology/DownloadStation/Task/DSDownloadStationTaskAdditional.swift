public struct DSDownloadStationTaskAdditional {
    public typealias Detail = DSDownloadStationTaskDetail
    public typealias Transfer = DSDownloadStationTaskTransfer
    public typealias File = DSDownloadStationTaskFile
    public typealias Tracker = DSDownloadStationTaskTracker
    public typealias Peer = DSDownloadStationTaskPeer

    public let detail: Detail?
    public let transfer: Transfer?
    public let files: [File]
    public let trackers: [Tracker]?
    public let peers: [Peer]?
}

extension DSDownloadStationTaskAdditional: Decodable {
    enum CodingKeys: String, CodingKey {
        case detail
        case transfer
        case files = "file"
        case trackers = "tracker"
        case peers = "peer"
    }
}
