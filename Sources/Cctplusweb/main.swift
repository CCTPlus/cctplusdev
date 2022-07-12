import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Cctplusweb: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://cctplus.dev")!
    var name = "CCT+"
    var description = "Tutorials, articales, and more about iOS App Development and Software Development"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try Cctplusweb().publish(withTheme: .cctplus)
