//
//  StringsSearchRule.swift
//  FengNiao
//
//  Created by yiLian on 17/3/15.
//
//

import Foundation
// 可以输入字符串或者正则
protocol StringsSearcher {
    func search(in content: String) -> Set<String>
}
// 具体的搜索
protocol RegexStringsSearch: StringsSearcher {
    var patterns: [String] { get }
}
extension RegexStringsSearch {
    func search(in content: String) -> Set<String> {
        var result = Set<String>()
        for pattern in patterns {
            guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
                print("Failed to create regular expression\(pattern)")
                continue
            }
            let matches = regex.matches(in: content, options: [], range: content.fullRange)
            for checkingResult in matches {
                let range = checkingResult.rangeAt(1) // 匹配的范围
                let extracted = NSString(string: content).substring(with: range)
                result.insert(extracted.plainName)
            }
        }
        return result
    }
}
