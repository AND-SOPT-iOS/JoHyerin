//
//  ChartRow.swift
//  35th-SOPT-Seminar-SwiftUI
//
//  Created by 조혜린 on 11/23/24.
//

import SwiftUI

struct ChartRow: View {
    
    let app: AppModel
    
    var body: some View {
        HStack(
            spacing: 12
        ) {
            iconImage
            ranking
            titleAndSubTitle
            Spacer()
            //          downloadButton
        }
        .padding(.horizontal, 20)
    }
    
    var iconImage: some View {
        app.iconImage
            .resizable()
            .frame(width: 55, height: 55)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.clear)
                    .stroke(.black, lineWidth: 1)
                    .frame(width: 60, height: 60)
            }
    }
    
    var ranking: some View {
        VStack {
            Text("\(app.ranking)")
                .font(.title)
                .foregroundColor(.black)
        }
    }
    
    var titleAndSubTitle: some View {
        VStack(alignment: .leading) {
            Text(app.title)
                .font(.headline)
            Text(app.subTitle)
                .font(.caption)
        }
    }
}
