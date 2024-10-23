public class DSDownloadStationManager {
    let session: DSSession

    init(_ session: DSSession) {
        self.session = session
    }

    public lazy var task = DSDownloadStationTaskManager(session)
}

