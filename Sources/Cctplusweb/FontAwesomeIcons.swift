//
//  FontAwesomeIcons.swift
//  
//
//  Created by Maegan Wilson on 7/12/22.
//

import Foundation

public enum FontAwesomeIcons: String, CaseIterable {
    case instagramSquare = "fa-brands fa-instagram-square"
    case twitterSquare = "fa-brands fa-twitter-square"
    case youtubeSquare = "fa-brands fa-youtube-square"
    case twitch = "fa-brands fa-twitch"
    case github = "fa-brands fa-github"
    case githubSquare = "fa-brands fa-github-square"
    
    var icon: String { return rawValue }
}
