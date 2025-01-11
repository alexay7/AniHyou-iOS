//
//  ListActivity.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import Foundation
import AniListAPI
import SwiftUI

extension ListActivityFragment {
    
    // these ugly switches are required because otherwise Xcode won't localize the status strings
    static let watchedStatus = "watched episode"
    static let rewatchedEpisodeStatus = "rewatched episode"
    static let rewatchedStatus = "rewatched"
    static let plansToWatchStatus = "plans to watch"
    static let readStatus = "read chapter"
    static let rereadChapterStatus = "reread chapter"
    static let rereadStatus = "reread"
    static let plansToReadStatus = "plans to read"
    static let completedStatus = "completed"
    static let droppedStatus = "dropped"
    static let pausedWatchingStatus = "paused watching"
    static let pausedReadingStatus = "paused reading"
    
    var text: String {
        let mediaTitle = media?.title?.userPreferred ?? ""
        if let progress, progress != "0" {
            switch status {
            case ListActivityFragment.watchedStatus:
                return "Watched episode %1$@ of %2$@".localized(with: [progress, mediaTitle])
            case ListActivityFragment.rewatchedEpisodeStatus:
                return "Rewatched episode %1$@ of %2$@".localized(with: [progress, mediaTitle])
            case ListActivityFragment.rewatchedStatus:
                return String(localized: "Rewatched \(mediaTitle)")
            case ListActivityFragment.readStatus:
                return "Read chapter %1$@ of %2$@".localized(with: [progress, mediaTitle])
            case ListActivityFragment.rereadChapterStatus:
                return "Reread chapter %1$@ of %2$@".localized(with: [progress, mediaTitle])
            case ListActivityFragment.rereadStatus:
                return String(localized: "Reread \(mediaTitle)")
            default:
                return "\(status?.firstCapitalized ?? "") \(progress) of \(mediaTitle)"
            }
        } else {
            switch status {
            case ListActivityFragment.plansToWatchStatus:
                return String(localized: "Plans to watch \(mediaTitle)")
            case ListActivityFragment.plansToReadStatus:
                return String(localized: "Plans to read \(mediaTitle)")
            case ListActivityFragment.completedStatus:
                return String(localized: "Completed \(mediaTitle)")
            case ListActivityFragment.droppedStatus:
                return String(localized: "Dropped \(mediaTitle)")
            case ListActivityFragment.pausedWatchingStatus, ListActivityFragment.pausedReadingStatus:
                return String(localized: "Paused \(mediaTitle)")
            default:
                return "\(status?.firstCapitalized ?? "") \(mediaTitle)"
            }
        }
    }
}

extension UserActivityQuery.Data.Page.Activity {
    var id: Int {
        if let list = asListActivity {
            list.id
        } else if let text = asTextActivity {
            text.id
        } else if let message = asMessageActivity {
            message.id
        } else {
            hashValue
        }
    }
}
