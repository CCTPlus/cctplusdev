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
    let height = "\(Tailwind.height(size: .fiveSixth)) \(Tailwind.addBreakPoint(.md, Tailwind.height(size: .fourFifth)))"
    let flexbox = "\(Tailwind.addBreakPoint(.md, Tailwind.flexBox(props: [.flex, .row])))"
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(.lang(context.site.language),
             .scriptHead(
                for: index, on: context.site),
             .body{
                 Div {
                     SiteTitle(context: context)
                     Div {
                         SiteNavigation(context: context, selectedSelectionID: nil)
                         Div {
                             Div {
                                 Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                     .class(Tailwind.padding(axis: .vertical, amount: .two))
                                 Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                     .class(Tailwind.padding(axis: .vertical, amount: .two))
                                 Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                     .class(Tailwind.padding(axis: .vertical, amount: .two))
                                 Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                     .class(Tailwind.padding(axis: .vertical, amount: .two))
                                 Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                     .class(Tailwind.padding(axis: .vertical, amount: .two))
                                 Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                     .class(Tailwind.padding(axis: .vertical, amount: .two))
                                 Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                     .class(Tailwind.padding(axis: .vertical, amount: .two))
                             }
                         }.classes([Tailwind.addBreakPoint(.md, Tailwind.overflow(.yAuto))])
                     }.classes([
                        flexbox,
                        height,
                        Tailwind.gap(size: .four)])
                 }.classes([Tailwind.height(size: .screen), Tailwind.addBreakPoint(.md, Tailwind.overflow(.hidden))])
             }
        )
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(.lang(context.site.language),
             .scriptHead(for: section, on: context.site),
             .body {
                 Wrapper {
                     SiteNavigation(context: context, selectedSelectionID: section.id)
                     Div {
                         H1(section.title)
                             .class(Tailwind.text(size: .xl6))
                     }.classes([Tailwind.columnSpan(columns: 3),
                                Tailwind.height(size: .quarter),
                                Tailwind.overflow(.yAuto)])
                 }
             },
             .class("\(Tailwind.bg(.gray, shade: 100)) \(Tailwind.padding(axis: .all, amount: .two))")
        )
    }
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(.lang(context.site.language),
             .head(for: item, on: context.site),
             .body {
                 H1(item.title)
                     .class(Tailwind.text(size: .xl6))
             })
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML(.lang(context.site.language),
             .head(for: page, on: context.site),
             .body {
                 H1(page.title)
                     .class(Tailwind.text(size: .xl6))
             })
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(.lang(context.site.language),
             .head(for: page, on: context.site),
             .body {
                 H1(page.title)
                     .class(Tailwind.text(size: .xl6))
             })
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(.lang(context.site.language),
             .head(for: page, on: context.site),
             .body {
                 H1(page.title)
                     .class(Tailwind.text(size: .xl6))
             })
    }
    
}
private struct SiteTitle<Site: Website>: Component {
    let fontSize = "\(Tailwind.text(size: .xl4)) \(Tailwind.addBreakPoint(.md, Tailwind.text(size: .xl6)))"
    let height = "\(Tailwind.height(size: .oneSixth)) \(Tailwind.addBreakPoint(.md, Tailwind.height(size: .oneFifth)))"
    
    var context: PublishingContext<Site>
    var body: Component {
        Div {
            H1(context.index.title)
                .classes([fontSize,
                          Tailwind.text(align: .center)])
        }.classes(
            [height,
             Tailwind.padding(axis: .horizontal, amount: .two),
             Tailwind.padding(axis: .vertical, amount: .four),
             Tailwind.bg(.black),
             Tailwind.text(.white),
             Tailwind.font(family: .mono)])
    }
}
private struct SiteNavigation<Site: Website>: Component {
    var context: PublishingContext<Site>
    var selectedSelectionID: Site.SectionID?
    
