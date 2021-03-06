//
//  Gradients.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

public func gaussianGradient(_ color0: UIColor, color1: UIColor, radius: Float) -> Filter {
    return { _ in
        let parameters = [
            "inputColor0": CIColor(cgColor: color0.cgColor),
            "inputColor1": CIColor(cgColor: color1.cgColor),
            kCIInputRadiusKey: radius
        ] as [String : Any]
        let filter = CIFilter(name:"CIGaussianGradient", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func linearGradient(_ color0: UIColor, color1: UIColor, point0: CGPoint, point1: CGPoint) -> Filter {
    return { _ in
        let parameters = [
            "inputColor0": CIColor(cgColor: color0.cgColor),
            "inputColor1": CIColor(cgColor: color1.cgColor),
            "inputPoint0": CIVector(cgPoint: point0),
            "inputPoint1": CIVector(cgPoint: point1)
        ]
        let filter = CIFilter(name:"CILinearGradient", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func radialGradient(_ color0: UIColor, color1: UIColor, radius0: Float, radius1: Float, center: CGPoint) -> Filter {
    return { _ in
        let parameters = [
            "inputColor0": CIColor(cgColor: color0.cgColor),
            "inputColor1": CIColor(cgColor: color1.cgColor),
            "inputradius0": radius0,
            "inputRadius1": radius1,
            "inputCenter": CIVector(cgPoint: center)
        ] as [String : Any]
        let filter = CIFilter(name:"CIRadialGradient", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func smoothLinearGradient(_ color0: UIColor, color1: UIColor, point0: CGPoint, point1: CGPoint) -> Filter {
    return { _ in
        let parameters = [
            "inputColor0": CIColor(cgColor: color0.cgColor),
            "inputColor1": CIColor(cgColor: color1.cgColor),
            "inputPoint0": CIVector(cgPoint: point0),
            "inputPoint1": CIVector(cgPoint: point1)
        ]
        let filter = CIFilter(name:"CISmoothLinearGradient", withInputParameters: parameters)
        return filter!.outputImage!
    }
}
