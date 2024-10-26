//
//  PracticeViewModel.swift
//  35th-SOPT-Seminar
//
//  Created by 조혜린 on 10/25/24.
//

import Foundation

final class PracticeViewModel {
    private(set) var practiceModel = PracticeModel_MVVM(nickname: "", content: "")
    
    var isNicknameValid: ((Bool, String) -> Void)?
    
    func checkValid(nickname: String?) {
        let nicknameRegEx = "[가-힣]{2,7}"
        let pred = NSPredicate(format:"SELF MATCHES %@", nicknameRegEx)
        
        if nickname == "" {
            isNicknameValid?(false, "닉네임이 입력되지 않았습니다")
        } else if pred.evaluate(with: nickname) {
            isNicknameValid?(true, "사용 가능한 닉네임입니다.")
        } else {
            isNicknameValid?(false, "올바르지 않은 형식의 닉네임입니다! (2~7자의 한글)")
        }
    }
    
    func updateNicknameAndContent(nickname: String, content: String) {
        practiceModel.nickname = nickname
        practiceModel.content = content
    }
}
