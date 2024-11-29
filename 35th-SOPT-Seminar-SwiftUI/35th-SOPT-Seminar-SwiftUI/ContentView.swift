//
//  ContentView.swift
//  35th-SOPT-Seminar-SwiftUI
//
//  Created by 조혜린 on 11/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(AppModel.mock()) { app in
        ChartRow(app: app)
      }
    }
}

#Preview {
    ContentView()
}
