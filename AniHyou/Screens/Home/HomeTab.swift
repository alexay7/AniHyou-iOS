//
//  HomeTab.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import Foundation
import SwiftUI

enum HomeTab: Int, CaseIterable {
    case discover = 0
    case activity = 1
    case current = 2
}

extension HomeTab {
    var localizedName: LocalizedStringKey {
        switch self {
        case .discover:
            "Discover"
        case .activity:
            "Activity"
        case .current:
            "Current"
        }
    }
    
    var systemImage: String {
        switch self {
        case .discover:
            "globe"
        case .activity:
            "text.bubble"
        case .current:
            "play.circle"
        }
    }
}
