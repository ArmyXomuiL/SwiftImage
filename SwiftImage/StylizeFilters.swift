//
//  StylizeFilters.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

public func blendWithAlphaMask(_ overlay: CIImage, maskImage: CIImage) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputMaskImageKey: maskImage,
            kCIInputBackgroundImageKey: image,
            kCIInputImageKey: overlay
        ]
        let filter = CIFilter(name:"CIBlendWithAlphaMask", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func blendWithMask(_ overlay: CIImage, maskImage: CIImage) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputMaskImageKey: maskImage,
            kCIInputBackgroundImageKey: image,
            kCIInputImageKey: overlay
        ]
        let filter = CIFilter(name:"CIBlendWithMask", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func bloom(_ radius: Float, intensity: Float) -> Filter {
    return radiusIntensityFilter("CIBloom")(radius, intensity)
}

public func comicEffect() -> Filter { return singularFilter("CIComicEffect") }

public func convolution3X3(_ weights: CIVector, bias: Float) -> Filter {
    return convolutionFixedFilter("CIConvolution3X3")(weights, bias)
}

public func convolution5X5(_ weights: CIVector, bias: Float) -> Filter {
    return convolutionFixedFilter("CIConvolution5X5")(weights, bias)
}

public func convolution7X7(_ weights: CIVector, bias: Float) -> Filter {
    return convolutionFixedFilter("CIConvolution7X7")(weights, bias)
}

public func convolution9Vertical(_ weights: CIVector, bias: Float) -> Filter {
    return convolutionFixedFilter("CIConvolution9Vertical")(weights, bias)
}

public func convolution9Horizontal(_ weights: CIVector, bias: Float) -> Filter {
    return convolutionFixedFilter("CIConvolution9Horizontal")(weights, bias)
}

public func crystalize(_ center: CGPoint, radius: Float) -> Filter {
    return centerRadiusFilter("CICrystalize")(center, radius)
}

public func depthOfField(_ point1: CGPoint, point2: CGPoint, saturation: Float, unsharpMaskRadius: Float, unsharpMaskIntensity: Float, radius: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputPoint1": CIVector(cgPoint:point1),
            "inputPoint2": CIVector(cgPoint:point2),
            kCIInputSaturationKey:saturation as AnyObject,
            "inputUnsharpMaskRadius":unsharpMaskRadius as AnyObject,
            "inputUnsharpMaskIntensity":unsharpMaskIntensity as AnyObject,
            kCIInputRadiusKey: radius as AnyObject,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:"CIDepthOfField", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func edges(_ intensity: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputIntensityKey: intensity as AnyObject,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:"CIEdges", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func edgeWork(_ radius: Float) -> Filter {
    return radiusFilter("CIEdgeWork")(radius)
}

public func gloom(_ radius: Float, intensity: Float) -> Filter {
    return radiusIntensityFilter("CIGloom")(radius, intensity)
}

public func heightFieldFromMask(_ radius: Float) -> Filter {
    return radiusFilter("CIHeightFieldFromMask")(radius)
}

public func hexagoanalPixellate(_ center: CGPoint, scale: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputScaleKey: scale as AnyObject,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:"CIHexagonalPixellate", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func highlightShadowAdjust(_ highlightAmount: Float, shadowAmount: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputHighlightAmount":highlightAmount as AnyObject,
            "inputshadowAmount": shadowAmount as AnyObject,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:"CIHighlightShadowAmount", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func lineOverlay(_ nrNoiseLevel: Float, nrSharpness: Float, edgeIntensity: Float, threshold: Float, contrast: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputNRNoiseLevel":nrNoiseLevel as AnyObject,
            "inputNRSharpness": nrSharpness as AnyObject,
            "inputEdgeIntensity":edgeIntensity as AnyObject,
            "inputThreshold":threshold as AnyObject,
            "inputContrast":contrast as AnyObject,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:"CILineOverlay", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func pixellate(_ center: CGPoint, scale: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputScaleKey: scale as AnyObject,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:"CIPixellate", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func pointilize(_ radius: Float, center: CGPoint) -> Filter {
    return centerRadiusFilter("CIPointilize")(center,radius)
}

public func shadedMaterial(_ shadingImage:CIImage, scale: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputShadingImage":shadingImage,
            kCIInputScaleKey: scale as AnyObject,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:"CIShadedMaterial", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func spotColor(
    _ centerColor1: CIColor, replacementColor1: CIColor, closeness1: Float, contrast1: Float,
    centerColor2: CIColor, replacementColor2: CIColor, closeness2: Float, contrast2: Float,
    centerColor3: CIColor, replacementColor3: CIColor, closeness3: Float, contrast3: Float
    ) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputCenterColor1":centerColor1,
            "inputReplacementColor1":replacementColor1,
            "inputCloseness1":closeness1 as AnyObject,
            "inputContrast1":contrast1 as AnyObject,
            
            "inputCenterColor2":centerColor2,
            "inputReplacementColor2":replacementColor2,
            "inputCloseness1":closeness2 as AnyObject,
            "inputContrast1":contrast2 as AnyObject,
            
            "inputCenterColor3":centerColor3,
            "inputReplacementColor3":replacementColor3,
            "inputCloseness1":closeness3 as AnyObject,
            "inputContrast1":contrast3 as AnyObject,
            
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:"CISpotColor", withInputParameters: parameters)
        return filter!.outputImage!
    }
}

public func spotLight(_ lightPosition:CIVector, lightPointsAt:CIVector, brightness:Float, concentration:Float, color:CIColor) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputLightPosition":lightPosition,
            "inputLightPointsAt":lightPointsAt,
            "inputConcentration":concentration as AnyObject,
            kCIInputBrightnessKey:brightness as AnyObject,
            kCIInputColorKey:color,
            kCIInputImageKey: image
        ]
        let filter = CIFilter(name:"CISpotColor", withInputParameters: parameters)
        return filter!.outputImage!
    }
}
