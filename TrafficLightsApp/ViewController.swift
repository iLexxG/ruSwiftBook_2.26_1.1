//
//  ViewController.swift
//  TrafficLightsApp
//
//  Created by Alex Golyshkov on 01.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var switchLightButton: UIButton!
    @IBOutlet var lightsViews: Array<UIView>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for view in lightsViews {
            view.layer.cornerRadius = 50
            view.alpha = 0.3
        }
    }
    
    @IBAction func switchLightButtonPressed() {
        let currentLight = (
            lightsViews.filter {$0.alpha == 1}.isEmpty == false ?
            lightsViews.filter {$0.alpha == 1} :
                [greenLightView]
        )
        
        switchLightButton.setTitle("NEXT", for: .normal)
        
        switch currentLight[0] {
        case redLightView:
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
            
        case yellowLightView:
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
        
        case greenLightView:
            greenLightView.alpha = 0.3
            redLightView.alpha = 1
            
        default:
            break
        }
        
    }
}
