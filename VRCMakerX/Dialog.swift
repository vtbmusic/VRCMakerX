//
//  Dialog.swift
//  VRCMakerX
//
//  Created by kitu Kuro on 2020/7/18.
//  Copyright © 2020 kitu Kuro. All rights reserved.
//

import Foundation
import Cocoa
import SwiftyJSON

func dialog(title: String, type: String, buttons: Array<Any>) -> Bool {
    let alert:NSAlert = NSAlert()
    alert.messageText = title
    for bnt in buttons {
        alert.addButton(withTitle: bnt as! String)
    }
    switch type {
    case "critical":
        alert.alertStyle = NSAlert.Style.critical
        break
    case "informational":
        alert.alertStyle = NSAlert.Style.informational
        break
    case "warning":
        alert.alertStyle = NSAlert.Style.warning
    default:
        alert.alertStyle = NSAlert.Style.informational
    }
    
    let callback = alert.runModal()
    if callback == NSApplication.ModalResponse.alertFirstButtonReturn {
        return true
    }
    return false
}
