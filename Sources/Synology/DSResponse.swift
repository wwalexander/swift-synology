struct DSResponse<Payload: Decodable>: RawRepresentable, Decodable {
    let rawValue: Result<Payload, DSError>

    init(rawValue: Result<Payload, DSError>) {
        self.rawValue = rawValue
    }

    func get() throws -> Payload {
        try rawValue.get()
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if try container.decode(Bool.self, forKey: .success) {
            let payload = try container.decode(Payload.self, forKey: .data)
            self.rawValue = .success(payload)
        } else {
            let error = try container.decode(DSError.self, forKey: .error)
            self.rawValue = .failure(error)
        }

    }

    enum CodingKeys: String, CodingKey {
        case success
        case data
        case error
    }
}
