//
//  DistortionFilters.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

public func bumpDistortion(_ center: CGPoint, radius: Float, scale: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputRadiusKey:radius as AnyObject,
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputScaleKey:scale as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIBumpDistortion", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func bumpDistortionLinear(_ center: CGPoint, radius: Float, angle:Float, scale: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputRadiusKey:radius as AnyObject,
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputAngleKey:angle as AnyObject,
            kCIInputScaleKey:scale as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIBumpDistortionLinear", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func circleSplashDistortion(_ center: CGPoint, radius: Float) -> Filter {
    return centerRadiusFilter("CICircleSplashDistortion")(center, radius)
}

public func circularWrap(_ center: CGPoint, radius: Float, angle:Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputRadiusKey:radius as AnyObject,
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputAngleKey:angle as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CICircularWrap", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func droste(_ insertionPoint0: CGPoint, insertionPoint1: CGPoint, strands: Float, periodicity :Float, rotation :Float, zoom :Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputInsertionPoint0":CIVector(cgPoint: insertionPoint0),
            "inputInsertionPoint1":CIVector(cgPoint: insertionPoint1),
            "inputStrands":strands as AnyObject,
            "inputPeriodicity":periodicity as AnyObject,
            "inputRotation":rotation as AnyObject,
            "inputZoom":zoom as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIDroste", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func displacementDistortion(_ displacementImage: CIImage, scale :Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputDisplacementImage":displacementImage,
            kCIInputScaleKey:scale as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIDisplacementDistortion", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func glassDistortion(_ texture: CIImage, center: CGPoint, scale :Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputTexture":texture,
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputScaleKey:scale as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIGlassDistortion", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func glassLozenge(_ point0: CGPoint, point1: CGPoint, radius :Float, refraction :Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputPoint0":CIVector(cgPoint:point0),
            "inputPoint1":CIVector(cgPoint:point1),
            kCIInputRadiusKey:radius as AnyObject,
            "inputRefraction":refraction as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIGlassLozenge", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func holeDistortion(_ center: CGPoint, radius: Float) -> Filter {
    return centerRadiusFilter("CIHoleDistortion")(center, radius)
}

public func lightTunnel(_ center: CGPoint, radius: Float, rotation:Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputRadiusKey:radius as AnyObject,
            kCIInputCenterKey:CIVector(cgPoint:center),
            "inputRotation":rotation as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CILightTunnel", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func pinchDistortion(_ center: CGPoint, radius: Float, scale:Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputRadiusKey:radius as AnyObject,
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputScaleKey:scale as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIPinchDistortion", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

func stretchCrop(_ size: CGSize, cropAmount: Float, centerStretchAmount: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputSize":CIVector(x: size.width, y: size.height),
            "inputCropAmount":cropAmount as AnyObject,
            "inputCenterStretchAmount":centerStretchAmount as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIStretchCrop", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func torusLensDistortion(_ center: CGPoint, radius: Float, width: Float, refraction: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputRadiusKey:radius as AnyObject,
            kCIInputWidthKey:width as AnyObject,
            "inputRefraction": refraction as AnyObject]
        let filter = CIFilter(name:"CITorusLensDistortion", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func twirlDistortion(_ center: CGPoint, radius: Float, angle:Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputRadiusKey:radius as AnyObject,
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputAngleKey:angle as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CITwirlDistortion", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func vortexDistortion(_ center: CGPoint, radius: Float, angle:Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            kCIInputRadiusKey:radius as AnyObject,
            kCIInputCenterKey:CIVector(cgPoint:center),
            kCIInputAngleKey:angle as AnyObject,
            kCIInputImageKey: image]
        let filter = CIFilter(name:"CIVortexDistortion", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

