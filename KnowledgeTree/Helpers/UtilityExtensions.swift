//
//  UtilityExtensions.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import SwiftUI

extension DragGesture.Value {
    var distance: CGSize{ location - startLocation }
}

extension CGRect {
    var center: CGPoint {
        CGPoint (x: midX, y: midY)
    }
}

extension CGPoint {
    static func -(lhs: Self, rhs: Self) -> CGSize {
        CGSize(width: lhs.x - rhs.x, height: lhs.y - rhs.y)
    }
    
    static func +(lhs: Self, rhs: CGSize) -> CGPoint {
        CGPoint(x: lhs.x + rhs.width , y: lhs.y + rhs.height)
    }
    
    static func -(lhs: Self, rhs: CGSize) -> CGPoint {
        CGPoint(x: lhs.x - rhs.width , y: lhs.y - rhs.height)
    }
    
    static func *(lhs: Self, rhs: CGFloat) -> CGPoint {
        CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    static func /(lhs: Self, rhs: CGFloat) -> CGPoint {
        CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    

}


extension CGSize {
    var center: CGPoint {
        CGPoint(x: width / 2, y: height / 2)
    }
    
    static func +(lhs: Self, rhs: Self) -> CGSize {
        CGSize(width: lhs.width + rhs.width , height: lhs.height + rhs.height)
    }
    
    static func -(lhs: Self, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width - rhs.width , height: lhs.height - rhs.height)
    }
    
    static func *(lhs: Self, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
    
    static func /(lhs: Self, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
    }
    

}
