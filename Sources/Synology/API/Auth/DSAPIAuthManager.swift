public class DSAPIAuthManager {
    let session: DSSession

    init(_ session: DSSession) {
        self.session = session
    }

    public func login(account: String, password: String) async throws {
        let payload: Payload = try await session.performRequest(
            apiName: "SYNO.API.Auth",
            version: 3,
            methodName: "login",
            parameters: [
                "account": account,
                "passwd": password,
                "format": "sid"
            ]
        )

        session.sessionID = payload.sessionID
    }

    public func logout() {
        session.sessionID = nil
    }

    struct Payload: Decodable {
        let sessionID: String

        enum CodingKeys: String, CodingKey {
            case sessionID = "sid"
        }
    }
}
