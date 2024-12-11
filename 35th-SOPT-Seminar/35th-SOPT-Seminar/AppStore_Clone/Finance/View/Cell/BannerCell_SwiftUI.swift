//
//  BannerCell_SwiftUI.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/29/24.
//

import SwiftUI

struct BannerCell_SwiftUI: View {
    
    let app: BannerModel
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            appHeader
            appBannerImage
        }
        .padding(.horizontal, 5)
    }
    
    var appHeader: some View {
        VStack(
            alignment: .leading,
            spacing: 3
        ) {
            Text(app.appType)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.blue)
            Text(app.appTitle)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.black)
            Text(app.description)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.gray)
        }
    }
    
    var appBannerImage: some View {
        ZStack() {
            Rectangle()
                .fill(app.bannerColor)
                .cornerRadius(5)
            VStack() {
                Spacer()
                appInfo
            }
        }
    }
    
    var appInfo: some View {
        HStack() {
            app.appIconImage
                .resizable()
                .frame(width: 30, height: 30)
                .cornerRadius(8)
            VStack(
                alignment: .leading,
                spacing: 3
            ) {
                Text(app.appTitleLabelInBanner)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                Text(app.descriptionLabelInBanner)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding(15)
    }
}
