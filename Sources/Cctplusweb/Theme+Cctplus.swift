//
//  File.swift
//  
//
//  Created by Maegan Wilson on 7/11/22.
//

import Foundation
import Publish
import Plot

extension Theme {
    static var cctplus: Self {
        return Theme(htmlFactory: CCTPlusHTMLFactory(),
                     resourcePaths: ["Resources/styles/styles.css"])
    }
}

private struct CCTPlusHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(.lang(context.site.language),
             .scriptHead(
                scriptURLS: ["https://cdn.tailwindcss.com"],
                for: index, on: context.site),
             .body{
                 Wrapper {
                     SiteHeader(context: context, selectedSelectionID: nil)
                     Div {
                         H1(index.title)
                             .class("text-6xl")
                         Paragraph("Swift development, articles, and news by Maegan.")
                             .class("text-xl")
                     }.class("flex flex-wrap flex-row items-end")
                     Div {
                         Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                             .class("py-2")
                         Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                             .class("py-2")
                     }
                     SiteFooter()
                 }
             },
             .class("bg-gray-100")
        )
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(.lang(context.site.language),
             .scriptHead(scriptURLS: ["https://cdn.tailwindcss.com"],
                         for: section, on: context.site),
             .body {
                 Wrapper {
                     SiteHeader(context: context, selectedSelectionID: section.id)
                     Div {
                         H1(section.title)
                             .class("text-6xl")
                     }
                     SiteFooter()
                 }
             })
    }
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(.lang(context.site.language),
             .head(for: item, on: context.site),
             .body {
                 H1(item.title)
             })
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML(.lang(context.site.language),
             .head(for: page, on: context.site),
             .body {
                 H1(page.title)
             })
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(.lang(context.site.language),
             .head(for: page, on: context.site),
             .body {
                 H1(page.title)
             })
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(.lang(context.site.language),
             .head(for: page, on: context.site),
             .body {
                 H1(page.title)
             })
    }
    
}

private struct SiteHeader<Site: Website>: Component {
    var context: PublishingContext<Site>
    var selectedSelectionID: Site.SectionID?
    
    var body: Component {
        Header {
            Div {
                Link(context.site.name, url: "/")
                    .class("w-1/4 text-lg")
                navigation
                    .class("grow")
            }.class("flex flex-row")
        }
    }
    
    private var navigation: Component {
        Navigation {
            List(Site.SectionID.allCases) { sectionID in
                let section = context.sections[sectionID]
                
                return Link(section.title, url: section.path.absoluteString)
                    .class(sectionID == selectedSelectionID ? "bg-sky-500 hover:bg-sky-500/50 px-4 transition-all" : "bg-emerald-500 hover:bg-emerald-500/50 px-4 transition-all")
            }.class("flex flex-row space-x-4")
        }
    }
}

private struct SiteFooter: Component {
    var body: Component {
        Footer {
            Div {
                Span {
                    Span("CCT+ ")
                    Span("© \(Date().formatted(.dateTime.year()))")
                        .class("text-sm")
                }
                Div {
                    footerLink("Contact", url: "https://github.com/johnsundell/publish")
                        .class("mx-2")
                    footerLink("Media Kit", url: "https://github.com/johnsundell/publish")
                        .class("mx-2")
                }
                .class("mx-4")
                Div {
                    Span("Generated using ")
                    footerLink("Publish", url: "https://github.com/johnsundell/publish")
                }
                .class("mx-4")
            }.class("flex justify-around")
        }
    }
    
    private func footerLink(_ text: String, url: URLRepresentable) -> Component {
        Link(text, url: url)
            .class("bg-sky-500 hover:bg-sky-500/50 px-4 transition-all")
    }
}

private struct Wrapper: ComponentContainer {
    @ComponentBuilder var content: ContentProvider
    
    var body: Component {
        Div(content: content)
            .class("m-auto container")
    }
    
}
