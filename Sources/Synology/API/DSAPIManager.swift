public class DSAPIManager {
    let session: DSSession

    public init(_ session: DSSession) {
        self.session = session
    }

    public lazy var info = DSAPIInfoManager(session)
    public lazy var auth = DSAPIAuthManager(session)
}
