//
//  BlurFilters.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

// MARK: - CICategoryBlur

@available(iOS, unavailable)
public func boxBlur(_ radius: Float) -> Filter {return radiusFilter("CIBoxBlur")(radius)}

@available(iOS, unavailable)
public func discBlur(_ radius: Float) -> Filter {return radiusFilter("CIDiscBlur")(radius)}

@available(iOS, unavailable)
public func medianBlur(_ radius: Float) -> Filter {return radiusFilter("CIMedianBlur")(radius)}

@available(iOS, unavailable)
public func motionBlur(_ radius: Float, angle: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [kCIInputRadiusKey: radius as AnyObject, kCIInputAngleKey: angle as AnyObject, kCIInputImageKey: image]
        let filter = CIFilter(name:"CIMotionBlur", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

@available(iOS, unavailable)
public func noiseReduction(_ inputNoiseLevel: Float, inputSharpness: Float) -> Filter {
    return { image in
        let parameters : CIParameters = ["inputNoiseLevel": inputNoiseLevel as AnyObject, "inputSharpness": inputSharpness as AnyObject, kCIInputImageKey: image]
        let filter = CIFilter(name:"CIMotionBlur", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func gaussianBlur(_ radius: Float) -> Filter {return radiusFilter("CIGaussianBlur")(radius)}
