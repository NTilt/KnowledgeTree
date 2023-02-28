//
//  AnotherFunctions.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import Foundation
import SwiftUI

//тут в будущем исправить хард код
func getLevel(count countDots: Int, _ magnification: Int) -> Int {
    if magnification == 3 {
        if countDots <= 11 {
            return 1
        }
        else if countDots <= 17 && countDots > 11 {
            return 2
        }
        else if countDots <= 23 && countDots > 17 {
            return 3
        }
    }
    else if magnification == 2 {
        if countDots <= 7 {
            return 1
        }
        else if countDots <= 11 && countDots > 7 {
            return 2
        }
        else if countDots <= 15 && countDots > 11 {
            return 3
        }
    }
    //print("НАПОМИНАЛКА ЧТО ХАРКОД!")
    return 1
}

func convertVertexCoordinates(_ location: (x: Float, y: Float), in geometry: GeometryProxy) -> CGPoint {
    let center = geometry.frame(in: .local).center
    return CGPoint (
        x: center.x + CGFloat(location.x),
        y: center.y + CGFloat(location.y)
    )
}

func getCoordinates (_ firstLocation: (x: Float, y: Float), _ secondLocation: (x: Float, y: Float), _ quarter: Int) -> (Float, Float, Float, Float) {
    let a = max(firstLocation.x, secondLocation.x) - min(firstLocation.x, secondLocation.x)
    let b = max(firstLocation.y, secondLocation.y) - min(firstLocation.y, secondLocation.y)
    var vertexFromX: Float = 0
    var vertexFromY: Float = 0
    var vertexToX: Float = 0
    var vertexToY: Float = 0
    let c = Int(sqrt(Double(a*a + b*b)))
    let r: Float = 76
    let offsetY: Float = Float(Int(b) * Int(r) / Int(c))
    let offsetX: Float = Float(sqrt(Float(r * r) - offsetY*offsetY))
    if quarter == 1 {
        vertexFromX = firstLocation.x + offsetX
        vertexFromY = firstLocation.y - offsetY
        vertexToX = secondLocation.x - offsetX
        vertexToY = secondLocation.y + offsetY
    }
    else if quarter == 2 {
        vertexFromX = firstLocation.x - offsetX
        vertexFromY = firstLocation.y - offsetY
        vertexToX = secondLocation.x + offsetX
        vertexToY = secondLocation.y + offsetY
    }
    else if quarter == 3 {
        vertexFromX = firstLocation.x - offsetX
        vertexFromY = firstLocation.y + offsetY
        vertexToX = secondLocation.x + offsetX
        vertexToY = secondLocation.y - offsetY
    }
    else if quarter == 4 {
        vertexFromX = firstLocation.x + offsetX
        vertexFromY = firstLocation.y + offsetY
        vertexToX = secondLocation.x - offsetX
        vertexToY = secondLocation.y - offsetY
    }
    
    return (vertexFromX, vertexFromY, vertexToX, vertexToY)
}

func getGeometricQuarter(_ firstVertex: (x: Float, y: Float), _ secondVertex: (x: Float, y: Float)) -> Int {
    
    let offsetSecondVertex = (secondVertex.x - firstVertex.x, secondVertex.y -
                              firstVertex.y)
    if (offsetSecondVertex.0 < 0 && offsetSecondVertex.1 < 0) {
        return 2
    }
    else if (offsetSecondVertex.0 > 0 && offsetSecondVertex.1 < 0) {
        return 1
    }
    else if (offsetSecondVertex.0 < 0 && offsetSecondVertex.1 > 0) {
        return 3
    }
    else {
        return 4
    }
}

/**
 This function determines the minimum required magnification in order to accommodate all points.
 - Parameter countDots: Number of points to place
 - Returns: Minimum required magnification
 */

func getMagnification(count countDots: Int) -> Int {
    var magnification: Int = 1
    if countDots <= 4 {
        magnification =  1
    }
    else if countDots > 4 && countDots <= 8 {
        magnification = 2
    }
    else if countDots > 8 && countDots <= 12 {
        magnification = 3
    }
    else if countDots > 12 && countDots <= 16 {
        magnification = 4
    }
    return magnification
}
