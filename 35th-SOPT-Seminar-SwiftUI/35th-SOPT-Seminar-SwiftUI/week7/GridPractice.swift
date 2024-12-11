//
//  GridPractice.swift
//  35th-SOPT-Seminar-SwiftUI
//
//  Created by 조혜린 on 11/30/24.
//

import SwiftUI

struct LazyVGridExampleView: View {
    let rows = [GridItem(.fixed(50)), GridItem(.fixed(50))]

    var body: some View {
        
        ScrollView (
            .vertical
        )
        {
            ScrollView (
                .horizontal
            ) {
                LazyHGrid(rows: rows) {
                    ForEach(0x1f600...0x1f679, id: \.self) { value in
                        Text(String(format: "%x", value))
                        Text(emoji(value))
                            .font(.largeTitle)
                    }
                }
            }
            Rectangle()
                .frame(height: 1000)
                .foregroundStyle(.brown)
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}
