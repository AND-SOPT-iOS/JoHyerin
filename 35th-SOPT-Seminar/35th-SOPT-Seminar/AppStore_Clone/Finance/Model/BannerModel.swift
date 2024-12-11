//
//  BannerModel.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 11/29/24.
//

import SwiftUICore

struct BannerModel: Identifiable {
    let id: UUID
    let appType: String
    let appTitle: String
    let description: String
    let bannerColor: Color
    let appIconImage: Image
    let appTitleLabelInBanner: String
    let descriptionLabelInBanner: String
}

extension BannerModel {
    static func mock() -> [Self] {
        return [BannerModel(id: .init(), appType: "편리한 생활", appTitle: "네이버페이", description: "지갑 없이 결제하셈", bannerColor: .green, appIconImage: Image(.iconNaverpay), appTitleLabelInBanner: "네이버페이라고", descriptionLabelInBanner: "결제, 포인트 어쩌고저쩌고"),
                BannerModel(id: .init(), appType: "시작하기", appTitle: "현대카드", description: "현대카드현대카드", bannerColor: .gray, appIconImage: Image(.iconHyundaicard), appTitleLabelInBanner: "현대카드~~~", descriptionLabelInBanner: "현대카드@!@@@@!@!@!@!"),
                BannerModel(id: .init(), appType: "새로운 경험", appTitle: "카카오뱅크", description: "카카오뱅크임", bannerColor: .yellow, appIconImage: Image(.iconKakaobank), appTitleLabelInBanner: "카카오뱅크임", descriptionLabelInBanner: "카카오뱅크~~~~~~~~~"),
                BannerModel(id: .init(), appType: "추천", appTitle: "토스", description: "토스토스토스", bannerColor: .blue, appIconImage: Image(.iconToss), appTitleLabelInBanner: "토스", descriptionLabelInBanner: "토스~~~~~~~~~~~~₩")]
    }
}