    // Social media links
    let socialMedia = [[FontAwesomeIcons.instagram, "https://instagram.com/mwilson_codes"],
                       [FontAwesomeIcons.twitter, "https://twitter.com/maeganwilson_"],
                       [FontAwesomeIcons.youtube, "https://youtube.com/c/mwilson_codes"],
                       [FontAwesomeIcons.github, "https://github.com/CCTPlus"],
                       [FontAwesomeIcons.twitch, "https://twitch.tv/mwilson_codes"]]
    
    let active = [Tailwind.bg(.sky, shade: 500),
                  Tailwind.padding(axis: .horizontal, amount: .four),
                  Tailwind.margin(axis: .vertical, amount: .two)]
    let normal = [Tailwind.bg(.emerald, shade: 500),
                  Tailwind.bg(.emerald, shade: 500, opactity: 50, isHoverState: true),
                  Tailwind.padding(axis: .horizontal, amount: .four),
                  Tailwind.transitionAll,
                  Tailwind.margin(axis: .vertical, amount: .two)]
    
    var body: Component {
            Div {
                socials
                navigation
                SiteFooter()
            }.classes(["z-10",
                       Tailwind.flexBox(props: [.flex, .column]),
                       Tailwind.justify(.between),
                       Tailwind.height(size: .full),
                       Tailwind.bg(.zinc, shade: 500),
                       Tailwind.text(.white),
                       Tailwind.font(family: .mono),
                       Tailwind.border(.sky, shade: 500),
                       Tailwind.border(.right, size: .eight)])
    }
    
    private var navigation: Component {
        Navigation {
            List(Site.SectionID.allCases) { sectionID in
                let section = context.sections[sectionID]
                
                return Button {
                    Link(section.title, url: section.path.absoluteString)
                        .classes(sectionID == selectedSelectionID ? active : normal)
                }
            }
        }
    }
    
    private var socials: Component {
        List(socialMedia) { social in
            return Link(url: social[1] as! URLRepresentable) {
                Node.i(.class((social[0] as! FontAwesomeIcons).icon))
                    .class("text-xl")
                    .classes([Tailwind.bg(.sky, shade: 500, opactity: 50, isHoverState: true),
                              Tailwind.padding(axis: .horizontal, amount: .one),
                              Tailwind.transitionAll])
            }
        }.classes([Tailwind.flexBox(props: [.flex, .row]),
                   Tailwind.gap(size: .two),
                   Tailwind.padding(axis: .top, amount: .two)])
    }
}

private struct SiteFooter: Component {
    let footerLinkClasses = [Tailwind.bg(.sky, shade: 500),
                             Tailwind.bg(.sky, shade: 500, opactity: 50, isHoverState: true),
                             Tailwind.transitionAll,
                             Tailwind.padding(axis: .horizontal, amount: .four),
                             Tailwind.transitionAll]
    
    var body: Component {
        Footer {
            Div {
                Link("Contact", url: "/contact")
                    .classes(footerLinkClasses)
            }
            Div{
                Link("Media Kit", url: "/logos")
                    .classes(footerLinkClasses)
            }
            Div {
                Span("Generated using ")
                Link("Publish", url: "https://github.com/johnsundell/publish")
                    .linkTarget(.blank)
                    .classes([Tailwind.bg(.orange, shade: 500, opactity: 30),
                              Tailwind.bg(.orange, shade: 500, opactity: 50, isHoverState: true),
                              Tailwind.transitionAll,
                              Tailwind.padding(axis: .horizontal, amount: .four),
                              Tailwind.transitionAll])
            }.classes([Tailwind.padding(axis: .vertical, amount: .two)])
            
            Div {
                Span("CCT+ ")
                Span("© 2022")
                    .class(Tailwind.text(size: .sm))
            }.classes([Tailwind.padding(axis: .vertical, amount: .two)])
        }
    }
}

private struct Wrapper: ComponentContainer {
    @ComponentBuilder var content: ContentProvider
    
    var body: Component {
        Div(content: content)
            .classes([])
    }
    
}
