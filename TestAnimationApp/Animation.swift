//
//  File.swift
//  TestAnimationApp
//
//  Created by Macbook on 17.06.2020.
//  Copyright © 2020 Igor Simonov. All rights reserved.
//

struct Anime {
    let animation: String
    let curve: String
    
  static func setOfAnimations() -> [Anime] {
        var setAnimations: [Anime] = []

        for (valuePreset, valueCurve) in zip(AnimationPreset.allCases, AnimationCurve.allCases)  {
            let animation = Anime(animation: valuePreset.rawValue, curve: valueCurve.rawValue)
            setAnimations.append(animation)
        }
        return setAnimations
    }
}

