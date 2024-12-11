//
//  AppModel.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 12/3/24.
//

import UIKit

struct AppModel: Identifiable {
    var id: UUID
    let appTitle: String
    let description: String
    let appIconImage: UIImage
    var downloadState: DownloadState
}

extension AppModel {
    static func mock() -> [Self] {
        return [AppModel(id: .init(), appTitle: "토스", description: "금융이 쉬워진다", appIconImage: .iconToss, downloadState: .download),
                AppModel(id: .init(), appTitle: "현대백화점", description: "금융", appIconImage: .iconHyundaidepartment, downloadState: .installed),
                AppModel(id: .init(), appTitle: "KB Pay", description: "모든 금융을 한번에, 한손에, 한눈에 담다", appIconImage: .iconKbpay, downloadState: .download),
                AppModel(id: .init(), appTitle: "monimo", description: "모이는 금융, 커지는 혜택!", appIconImage: .iconMonimo, downloadState: .download),
                AppModel(id: .init(), appTitle: "케이뱅크(kbank)", description: "기분좋은 금융생활", appIconImage: .iconKbank, downloadState: .installed)]
    }
}
