//
//  listView.swift
//  SwiftUITest
//
//  Created by 王涛 on 2021/7/29.
//  Copyright © 2021 王涛. All rights reserved.
//

import SwiftUI

struct listView: View {
    /// 数据源
    var listItems: [ListModel]
    /// 点击方法回调
    var onPressed: (ListModel) -> Void
    var body: some View {
        List(listItems){ listModel in
            Button(action: {
                self.onPressed(listModel)
            }) {
                listCell(listModel: listModel)
                    .cornerRadius(10.0)
            }
            
        }
    }
}

