import Foundation

public class DSSession {
    public let url: URL
    var sessionID: String?
    private let urlSession: URLSession
    private var apiInfoByName: [String: DSAPIInfo]?

    public init(
        insecure: Bool = false,
        host: String,
        port: Int? = nil,
        urlSession: URLSession = .shared
    ) async throws {
        var components = URLComponents()
        components.scheme = insecure ? "http" : "https"
        components.host = host
        components.port =  port ?? (insecure ? 5001 : 5000)
        components.path = "/webapi/"
        self.url = components.url!
        self.urlSession = urlSession
    }

    public lazy var api = DSAPIManager(self)
    public lazy var downloadStation = DSDownloadStationManager(self)

    func performRequest<Payload: Decodable>(
        path: String? = nil,
        apiName: String,
        version: Int,
        methodName: String,
        parameters: [String: String]
    ) async throws -> Payload {
        var url = url

        if let path {
            url.append(path: path)
        } else {
            if case .none = apiInfoByName {
                self.apiInfoByName = try await api.info.query()
            }

            guard let apiInfo = apiInfoByName![apiName]
            else { throw DSError.requestedAPIDoesNotExist }

            guard case apiInfo.versions = version
            else { throw DSError.requestedVersionDoesNotSupportFunctionality  }

            url.append(path: apiInfo.path)
        }

        url.append(queryItems: [
            URLQueryItem(name: "api", value: apiName),
            URLQueryItem(name: "version", value: "\(version)"),
            URLQueryItem(name: "method", value: methodName),
        ])

        url.append(queryItems: parameters.map(URLQueryItem.init(name:value:)))

        if let sessionID {
            url.append(queryItems: [
                URLQueryItem(name: "_sid", value: sessionID)
            ])
        }

        let (data, _) = try await urlSession.data(from: url)
        return try JSONDecoder().decode(DSResponse.self, from: data).get()
    }
}
