//
//  AppModel.swift
//  35th-SOPT-Seminar-SwiftUI
//
//  Created by 조혜린 on 11/23/24.
//

import SwiftUICore

struct AppModel: Identifiable {
    let id: UUID
    let iconImage: Image
    let ranking: Int
    let title: String
    let subTitle: String
    //  let downloadState: DownloadState
    //  let category: AppCategory
}

extension AppModel {
    static func mock() -> [Self] {
        return [AppModel(id: .init(), iconImage: Image(systemName: "person"), ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티"),
                AppModel(id: .init(), iconImage: Image(systemName: "person"), ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티"),
                AppModel(id: .init(), iconImage: Image(systemName: "person"), ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티"),
                AppModel(id: .init(), iconImage: Image(systemName: "person"), ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티"),
                AppModel(id: .init(), iconImage: Image(systemName: "person"), ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티"),
                AppModel(id: .init(), iconImage: Image(systemName: "person"), ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티"),
                AppModel(id: .init(), iconImage: Image(systemName: "person"), ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티"),
                AppModel(id: .init(), iconImage: Image(systemName: "person"), ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티"),
                AppModel(id: .init(), iconImage: Image(systemName: "person"), ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티")]
    }
}
