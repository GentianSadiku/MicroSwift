import UIKit

enum FileType: String {
    case json = "json"
    case videoAVI = "avi"
    case videoMp4 = "mp4"
}

extension URL {
    
    static func getUrlFor(fileName: String, type: FileType = .json) -> URL? {
        let bundle = Bundle.main
        guard let path = bundle.path(forResource: fileName, ofType: type.rawValue) else { return nil }
        return URL(fileURLWithPath: path)
    }
    
    
    static func getPathFor(fileName: String, type: FileType = .json) -> String? {
        let bundle = Bundle.main
        let path = bundle.path(forResource: fileName, ofType: type.rawValue)
        return path
    }
}



