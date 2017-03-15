import Foundation
import PathKit // 转换各种路径，比如绝对和相对

public struct FileInfo {
    let path: String
}

public struct FengNiao {
    let projectPath: Path
    let excludedPaths: [Path]
    let resourceExtensions: [String]
    let fileExtensions: [String]
    
    // public的struct需要自己手动初始化
    public init(projectPath: String, excludedPaths: [String], resourceExtensions: [String],fileExtensions: [String]) {
        // 各种路径
        let path = Path(projectPath).absolute()
        self.projectPath = path
        self.excludedPaths = excludedPaths.map{ path + Path($0) }
        self.resourceExtensions = resourceExtensions
        self.fileExtensions = fileExtensions
    }
    public func unusedResource() -> [FileInfo] {
        fatalError()
    }
    func stringInUse() -> [String] {
        return[]
    }
    func resourcesInUse() -> [String: String] {
        fatalError()
    }
    
    public func delete() ->() {
    
    }
    
    
}
