//
//  ContentView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI
import AniListAPI

fileprivate extension View {
    func tabItem(_ tab: MainTab) -> some View {
        self
            .tabItem {
                Label(tab.localizedName, systemImage: tab.systemImage)
            }
            .tag(tab.rawValue)
    }
}

struct ContentView: View {

    @AppStorage(SELECTED_TAB_KEY) private var selectedTabIndex: Int = 0
    @AppStorage(LOGGED_IN_KEY) private var isLoggedIn: Bool = false
    @AppStorage(USER_SCORE_KEY) private var myScoreFormatRawValue = ScoreFormat.point100.rawValue
    var myScoreFormat: ScoreFormat {
        ScoreFormat(rawValue: myScoreFormatRawValue) ?? .point100
    }

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            HomeView(isLoggedIn: isLoggedIn)
                .tabItem(.home)
                .environment(\.scoreFormat, myScoreFormat)
            
            if isLoggedIn {
                MediaListStatusView(mediaType: .anime)
                    .tabItem(.anime)
                    .id(MediaType.anime)
                    .environment(\.scoreFormat, myScoreFormat)
            } else {
                NotLoggedView()
                    .tabItem(.anime)
            }
            
            if isLoggedIn {
                MediaListStatusView(mediaType: .manga)
                    .tabItem(.manga)
                    .id(MediaType.manga)
                    .environment(\.scoreFormat, myScoreFormat)
            } else {
                NotLoggedView()
                    .tabItem(.manga)
            }
            
            if isLoggedIn {
                ProfileView()
                    .tabItem(.profile)
            } else {
                NotLoggedView()
                    .tabItem(.profile)
            }
            
            RootExploreView()
                .tabItem(.explore)
        }//:TabView
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
