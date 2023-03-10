//
//  YPLoader.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit
import Lottie

public class YPLoader {
    static internal var lottieAnimationLoader: LottieAnimationView?
    static private var isLoading: Bool = false
    static private var tagLoader: Int = 1000

    public static func show() {
        if !isLoading {
            isLoading = true
            createView()
        }
    }
    public static func createView() {
        if !isLoading {
            return
        }
        lottieAnimationLoader?.removeFromSuperview()
        lottieAnimationLoader = nil
        lottieAnimationLoader = LottieAnimationView(name: "loader_d")
        lottieAnimationLoader?.contentMode = .scaleAspectFit
        lottieAnimationLoader?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        lottieAnimationLoader?.backgroundBehavior = .pauseAndRestore
        lottieAnimationLoader?.loopMode = .loop
        lottieAnimationLoader?.play()
        lottieAnimationLoader?.tag = tagLoader
        if let lottieAnimation = lottieAnimationLoader {
            DispatchQueue.main.async {
                UIApplication.shared.currentWindow?.addSubview(lottieAnimation)
                UIApplication.shared.currentWindow?.bringSubviewToFront(lottieAnimation)
            }
        }
    }
    public static func hide()  {
        isLoading = false
        DispatchQueue.main.async {
            if let tagView = UIApplication.shared.currentWindow?.viewWithTag(tagLoader)  {
                tagView.removeFromSuperview()
            }
            lottieAnimationLoader?.stop()
            lottieAnimationLoader?.removeFromSuperview()
            lottieAnimationLoader = nil
        }
    }
}
