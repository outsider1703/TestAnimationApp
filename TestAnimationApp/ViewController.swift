//
//  ViewController.swift
//  TestAnimationApp
//
//  Created by Macbook on 17.06.2020.
//  Copyright © 2020 Igor Simonov. All rights reserved.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet var nameAnimationLabel: UILabel!
    @IBOutlet var presentationView: SpringView!
    
    var animations = Anime.setOfAnimations()
    
    private let primaryColor = UIColor(
        red: 121/255,
        green: 9/255,
        blue: 9/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        presentationView.layer.cornerRadius = presentationView.frame.width / 2
        
    }
    
    @IBAction func startAnimationButton(_ sender: SpringButton) {
        for animation in animations.shuffled() {
            presentationView.animation = animation.animation
            presentationView.curve = animation.curve
            presentationView.force = 2
            presentationView.duration = 1
            presentationView.animate()
            
            nameAnimationLabel.text = "Preset: \(animation.animation). Curve: \(animation.curve)."
            }
        }
    }
}

extension ViewController {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}



