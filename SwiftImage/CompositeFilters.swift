//
//  CompositeFilters.swift
//  SwiftImage
//
//  Created by Fabian Canas on 12/14/14.
//  Copyright (c) 2014 Fabián Cañas. All rights reserved.
//

import Foundation

public func additionCompositing   (_ overlay: CIImage) -> Filter {return overlayFilter("CIAdditionCompositing")   (overlay)}
public func colorBlendMode        (_ overlay: CIImage) -> Filter {return overlayFilter("CIColorBlendMode")        (overlay)}
public func colorBurnBlendMode    (_ overlay: CIImage) -> Filter {return overlayFilter("CIColorBurnBlendMode")    (overlay)}
public func colorDodgeBlendMode   (_ overlay: CIImage) -> Filter {return overlayFilter("CIColorDodgeBlendMode")   (overlay)}
public func darkenBlendMode       (_ overlay: CIImage) -> Filter {return overlayFilter("CIDarkenBlendMode")       (overlay)}
public func differenceBlendMode   (_ overlay: CIImage) -> Filter {return overlayFilter("CIDifferenceBlendMode")   (overlay)}
public func exclusionBlendMode    (_ overlay: CIImage) -> Filter {return overlayFilter("CIExclusionBlendMode")    (overlay)}
public func hardLightBlendMode    (_ overlay: CIImage) -> Filter {return overlayFilter("CIHardLightBlendMode")    (overlay)}
public func hueBlendMode          (_ overlay: CIImage) -> Filter {return overlayFilter("CIHueBlendMode")          (overlay)}
public func lightenBlendMode      (_ overlay: CIImage) -> Filter {return overlayFilter("CILightenBlendMode")      (overlay)}
public func luminosityBlendMode   (_ overlay: CIImage) -> Filter {return overlayFilter("CILuminosityBlendMode")   (overlay)}
public func maximumCompositing    (_ overlay: CIImage) -> Filter {return overlayFilter("CIMaximumCompositing")    (overlay)}
public func minimumCompositing    (_ overlay: CIImage) -> Filter {return overlayFilter("CIMinimumCompositing")    (overlay)}
public func multiplyBlendMode     (_ overlay: CIImage) -> Filter {return overlayFilter("CIMultiplyBlendMode")     (overlay)}
public func multiplyCompositing   (_ overlay: CIImage) -> Filter {return overlayFilter("CIMultiplyCompositing")   (overlay)}
public func overlayBlendMode      (_ overlay: CIImage) -> Filter {return overlayFilter("CIOverlayBlendMode")      (overlay)}
public func saturationBlendMode   (_ overlay: CIImage) -> Filter {return overlayFilter("CISaturationBlendMode")   (overlay)}
public func screenBlendMode       (_ overlay: CIImage) -> Filter {return overlayFilter("CIScreenBlendMode")       (overlay)}
public func softLightBlendMode    (_ overlay: CIImage) -> Filter {return overlayFilter("CISoftLightBlendMode")    (overlay)}
public func sourceAtopCompositing (_ overlay: CIImage) -> Filter {return overlayFilter("CISourceAtopCompositing") (overlay)}
public func sourceInCompositing   (_ overlay: CIImage) -> Filter {return overlayFilter("CISourceInCompositing")   (overlay)}
public func sourceOutCompositing  (_ overlay: CIImage) -> Filter {return overlayFilter("CISourceOutCompositing")  (overlay)}
public func sourceOverCompositing (_ overlay: CIImage) -> Filter {return overlayFilter("CISourceOverCompositing") (overlay)}
