//
//  imageHandler.swift
//  Reader
//
//  Created by Jorge Gonzalez-Heredia on 1/10/20.
//  Copyright © 2020 Jorge Gonzalez-Heredia. All rights reserved.
//
import CoreGraphics
import Foundation
import UIKit

class imageHandler {
    let width: Int
    let height: Int
    let context: CGContext

    init(img: CGImage) {
        print("initializer")
        width = img.width
        height = img.height
        
        //one byte per color ARGB
        let bitmapBytesPerRow = width * 4

        let colorSpace = CGColorSpaceCreateDeviceRGB()

        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)

        context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bitmapBytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!

        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.draw(img, in: rect, byTiling: false)
        print("context created")
        
        print(color_at(x: 700, y: 700))
        print(width,height)
        
    }
    func color_at(x: Int, y: Int)->(UInt8?, UInt8?, UInt8?, UInt8?) {

        assert(0<=x && x<width)
        assert(0<=y && y<height)

        let data = UnsafeRawBufferPointer(start:context.data,count: width * height)
        
        let offset = 4 * (y * width + x)

        let alpha = data[offset]
        let red = data[offset+1]
        let green = data[offset+2]
        let blue = data[offset+3]

        let color = (red, green, blue, alpha)
        return color
    }

}
