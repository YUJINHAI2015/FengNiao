//
//  Extension.swift
//  FengNiao
//
//  Created by yiLian on 17/3/15.
//
//

import Foundation
import PathKit

extension String {
    var fullRange: NSRange {
        return NSMakeRange(0, utf16.count)
    }
    var plainName: String {
        let p = Path(self)
        var result = p.lastComponentWithoutExtension // 去掉扩展名
        if result.hasSuffix("%@2x") || result.hasSuffix("%@3x") {
            result = String(describing: result.utf16.dropLast(3))
        }
        return result
    }
}
