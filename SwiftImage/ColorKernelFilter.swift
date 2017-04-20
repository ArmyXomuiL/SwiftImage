//
//  ColorKernelFilter.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/21/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import CoreImage

open class ColorKernelFilter: CIFilter {
    var kernelString :String
    lazy var kernel :CIColorKernel = {
        return CIColorKernel(string: self.kernelString)
        }()!
    
    var inputImage: CIImage?
    
    init(kernel: String) {
        kernelString = kernel
        super.init()
    }
    
    required public init(coder aDecoder: NSCoder) {
        kernelString = ""
        super.init(coder: aDecoder)!
        if let k = aDecoder.decodeObject(forKey: "SwiftImageKernelStringKey") as? String {
            kernelString = k
        }
    }
    
    override open func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(kernelString, forKey: "SwiftImageKernelStringKey")
    }
  
    func resultImage() -> CIImage? {
        if inputImage == nil {
            return nil
        }
        return kernel.apply(withExtent: inputImage!.extent, arguments: [inputImage!])
    }
}

