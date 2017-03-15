// 可执行文件的入口
import Foundation
import CommandLineKit   // 接受字符输入
import Rainbow          // 显示高亮

let cli = CommandLineKit.CommandLine()

let projectOption = StringOption(
    shortFlag: "p", longFlag: "project",required: true,
    helpMessage: "Path to the output file.")
let resourceExtensionOption = MultiStringOption(
    shortFlag: "r", longFlag: "resource-extensions",
    helpMessage: "Use data compression.")
let fileExtensionsOption = MultiStringOption(
    shortFlag: "f", longFlag: "file-extensions", 
    helpMessage:"file extensions to search with.")
let help = BoolOption(shortFlag: "h", longFlag: "help",
                      helpMessage: "Prints a help message.")

cli.addOptions(projectOption, resourceExtensionOption, fileExtensionsOption,help)


cli.formatOutput = { s, type in
    var str: String
    switch(type) {
    case .error:
        str = s.red.bold
    case .optionFlag:
        str = s.green.underline
    case .optionHelp:
        str = s.blue
    default:
        str = s
    }
    
    return cli.defaultFormat(s: str, type: type)
}

do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

if help.value {
    cli.printUsage()
    exit(EX_USAGE)
}

let project = projectOption.value ?? "."
let resourceExtensions = resourceExtensionOption.value ?? ["png","jpg","imageset"]
let fileExtensions = fileExtensionsOption.value ?? ["swift","m","mm","xib","storyboard"]







