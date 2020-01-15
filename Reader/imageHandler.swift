//
//  imageHandler.swift
//  Reader
//
//  Created by Jorge Gonzalez-Heredia on 1/10/20.
//  Copyright © 2020 Jorge Gonzalez-Heredia. All rights reserved.
//
import CoreGraphics
import Foundation

class imageHandler {
    let width: Int
    let height: Int
    let context: CGContext

    init(img: CGImage) {

        width = img.width
        height = img.height

        let bitmapBytesPerRow = width * 4

        let colorSpace = CGColorSpaceCreateDeviceRGB()

        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)

        context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bitmapBytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!

        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.draw(context as! CGImage, in: rect, byTiling: img as! Bool)
    }

}
