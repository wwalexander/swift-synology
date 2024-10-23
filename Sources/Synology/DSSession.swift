import Foundation

public class DSSession {
    public let url: URL
    var sessionID: String?
    private var apiInfoByName: [String: DSAPIInfo]?

    public init(secure: Bool, host: String, port: Int? = nil) throws {
        var components = URLComponents()
        components.scheme = secure ? "https" : "http"
        components.host = host
        components.port =  port ?? (secure ? 5001 : 5000)
        components.path = "/webapi/"
        self.url = components.url!
    }

    public lazy var api = DSAPIManager(self)
    public lazy var downloadStation = DSDownloadStationManager(self)

    func performRequest<Payload: Decodable>(
        path: String? = nil,
        apiName: String,
        version: Int,
        methodName: String,
        parameters: [String: String]
    ) throws -> Payload {
        var url = url

        if let path {
            url.append(path: path)
        } else {
            if case .none = apiInfoByName {
                self.apiInfoByName = try api.info.query()
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

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(DSResponse.self, from: data).get()
    }
}
