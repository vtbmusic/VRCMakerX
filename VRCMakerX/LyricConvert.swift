//
//  LyricConvert.swift
//  VRCMakerX
//
//  Created by kitu Kuro on 2020/7/16.
//  Copyright © 2020 kitu Kuro. All rights reserved.
//

import Foundation
import Cocoa

func mixlrc2vrc(oritxt: String) {
    
    struct vrcobj {
     
        var karaoke: DarwinBoolean = false
        var scrollDisabled: DarwinBoolean = false
        struct origin {
            var version: Int64 = 2
            var text: String = ""
        }
        struct translate {
            var version: Int64 = 2
            var text: String = ""
        }
     
    }
    
    do{
        let regex = "(\\-[.*?\\-])\\-s*([^\\-[\\-]]*)"
        let RE = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
        let matchs = RE.matches(in: oritxt, options: .reportProgress, range: NSRange(location: 0, length: oritxt.count))
        print(matchs)
    } catch {
        
    }
    
    // print(vrcobj.origin())
    
}
