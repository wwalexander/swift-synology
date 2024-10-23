public struct DSDownloadStationTaskStatusExtra: Decodable {
    public typealias Error = DSDownloadStationTaskError?
    
    public let error: Error
    public let unzipProgress: Int?
}
