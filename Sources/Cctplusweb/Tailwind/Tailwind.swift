//
//  File.swift
//  
//
//  Created by Maegan Wilson on 7/12/22.
//

import Foundation

struct Tailwind {
    static var container = "container"
    
    static func position(_ position: Position) -> String {
        return position.rawValue
    }
    
    static func overflow(_ overflow: Overflow) -> String {
        return "overflow-\(overflow.rawValue)"
    }
    
    // Flexbox
    static func flexBox(props: [FlexBox]) -> String {
        return "\(props.map({$0.rawValue}).joined(separator: " "))"
    }
    static var alignItemsEnd = "items-end"
    static func justify(_ justify: Justify) -> String {
        return "justify-\(justify.rawValue)"
    }
    static func justifyItems(_ justify: Justify) -> String {
        return "justify-items-\(justify.rawValue)"
    }
    
    // Grid
    static func grid(with columns: Int) -> String {
        return "grid grid-cols-\(columns)"
    }
    static func columnSpan(columns: Int) -> String {
        return "col-span-\(columns)"
    }
    
    static func gap(size: Sizes) -> String {
        return "gap-\(size.rawValue)"
    }
    
    // TRANSITIONS
    static var transitionAll = "transition-all"
    
    
    static func bg(_ color: Colors,
                   shade: Int? = nil,
                   opactity: Int? = nil,
                   isHoverState: Bool = false) -> String {
        var twClass = "bg-\(color.rawValue)"
        if let shade = shade {
            twClass += "-\(shade)"
        }
        if let opactity = opactity {
            twClass += "/\(opactity)"
        }
        return isHoverState ? "hover:\(twClass)" : twClass
    }
    
    static func padding(axis: Sides, amount: Sizes) -> String {
        "p"+axis.rawValue+"-\(amount.rawValue)"
    }
    
    static func margin(axis: Sides, amount: Sizes) -> String {
        "m"+axis.rawValue+"-\(amount.rawValue)"
    }
    
    static func width(size: Fractions) -> String {
        "w-"+size.rawValue
    }
    
    static func height(size: Fractions) -> String {
        "h-"+size.rawValue
    }
    
    static func text(size: TShirtSizes) -> String {
        "text-\(size.rawValue)"
    }
    
    static func text(align: TextAlign) -> String {
        "text-\(align.rawValue)"
    }
    
    static func text(_ color: Colors,
                   shade: Int? = nil,
                   opactity: Int? = nil,
                   isHoverState: Bool = false) -> String {
        var twClass = "text-\(color.rawValue)"
        if let shade = shade {
            twClass += "-\(shade)"
        }
        if let opactity = opactity {
            twClass += "/\(opactity)"
        }
        return isHoverState ? "hover:\(twClass)" : twClass
    }
}
