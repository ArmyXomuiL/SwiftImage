//
//  Reductions.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

private func extentFilter(_ name: String) -> (_ extent: CGRect) -> Filter {
    return { extent in
        return { image in
            let parameters : CIParameters = [
                "inputExtent":CIVector(cgRect:extent),
                kCIInputImageKey: image]
            let filter = CIFilter(name:"CIAreaAverage", withInputParameters:parameters)
            return filter!.outputImage!
        }
    }
}

public func areaAverage(_ extent: CGRect) -> Filter { return extentFilter("CIAreaAverage")(extent)}

public func areaHistogram(_ extent: CGRect, count: Int, scale: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputExtent":CIVector(cgRect:extent),
            kCIInputImageKey: image,
            "inputCount": count as AnyObject,
            "inputScale": scale as AnyObject
        ]
        let filter = CIFilter(name:"CIAreaHistogram", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func rowAverage(_ extent: CGRect) -> Filter {return extentFilter("CIRowAverage")(extent)}

public func columnAverage(_ extent: CGRect) -> Filter {return extentFilter("CIColumnAverage")(extent)}

public func histogramDisplayFilter(_ height: Float, highLimit: Float, lowLimit: Float) -> Filter {
    return { image in
        let parameters : CIParameters = [
            "inputHighLimit":highLimit as AnyObject,
            "inputLowLimit":lowLimit as AnyObject,
            "inputHeight": height as AnyObject,
            kCIInputImageKey: image,
        ]
        let filter = CIFilter(name:"CIHistogramDisplayFilter", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

public func areaMaximum(_ extent: CGRect) -> Filter {return extentFilter("CIAreaMaximum")(extent)}

public func areaMinimum(_ extent: CGRect) -> Filter {return extentFilter("CIAreaMinimum")(extent)}

public func areaMaximumAlpha(_ extent: CGRect) -> Filter {return extentFilter("CIAreaMaximumAlpha")(extent)}

public func areaMinimumAlpha(_ extent: CGRect) -> Filter {return extentFilter("CIAreaMinimumAlpha")(extent)}

