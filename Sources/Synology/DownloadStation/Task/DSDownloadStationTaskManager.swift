public class DSDownloadStationTaskManager {
    public typealias Task = DSDownloadStationTask

    let session: DSSession

    init(_ session: DSSession) {
        self.session = session
    }

    public func list(
        offset: Int = 0,
        limit: Int? = nil,
        additional: Set<PartialKeyPath<Task.Additional>> = []
    ) throws -> [Task] {
        struct Payload: Decodable {
            let tasks: [Task]
        }

        let payload: Payload = try session.performRequest(
            apiName: "SYNO.DownloadStation.Task",
            version: 1,
            methodName: "list",
            parameters: [
                "offset": "\(offset)",
                "limit": "\(limit ?? -1)",
                "additional": additional.compactMap { keyPath in
                    switch keyPath {
                    case \.detail: "detail"
                    case \.transfer: "transfer"
                    case \.files: "file"
                    case \.trackers: "tracker"
                    case \.peers: "peer"
                    default: nil
                    }
                }.joined(separator: ","),
            ]
        )

        return payload.tasks
    }
}
