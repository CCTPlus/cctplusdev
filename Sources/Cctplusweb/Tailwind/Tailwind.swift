//
//  File.swift
//  
//
//  Created by Maegan Wilson on 7/12/22.
//

import Foundation

struct Tailwind {
    static var container = "container"
    // Flexbox
    static func flexBox(props: [FlexBox]) -> String {
        return "\(props.map({$0.rawValue}).joined(separator: " "))"
    }
    static var alignItemsEnd = "items-end"
    
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
    
    /// Creates background color
    /// - Parameters:
    ///   - color: Background Color
    ///   - shade: 50 to 900 divisible by 100
    ///   - opactity: 0 to 100 (100 is fully seen)
    ///   - isHoverState: Determines if class only occurs when hovered
    /// - Returns: Class name for Tailwind
    static func bg(_ color: Colors,
                   shade: Int,
                   opactity: Int? = nil,
                   isHoverState: Bool = false) -> String {
        var twClass = "bg-\(color.rawValue)-\(shade)"
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
    static func text(size: TShirtSizes) -> String {
        "text-\(size.rawValue)"
    }
}
