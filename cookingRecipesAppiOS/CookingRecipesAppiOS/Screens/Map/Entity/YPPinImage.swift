//
//  YPPinImage.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 11/03/23.
//

import UIKit

class YPPinImage: UIImage {
    convenience init?(named name: String) {
        self.init(cgImage: CPIcon.of(.icPoint)!.cgImage!)
    }
    override func withRenderingMode(_ renderingMode: UIImage.RenderingMode) -> UIImage {
        return self
    }
}
