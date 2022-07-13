//
//  FontAwesomeIcons.swift
//  
//
//  Created by Maegan Wilson on 7/12/22.
//

import Foundation

public enum FontAwesomeIcons: String, CaseIterable {
    case instagramSquare = "fa-brands fa-instagram-square"
    case instagram = "fa-brands fa-instagram"
    case twitterSquare = "fa-brands fa-twitter-square"
    case twitter = "fa-brands fa-twitter"
    case youtubeSquare = "fa-brands fa-youtube-square"
    case youtube = "fa-brands fa-youtube"
    case twitch = "fa-brands fa-twitch"
    case githubSquare = "fa-brands fa-github-square"
    case github = "fa-brands fa-github"
    
    var icon: String { return rawValue }
}
