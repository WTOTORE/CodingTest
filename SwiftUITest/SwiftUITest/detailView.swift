//
//  detailView.swift
//  SwiftUITest
//
//  Created by 王涛 on 2021/7/29.
//  Copyright © 2021 王涛. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage
struct detailView: View {
    @Binding var listModel:ListModel
    var onDissmis: () -> Void
    var body: some View {
            if listModel.type == contentType.contentTypeTextAndLink {
                VStack {
                    HStack {
                        Button(action: {
                            self.onDissmis()
                            }) { Text("取消")}
                        .padding(20)
                        Spacer()
                    }
                    //打开链接
                    WebViewPage(listModel: self.$listModel)
                }
                .frame(width: UIScreen.main.bounds.width)
            }else {
                VStack {
                    HStack {
                        Button(action: {
                            self.onDissmis()
                            }) { Text("取消")}
                        .padding(20)
                        Spacer()
                    }
                    //图文展示
                    ScrollView {
                        if listModel.content.count > 0 {
                            Text(listModel.content)
                                .font(.title)
                                .padding(EdgeInsets(top: 5, leading:0, bottom: 5, trailing: 0))
                        }
                        ForEach(listModel.imgUrls, id:\.self){imgUrlStr in
                            KFImage(URL.init(string: imgUrlStr))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width-40)
            }
        
        
        
    }
}

