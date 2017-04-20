//
//  AbstractConstructors.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/15/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

// MARK: - Abstract Filter Generators

func singularFilter(_ filterName: String) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:filterName, withInputParameters: parameters)
        return filter!.outputImage!
    }
}

typealias Overlay = (CIImage) -> Filter

func overlayFilter(_ filterName: String) -> Overlay {
    return {overlay in
        return { image in
            let parameters : CIParameters = [
                kCIInputBackgroundImageKey: image,
                kCIInputImageKey: overlay
            ]
            let filter = CIFilter(name:filterName, withInputParameters: parameters)
            return filter!.outputImage!
        }
    }
}

func radiusFilter(_ name: String) -> (_ radius: Float) -> Filter {
    return { radius in
        return { image in
            let parameters : CIParameters = [kCIInputRadiusKey: radius as AnyObject, kCIInputImageKey: image]
            let filter = CIFilter(name:name, withInputParameters:parameters)
            return filter!.outputImage!
        }
    }
}

func radiusIntensityFilter(_ name: String) -> (_ radius: Float, _ intensity :Float) -> Filter {
    return { radius, intensity in
        return { image in
            let parameters : CIParameters = [
                kCIInputRadiusKey:radius as AnyObject,
                kCIInputIntensityKey:intensity as AnyObject,
                kCIInputImageKey: image]
            let filter = CIFilter(name:name, withInputParameters:parameters)
            return filter!.outputImage!
        }
    }
}

func centerRadiusFilter(_ name: String) -> (_ center :CGPoint, _ radius: Float) -> Filter {
    return { center, radius in
        return { image in
            let parameters : CIParameters = [
                kCIInputRadiusKey:radius as AnyObject,
                kCIInputCenterKey:CIVector(cgPoint:center),
                kCIInputImageKey: image]
            let filter = CIFilter(name:name, withInputParameters:parameters)
            return filter!.outputImage!
        }
    }
}

func convolutionFixedFilter(_ name: String) -> (_ weights: CIVector, _ bias :Float) -> Filter {
    return { weights, bias in
        return { image in
            let parameters : CIParameters = [
                "inputWeights": weights,
                "inputBias": bias as AnyObject,
                kCIInputImageKey: image
            ]
            let filter = CIFilter(name:name, withInputParameters: parameters)
            return filter!.outputImage!
        }
    }
}
