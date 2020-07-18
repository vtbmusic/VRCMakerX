//
//  ViewController.swift
//  VRCMakerX
//
//  Created by kitu Kuro on 2020/7/16.
//  Copyright © 2020 kitu Kuro. All rights reserved.
//

import Foundation
import Cocoa
import SwiftyJSON

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func open2lrc(_ sender: Any) {
        
        //let data = LoadFile()
        //mixlrc2vrc(oritxt: data)
        
    }

    // MARK: 打开VRC
    @IBAction func OpenVrc(_ sender: Any) {
        // 初始化文本框操作
        let originTextView: NSTextView = originText.documentView! as! NSTextView
        let transTextView: NSTextView = transText.documentView! as! NSTextView
        
        // 开始加载文件
        let data = LoadFile()
        let json = JSON(stringValueDic(data) ?? "")
        
        if json["origin"]["text"].string != nil {
            let origin = json["origin"]["text"].string
            originTextView.string = origin!
            if json["translate"]["text"].string != nil {
                let trans = json["translate"]["text"].string
                transTextView.string = trans!
            }
        } else {
            let dstate = dialog(title: "警告! 打开的不是标准的VRC工程", type: "warning", buttons: ["好"])
            print(dstate)
        }
    }
    
    //MARK: 保存VRC
    @IBAction func SaveVrc(_ sender: Any) {
        // 初始化文本框操作
        let originTextView: NSTextView = originText.documentView! as! NSTextView
        let originTextData = originTextView.textStorage?.string
        let transTextView: NSTextView = transText.documentView! as! NSTextView
        let transTextData = transTextView.textStorage?.string
        
        // 初始化object
        var jsonData: [String: Any] = [:]
        jsonData["karaoke"] = false
        jsonData["scrollDisabled"] = false
        
        if(transTextData == nil || transTextData!.count < 1){
            jsonData["translated"] = false
        } else {
            jsonData["translated"] = true
            
            jsonData["translate"] = [
            "version": 2,
            "text": transTextData as Any
            ]
        }
        
        if(originTextData == nil || originTextData!.count < 1){
            let stats = dialog(title: "警告：源歌词为空", type: "warning", buttons: ["好"])
            print(stats)
        } else {
            
            jsonData["origin"] = [
                "version": 2,
                "text": originTextData as Any
                ]
            
            let data = try? JSONSerialization.data(withJSONObject: jsonData, options: [])
            let str = String(data:data!, encoding: String.Encoding.utf8)
            SaveFile(type: ["vrc"], data: str!)
        }

    }
    
    @IBOutlet weak var originText: NSScrollView!
    
    @IBOutlet weak var transText: NSScrollView!
    
    @IBAction func scrollBind(_ sender: NSButton) {
        if sender.state.rawValue == 1 {
            originText.documentView?.scroll(NSPoint(x: 0, y: CGFloat(transText.verticalScroller!.floatValue)))
            transText.documentView?.scroll(NSPoint(x: CGFloat(0), y: CGFloat(originText.verticalScroller!.floatValue)))
        } else {
            // no
        }
    }
}
