//
//  FileOpen.swift
//  VRCMakerX
//
//  Created by kitu Kuro on 2020/7/17.
//  Copyright © 2020 kitu Kuro. All rights reserved.
//

import Foundation
import Cocoa

public func LoadFile() -> String {
    
    let dialog = NSOpenPanel();
        
    dialog.title                   = "Choose a project file";
    dialog.showsResizeIndicator    = true;
    dialog.showsHiddenFiles        = false;
    dialog.canChooseDirectories    = true;
    dialog.canCreateDirectories    = true;
    dialog.allowsMultipleSelection = false;
    dialog.allowedFileTypes        = ["vrc", "lrc", "ass", "srt", "txt"];

    if (dialog.runModal() == NSApplication.ModalResponse.OK) {
        guard let result = dialog.url else { return "null" }
        do {
            let Url = try String(contentsOf: result)
            return Url
        } catch {
            return "null"
        }
        
    } else {
        return "null"
    }
    
}

public func SaveFile(type: Array<String>, data: String) {
    
    let savePanel = NSSavePanel()
            savePanel.title = "Save Example..."
            savePanel.prompt = "Save to file"
            savePanel.nameFieldLabel = "Pick a name"
            savePanel.nameFieldStringValue = "new"
    //        savePanel.isExtensionHidden = false
            savePanel.canSelectHiddenExtension = true
            savePanel.allowedFileTypes = type

            let result = savePanel.runModal()

            switch result {
            case .OK:
                let url = savePanel.url!.path
                let manager = FileManager.default
                manager.createFile(atPath: url, contents: nil , attributes: nil)
                let string: String = data
                try? string.write(toFile: url, atomically: true, encoding: .utf8)
                
            case .cancel:
                print("User Cancelled")
            default:
                print("Panel shouldn't be anything other than OK or Cancel")
            }
}
