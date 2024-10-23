public struct DSAPIInfo: Decodable {
    public let path: String
    public let minVersion: Int
    public let maxVersion: Int

    public var versions: ClosedRange<Int> {
        minVersion...maxVersion
    }
}
