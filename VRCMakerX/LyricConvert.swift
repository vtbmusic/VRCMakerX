//
//  LyricConvert.swift
//  VRCMakerX
//
//  Created by kitu Kuro on 2020/7/16.
//  Copyright © 2020 kitu Kuro. All rights reserved.
//

import Foundation
import Cocoa

// MARK: 字符串转字典
func stringValueDic(_ str: String) -> [String : Any]?{
     let data = str.data(using: String.Encoding.utf8)
     if let dict = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any] {
         return dict
     }
     return nil
 }

//public func mixlrc2vrc(oritxt: String) {
//    
//    struct vrcobj {
//     
//        var karaoke: DarwinBoolean = false
//        var scrollDisabled: DarwinBoolean = false
//        struct origin {
//            var version: Int64 = 2
//            var text: String = ""
//        }
//        struct translate {
//            var version: Int64 = 2
//            var text: String = ""
//        }
//     
//    }
//    
//    do{
//        
//        // 1. 创建正则表达式规则
//         let pattern = "(\\[.*?\\])\\s*([^\\[\\]]*)"
//         
//         // 2. 创建正则表达式对象
//         guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
//             return
//         }
//         
//         // 3. 匹配字符串中内容
//        let results =  regex.matches(in: oritxt, options: [], range: NSRange(location: 0, length: countline(lines: oritxt)))
//        
//        print(results)
//    } catch {
//        print("nil")
//    }
//    
//    // print(vrcobj.origin())
//    
//}
