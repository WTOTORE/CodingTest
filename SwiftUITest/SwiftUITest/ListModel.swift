//
//  model.swift
//  SwiftUITest
//
//  Created by 王涛 on 2021/7/29.
//  Copyright © 2021 王涛. All rights reserved.
//

import Foundation
import SwiftUI
/// 类型
enum contentType:Int {
    case contentTypeText = 0//纯文本
    case contentTypeImg//纯图片
    case contentTypetextAndImg//图文
    case contentTypeTextAndLink//文本+链接
}
/// 颜色组
public let typeColorArray = [
    Color(red:243 / 255, green:176 / 255, blue: 74 / 255),
    Color(red:238 / 255, green:140 / 255, blue: 111 / 255),
    Color(red:237 / 255, green:113 / 255, blue: 165 / 255),
    Color(red:207 / 255, green:102 / 255, blue: 247 / 255),
    Color(red:77 / 255, green:110 / 255, blue: 247 / 255),
    Color(red:236 / 255, green:107 / 255, blue: 102 / 255),
    Color(red:75 / 255, green:166 / 255, blue: 239 / 255),
    Color(red:161 / 255, green:206 / 255, blue: 97 / 255),
    Color(red:248 / 255, green:214 / 255, blue: 80 / 255)
]

public class ListModel:Identifiable,ObservableObject {
    public var id = UUID()
    var contentId:String = ""
    /// 类型：默认纯文本
    var type:contentType = contentType.contentTypeText
    /// 内容
    var content:String = ""
    /// 图片链接数组
    var imgUrls:[String] = []
    /// 链接地址
    var link:String = ""
    /// 颜色
    var color:Color = typeColorArray[0]
    /// 每张图片列表展示宽度，默认4:3比例展示
    var imgWid:CGFloat = 0
    
    init() {
        
    }
    init(contentId: String, type: contentType, content: String,imgUrls:[String],link:String) {
        self.contentId = contentId
        self.type = type
        self.content = content
        self.imgUrls = imgUrls
        self.link = link
        self.color = typeColorArray[type.rawValue]
    }
}
