//
//  MapHitController.swift
//  TTR
//
//  Created by Christopher Hight on 5/30/17.
//  Copyright © 2017 Chris Hight. All rights reserved.
//

import UIKit

class MapHitController: UIImageView {

   
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let touchPoint = touch?.location(in: self) {
            let colorAtPOS = getPixelRGB(touchPoint)
            print("\(colorAtPOS)")
        }

    }
    
    //built from https://stackoverflow.com/questions/25146557/how-do-i-get-the-color-of-a-pixel-in-a-uiimage-with-swift
    func getPixelRGB(_ point : CGPoint) -> String {
        
        //pull image size large and small
        let orgImage = #imageLiteral(resourceName: "USMapHitDetection").cgImage!
        let imageData = orgImage.dataProvider?.data
        let data = CFDataGetBytePtr(imageData)!

        let hitImage = self.bounds
        
        let xCalculated = Int(Double(point.x / hitImage.size.width) * Double(orgImage.width))
        let yCalculated = Int(Double(point.y / hitImage.size.height) * Double(orgImage.height))

        let pixelPOS = (((orgImage.width * yCalculated) + xCalculated) * 2)
        
        let r = String(format:"%2X", data[pixelPOS])
        let g = String(format:"%2X", data[pixelPOS+2])
        let b = String(format:"%2X", data[pixelPOS+4])
        //let a = String(format:"%2X", data[pixelPOS+6])
        
        return (r+g+b)
    }

}











