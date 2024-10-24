public struct DSDownloadStationTask: Identifiable, Decodable {
    public typealias `Type` = DSDownloadStationTaskType
    public typealias Status = DSDownloadStationTaskStatus
    public typealias StatusExtra = DSDownloadStationTaskStatusExtra
    public typealias Additional = DSDownloadStationTaskAdditional

    public let id: String
    public let type: `Type`
    public let username: String
    public let title: String
    public let size: Int
    public let status: Status
    public let statusExtra: StatusExtra?
    public let additional: Additional?
}
