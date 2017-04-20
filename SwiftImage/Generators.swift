//
//  Generators.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

public func colorGenerator(_ color: UIColor) -> Filter {
    return { _ in
        let filter = CIFilter(name:"CIConstantColorGenerator", withInputParameters: [kCIInputColorKey: CIColor(color: color)])
        return filter!.outputImage!
    }
}

public func checkerboardGenerator(_ color0: UIColor, color1: UIColor, width: Float, sharpness: Float) -> Filter {
    return { _ in
        let parameters = [
            "inputColor0": CIColor(cgColor: color0.cgColor),
            "inputColor1": CIColor(cgColor: color1.cgColor),
            "inputWidth": width,
            "inputSharpness":sharpness
        ] as [String : Any]
        let filter = CIFilter(name:"CICheckerboardGenerator", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func lenticularHalogGenerator(_ center: CGPoint, color: UIColor, haloRadius: Float, haloWidth: Float, haloOverlap: Float, striationStrength: Float, striationContrast: Float, time: Float) -> Filter {
    return { _ in
        let parameters = [
            kCIInputColorKey: CIColor(color: color),
            "inputHaloWidth": haloWidth,
            "inputHaloOverlap": haloOverlap,
            "inputStriationStrength": striationStrength,
            "inputStriationContrast": striationContrast,
            "inputTime": time
        ] as [String : Any]
        let filter = CIFilter(name:"CILenticularHaloGenerator", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public enum CICorrectionLevel {
    case low
    case medium
    case q
    case high
}

public func QRCodeGenerator(_ message: String, correctionLevel: CICorrectionLevel) -> Filter {
    return { _ in
        var correctionLevelString :String
        switch correctionLevel {
        case .low :
            correctionLevelString = "L"
        case .medium:
            correctionLevelString = "M"
        case .q:
            correctionLevelString = "Q"
        case .high:
            correctionLevelString = "H"
        }
        let parameters = [
            "inputMessage":message,
            "inputCorrectionLevel":correctionLevelString]
        let filter = CIFilter(name:"CIQRCodeGenerator", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func randomGenerator() -> Filter { return singularFilter("CIRandomGenerator") }

public func starShineGenerator(_ center: CGPoint, color: UIColor, radius: Float, crossScale: Float, crossAngle: Float, crossOpacity: Float, crossWidth: Float, epsilon: Float) -> Filter {
    return { _ in
        let parameters = [
            kCIInputCenterKey: CIVector(cgPoint: center),
            kCIInputColorKey: CIColor(cgColor:color.cgColor),
            kCIInputRadiusKey: radius,
            "inputCrossScale": crossScale,
            "inputCrossAngle": crossAngle,
            "inputCrossOpacity": crossOpacity,
            "inputCrossWidth": crossWidth,
            "inputEpsilon": epsilon,
        ] as [String : Any]
        let filter = CIFilter(name:"CIStarShineGenerator", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func stripesGenerator(_ color0: UIColor, color1: UIColor, width: Float, sharpness: Float) -> Filter {
    return { _ in
        let parameters = [
            "inputColor0": CIColor(cgColor: color0.cgColor),
            "inputColor1": CIColor(cgColor: color1.cgColor),
            "inputWidth": width,
            "inputSharpness":sharpness
        ] as [String : Any]
        let filter = CIFilter(name:"CICStripesGenerator", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func sunbeamGenerator(_ center: CGPoint, color: UIColor, sunRadius: Float, maxStriationRadius: Float, striationStrength: Float, striationContrast: Float, time: Float) -> Filter {
    return { _ in
        let parameters = [
            kCIInputColorKey: CIColor(cgColor:color.cgColor),
            kCIInputCenterKey: CIVector(cgPoint: center),
            "inputSunRadius": sunRadius,
            "inputMaxStriationRadius": maxStriationRadius,
            "inputStriationStrength": striationStrength,
            "inputStriationContrast": striationContrast,
            "inputTime": time
        ] as [String : Any]
        let filter = CIFilter(name:"CISunbeamGenerator", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

