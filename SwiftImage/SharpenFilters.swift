//
//  SharpenFilters.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

public func sharpenLuminance(_ sharpness: Float) -> Filter {
    return { image in
        let parameters = [
            kCIInputImageKey:image,
            kCIInputSharpnessKey:sharpness
        ] as [String : Any]
        return CIFilter(name:"CISharpenLuminance", withInputParameters:parameters)!.outputImage!
    }
}

public func unsharpMask(_ radius: Float, intensity: Float) -> Filter {
    return radiusIntensityFilter("CIUnsharpMask")(radius, intensity)
}
