//
//  listCell.swift
//  SwiftUITest
//
//  Created by 王涛 on 2021/7/29.
//  Copyright © 2021 王涛. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct listCell: View {
    var listModel = ListModel()
    let contentWid:CGFloat = UIScreen.main.bounds.width-80;
    var body: some View {
        HStack {
            Rectangle()
                .fill(listModel.color)
                .frame(width: 10)
            VStack {
                if listModel.type == contentType.contentTypeText || listModel.type == contentType.contentTypeTextAndLink || listModel.type == contentType.contentTypetextAndImg {
                    
                    if listModel.type != contentType.contentTypeText && listModel.type != contentType.contentTypeTextAndLink {
                        //其他模式，最多展示两行，点击可进详情
                        Text(listModel.content)
                            .font(.body)
                            .padding(EdgeInsets(top: 5, leading:0, bottom: 5, trailing: 0))
                            .lineLimit(2)
                    }else {
                        //纯文字模式和链接模式内容展示全，且纯文字模式不跳转详情
                        Text(listModel.content)
                            .font(.headline)
                            .padding(EdgeInsets(top: 5, leading:0, bottom: 5, trailing: 0))
                    }
                        
                }
                if listModel.type == contentType.contentTypeImg || listModel.type == contentType.contentTypetextAndImg {
                    if listModel.imgUrls.count > 0 {
                        let imgUrlList:[Array] = self.imgUrlList(listModel: listModel)//九宫格展示图片
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(0..<imgUrlList.count){ index in
                                let imgUrls = imgUrlList[index]
                                HStack{
                                    ForEach(0..<imgUrls.count){ i in
                                        KFImage(URL.init(string: imgUrls[i] as! String))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: listModel.imgWid, height: listModel.imgWid*0.75, alignment:.center)
                                    }
                                }
                                
                            }
                        }
                    }
                }
                if (listModel.type == contentType.contentTypeImg && listModel.imgUrls.count > 1) || listModel.type == contentType.contentTypetextAndImg {
                    Text("点击查看详情>>>")
                        .foregroundColor(listModel.color)
                        .font(.footnote)
                        .padding(EdgeInsets(top: 0, leading:0, bottom: 5, trailing: 0))
                   
                }else if listModel.type == contentType.contentTypeTextAndLink {
                    Text("点击访问链接>>>")
                        .foregroundColor(listModel.color)
                        .font(.footnote)
                        .padding(EdgeInsets(top: 0, leading:0, bottom: 5, trailing: 0))
                }
            }
            .frame(width: contentWid)
        }
        .frame(minHeight:85)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
        .background(Color(red: 241 / 255, green: 243 / 255, blue: 246 / 255))
        
    }

    func imgUrlList(listModel:ListModel) -> [Array<Any>] {
        let mar:CGFloat = 10;
        var count: Int = listModel.imgUrls.count
        var list:[String] = listModel.imgUrls
        if count > 9 {
            list = listModel.imgUrls.suffix(9)
        }
        if list.count < 3 {
            
        }else if list.count == 4 {
            count = 2
        }else {
            count = 3
        }        
        listModel.imgWid = (self.contentWid-mar*CGFloat(count-1))/CGFloat(count)
        if count == 1 && listModel.type == contentType.contentTypetextAndImg {
            count = 3
            listModel.imgWid = 2*(self.contentWid-mar*CGFloat(count-1))/CGFloat(count)+mar
        }
        var imgUrlList:[Array<String>]=[]
        var imgUrls:[String]=[]
        for item in list {
            if imgUrls.count < count {
                imgUrls.append(item)
            }else {
                imgUrlList.append(imgUrls)
                imgUrls=[]
                imgUrls.append(item)
            }
        }
        if imgUrls.count > 0 {
            imgUrlList.append(imgUrls)
        }
        return imgUrlList
    }
}

