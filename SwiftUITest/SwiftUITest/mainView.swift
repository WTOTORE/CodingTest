//
//  mainView.swift
//  SwiftUITest
//
//  Created by 王涛 on 2021/7/29.
//  Copyright © 2021 王涛. All rights reserved.
//

import SwiftUI
struct mainView: View {
    /// 模拟数据源
    @State var list:[ListModel] = [
        ListModel.init(contentId: "1", type: contentType.contentTypeText, content: "首先，感谢您抽出宝贵的时间进行 Coding Test, 这个 Coding Test 的目标是实现一个多类型的列表页以及对应的详情页面，您可以自由发挥实现整体效果，我们将根据您的最终作品做一个评估考核。", imgUrls: [], link: ""),
        ListModel.init(contentId: "2", type: contentType.contentTypeImg, content: "", imgUrls: ["https://www.arcblockio.cn/blog/static/2c6120caf67e5c927e7254f115e58fcd/38a09/cover.jpg"], link: ""),
        ListModel.init(contentId: "3", type: contentType.contentTypetextAndImg, content: "下面是 ArcBlock DevCon 2020 的精彩图片...(可能是很长的文字，多张不同图片，图片可以是0张或者很多张，这里只给了三张为例子)", imgUrls: ["https://www.arcblockio.cn/blog/static/88b798d281e42ae3570a25e208e89d39/38a09/cover.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblockio.cn/blog/static/461a789adcb0f768d46d60163ee73bd3/f5292/devcon.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblock.io/blog/static/fb2e8a2c56da3fadc4ff21ed5d96a4bc/38a09/cover.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblockio.cn/blog/static/88b798d281e42ae3570a25e208e89d39/38a09/cover.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblockio.cn/blog/static/461a789adcb0f768d46d60163ee73bd3/f5292/devcon.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblock.io/blog/static/fb2e8a2c56da3fadc4ff21ed5d96a4bc/38a09/cover.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblockio.cn/blog/static/88b798d281e42ae3570a25e208e89d39/38a09/cover.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblockio.cn/blog/static/461a789adcb0f768d46d60163ee73bd3/f5292/devcon.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblock.io/blog/static/fb2e8a2c56da3fadc4ff21ed5d96a4bc/38a09/cover.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblockio.cn/blog/static/88b798d281e42ae3570a25e208e89d39/38a09/cover.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblockio.cn/blog/static/461a789adcb0f768d46d60163ee73bd3/f5292/devcon.jpg",
                                                                                                                                                                                                                                                                             "https://www.arcblock.io/blog/static/fb2e8a2c56da3fadc4ff21ed5d96a4bc/38a09/cover.jpg"], link: ""),
        ListModel.init(contentId: "4", type: contentType.contentTypetextAndImg, content: "这是 ArcBlock ABT Node 界面截图", imgUrls: ["https://www.arcblockio.cn/blog/static/e8e5ec2f2824b819380b605d6c50cc2b/92c65/blocklets.png"], link: ""),
        ListModel.init(contentId: "5", type: contentType.contentTypeTextAndLink, content: "这是 ABT 钱包的官网页面, 欢迎体验（需要考虑链接可访问）", imgUrls: [], link: "https://abtwallet.io/zh/")
    ]
    /// 点击选中时模型
    @State private var currentModel: ListModel = ListModel()
    /// 是否展示详情
    @State var visible: Bool = false
    var body: some View {
        NavigationView {
            listView(listItems: self.list, onPressed: { ListModel in
                self.currentModel = ListModel
                if ListModel.type != contentType.contentTypeText {
                    if ListModel.type == contentType.contentTypeImg {
                        if ListModel.imgUrls.count != 1 {
                            self.visible = true
                        }
                    }else {
                        self.visible = true
                    }
                }
            }).navigationBarTitle(Text("Coding Test"), displayMode: .large)

        }
        .sheet(isPresented: $visible, content: {
            detailView(listModel:self.$currentModel ,onDissmis: { self.visible = false })
        })
        
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
