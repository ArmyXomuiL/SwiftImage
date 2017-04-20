//
//  HalftoneEffect.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

public func circularScreen(_ center: CGPoint, width: Float, sharpness: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputWidthKey:width as AnyObject,
            kCIInputCenterKey:CIVector(cgPoint:center),
            "inputSharpness":sharpness as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CICircularScreen", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func CMYKHalftone(_ center: CGPoint, width: Float, angle: Float, sharpness: Float, grayComponentReplacement: Float, underColorRemoval: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputWidthKey:width as AnyObject,
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputAngleKey:width as AnyObject,
            "inputSharpness":sharpness as AnyObject,
            "inputCGR":grayComponentReplacement as AnyObject,
            "inputUCR":underColorRemoval as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CICMYKHalftone", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func dotScreen(_ center: CGPoint, width: Float, angle: Float, sharpness: Float) -> Filter {
    return screen("CIDotScreen")(center, width, angle, sharpness)
}

public func hatchedScreen(_ center: CGPoint, width: Float, angle: Float, sharpness: Float) -> Filter {
    return screen("CIHatchedScreen")(center, width, angle, sharpness)
}

public func lineScreen(_ center: CGPoint, width: Float, angle: Float, sharpness: Float) -> Filter {
    return screen("CILineScreen")(center, width, angle, sharpness)
}

private func screen(_ name: String) -> (_ center: CGPoint, _ width: Float, _ angle: Float, _ sharpness: Float) -> Filter {
    return { center, width, angle, sharpness in
        return { image in
            let parameters : CIParameters = [
                kCIInputWidthKey:width as AnyObject,
                kCIInputCenterKey:CIVector(cgPoint:center),
                kCIInputAngleKey:width as AnyObject,
                "inputSharpness":sharpness as AnyObject,
                kCIInputImageKey: image]
            let filter = CIFilter(name:name, withInputParameters:parameters)
            return filter!.outputImage!
        }
    }
}
