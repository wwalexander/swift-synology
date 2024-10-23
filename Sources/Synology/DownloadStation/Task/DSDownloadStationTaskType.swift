public enum DSDownloadStationTaskType: String, Decodable, CustomStringConvertible {
    case bt
    case nzb
    case http
    case ftp
    case eMule

    public var description: String {
        switch self {
        case .bt: "BitTorrent"
        case .nzb: "NZB"
        case .http: "HTTP"
        case .ftp: "FTP"
        case .eMule: "eMule"
        }
    }
}
