public class DSAPIInfoManager {
    let session: DSSession

    init(_ session: DSSession) {
        self.session = session
    }

    public func query(names: Set<String> = []) async throws -> [String: DSAPIInfo] {
        try await session.performRequest(
            path: "entry.cgi",
            apiName: "SYNO.API.Info",
            version: 1,
            methodName: "query",
            parameters: [
                "query": names.isEmpty ? "all" : names.joined(separator: ",")
            ]
        )
    }
}
