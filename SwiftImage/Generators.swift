//
//  Generators.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

func colorGenerator(color: UIColor) -> Filter {
    return { _ in
        let filter = CIFilter(name:"CIConstantColorGenerator", withInputParameters: [kCIInputColorKey: CIColor(color: color)!])
        return filter.outputImage
    }
}

func checkerboardGenerator(color0: UIColor, color1: UIColor, width: Float, sharpness: Float) -> Filter {
    return { _ in
        let parameters = [
            "inputColor0": CIColor(CGColor: color0.CGColor),
            "inputColor1": CIColor(CGColor: color1.CGColor),
            "inputWidth": width,
            "inputSharpness":sharpness
        ]
        let filter = CIFilter(name:"CICheckerboardGenerator", withInputParameters: parameters)
        return filter.outputImage
    }
}

func lenticularHalogGenerator(center: CGPoint, color: UIColor, haloRadius: Float, haloWidth: Float, haloOverlap: Float, striationStrength: Float, striationContrast: Float, time: Float) -> Filter {
    return { _ in
        let parameters = [
            kCIInputColorKey: CIColor(color: color)!,
            "inputHaloWidth": haloWidth,
            "inputHaloOverlap": haloOverlap,
            "inputStriationStrength": striationStrength,
            "inputStriationContrast": striationContrast,
            "inputTime": time
        ]
        let filter = CIFilter(name:"CILenticularHaloGenerator", withInputParameters: parameters)
        return filter.outputImage
    }
}

enum CICorrectionLevel {
    case Low
    case Medium
    case Q
    case High
}

func QRCodeGenerator(message: String, correctionLevel: CICorrectionLevel) -> Filter {
    return { _ in
        var correctionLevelString :String
        switch correctionLevel {
        case .Low :
            correctionLevelString = "L"
        case .Medium:
            correctionLevelString = "M"
        case .Q:
            correctionLevelString = "Q"
        case .High:
            correctionLevelString = "H"
        }
        let parameters = [
            "inputMessage":message,
            "inputCorrectionLevel":correctionLevelString]
        let filter = CIFilter(name:"CIQRCodeGenerator", withInputParameters: parameters)
        return filter.outputImage
    }
}

func randomGenerator() -> Filter {
    return singularFilter("CIRandomGenerator")
}

func starShineGenerator(center: CGPoint, color: UIColor, radius: Float, crossScale: Float, crossAngle: Float, crossOpacity: Float, crossWidth: Float, epsilon: Float) -> Filter {
    return { _ in
        let parameters = [
            kCIInputCenterKey: CIVector(CGPoint: center),
            kCIInputColorKey: CIColor(CGColor:color.CGColor),
            kCIInputRadiusKey: radius,
            "inputCrossScale": crossScale,
            "inputCrossAngle": crossAngle,
            "inputCrossOpacity": crossOpacity,
            "inputCrossWidth": crossWidth,
            "inputEpsilon": epsilon,
        ]
        let filter = CIFilter(name:"CIStarShineGenerator", withInputParameters: parameters)
        return filter.outputImage
    }
}

func stripesGenerator(color0: UIColor, color1: UIColor, width: Float, sharpness: Float) -> Filter {
    return { _ in
        let parameters = [
            "inputColor0": CIColor(CGColor: color0.CGColor),
            "inputColor1": CIColor(CGColor: color1.CGColor),
            "inputWidth": width,
            "inputSharpness":sharpness
        ]
        let filter = CIFilter(name:"CICStripesGenerator", withInputParameters: parameters)
        return filter.outputImage
    }
}

func sunbeamGenerator(center: CGPoint, color: UIColor, sunRadius: Float, maxStriationRadius: Float, striationStrength: Float, striationContrast: Float, time: Float) -> Filter {
    return { _ in
        let parameters = [
            kCIInputColorKey: CIColor(CGColor:color.CGColor),
            kCIInputCenterKey: CIVector(CGPoint: center),
            kCIInputRadiusKey: radius,
            "inputMaxStriationRadius": maxStriationRadius,
            "inputStriationStrength": striationStrength,
            "inputStriationContrast": striationContrast,
            "inputTime": time
        ]
        let filter = CIFilter(name:"CISunbeamGenerator", withInputParameters: parameters)
        return filter.outputImage
    }
}
