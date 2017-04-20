//
//  ColorEffectFilters.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

// MARK: - CICategoryColorEffect

public func colorCrossPolynomial(_ redCoefficients: CIVector, greenCoefficients: CIVector, blueCoefficients: CIVector) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputRedCoefficients": redCoefficients,
            "inputGreenCoefficients": greenCoefficients,
            "inputBlueCoefficients": blueCoefficients,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorCrossPolynomial", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func colorCube(_ dimension: Int, cube: Data) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputCubeDimension": dimension as AnyObject,
            "inputCubeData": cube as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorCube", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func colorCubeWithColorSpace(_ dimension: Int, cube: Data, colorSpace: CGColorSpace) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputCubeDimension": dimension as AnyObject,
            "inputCubeData": cube as AnyObject,
            "inputColorSpace": colorSpace,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorCubeWithColorSpace", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func colorInvert() -> Filter {return singularFilter("CIColorInvert")}

public func colorMap(_ gradientImage: CIImage) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputGradientImage":gradientImage,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorMap", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func colorMonochrome(_ color: UIColor, intensity: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputColorKey:CIColor(cgColor:color.cgColor),
            kCIInputIntensityKey:intensity as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorMonochrome", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func colorPosterize(_ levels: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputLevels":levels as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorPosterize", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func falseColor(_ color0: UIColor, color1: UIColor) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputColor0":CIColor(cgColor:color0.cgColor),
            "inputColor1":CIColor(cgColor:color1.cgColor),
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIFalseColor", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func maskToAlpha() -> Filter {return singularFilter("CIMaskToAlpha")}

public func maximumComponent() -> Filter {return singularFilter("CIMaximumComponent")}

public func minimumComponent() -> Filter {return singularFilter("CIMinimumComponent")}

public func photoEffectChrome() -> Filter {return singularFilter("CIPhotoEffectChrome")}

public func photoEffectFade() -> Filter {return singularFilter("CIPhotoEffectFade")}

public func photoEffectInstant() -> Filter {return singularFilter("CIPhotoEffectInstant")}

public func photoEffectMono() -> Filter {return singularFilter("CIPhotoEffectMono")}

public func photoEffectNoir() -> Filter {return singularFilter("CIPhotoEffectNoir")}

public func photoEffectProcess() -> Filter {return singularFilter("CIPhotoEffectProcess")}

public func photoEffectTonal() -> Filter {return singularFilter("CIPhotoEffectTonal")}

public func photoEffectTransfer() -> Filter {return singularFilter("CIPhotoEffectTransfer")}

public func sepiaTone(_ intensity: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputIntensityKey:intensity as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CISepiaTone", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func vignette(_ radius: Float, intensity: Float) -> Filter {
    return radiusIntensityFilter("CIVignette")(radius, intensity)
}

func vignetteEffect(_ center: CGPoint, radius: Float, intensity: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputRadiusKey:radius as AnyObject,
            kCIInputIntensityKey:intensity as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIVignetteEffect", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

