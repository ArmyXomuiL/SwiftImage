//
//  ColorAdjustmentFilters.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

// MARK: - CICategoryColorAdjustment

public func colorClamp(_ minComponents: UIColor, maxComponents: UIColor) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputMaxComponents": CIVector(color:maxComponents),
            "inputMinComponents": CIVector(color:minComponents),
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorClamp", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func colorControls(_ saturation: CGFloat, brightness: CGFloat, contrast: CGFloat) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputSaturationKey: saturation as AnyObject,
            kCIInputBrightnessKey: brightness as AnyObject,
            kCIInputContrastKey: contrast as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorControls", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func colorMatrix(_ r: UIColor, g: UIColor, b: UIColor, a: UIColor, bias: UIColor) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputRVector": CIVector(color: r),
            "inputGVector": CIVector(color: g),
            "inputBVector": CIVector(color: b),
            "inputAVector": CIVector(color: a),
            "inputBiasVector": CIVector(color: bias),
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorControls", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func colorPolynomial(_ r: CIVector, g: CIVector, b: CIVector, a: CIVector) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputRedCoefficients": r,
            "inputGreenCoefficients": g,
            "inputBlueCoefficients": b,
            "inputAlphaCoefficients": a,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIColorPolynomial", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func exposureAdjust(_ EV: Double) -> Filter {
    return { image in
        let parameters : CIParameters = [kCIInputEVKey: EV as AnyObject, kCIInputImageKey: image]
        let filter = CIFilter(name:"CIExposureAdjust", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func gammaAdjust(_ power: Double) -> Filter {
    return { image in
        let parameters : CIParameters = ["inputPower": power as AnyObject, kCIInputImageKey: image]
        let filter = CIFilter(name:"CIGammaAdjust", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func hueAdjust(_ angle: Double) -> Filter {
    return { image in
        let parameters : CIParameters = [kCIInputAngleKey: angle as AnyObject, kCIInputImageKey: image]
        let filter = CIFilter(name:"CIHueAdjust", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func linearToSRGBToneCurve() -> Filter {return singularFilter("CILinearToSRGBToneCurve")}

public func SRGBToneCurveToLinear() -> Filter {return singularFilter("CISRGBToneCurveToLinear")}

public func temperatureAndTint(_ neutral: CIVector, targetNeutral: CIVector) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputNeutral": neutral,
            "inputTargetNeutral": targetNeutral,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CITemperatureAndTint", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func toneCurve(_ point0: CIVector, point1: CIVector, point2: CIVector, point3: CIVector, point4: CIVector) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputPoint0": point0,
            "inputPoint1": point1,
            "inputPoint2": point2,
            "inputPoint3": point3,
            "inputPoint4": point4,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIToneCurve", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func vibrance(_ amount: Double) -> Filter {
    return { image in
        let parameters : CIParameters = ["inputAmount": amount as AnyObject, kCIInputImageKey: image]
        let filter = CIFilter(name:"CIVibrance", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func whitePointAdjust(_ color: UIColor) -> Filter {
    return { image in
        let parameters : CIParameters = [kCIInputColorKey: CIColor(cgColor: color.cgColor), kCIInputImageKey: image]
        let filter = CIFilter(name:"CIWhitePointAdjust", withInputParameters:parameters)
        return filter!.outputImage!
    }
}
