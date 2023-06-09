//
//  ViewController.swift
//  UpDownGame
//
//  Created by kokori on 2023/04/13.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
    }
    
    @IBAction func sldierValueChanged( sender: UISlider){
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(message: String){
        
        let alert = UIAlertController(title:nil,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion:nil)
    }
    
    @IBAction func touchUpHitButton( sender: UIButton){
        print(slider.value)
        
        //hit버튼을 눌렀을 때 슬라이더의 위치 미세 조정
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        //hit버튼을 눌렀을 때 몇번 시도했는지 보여줄 tryCount 수정
        tryCount = tryCount + 1
        //tryCountLabel.text = String(tryCount) + " / 5"
        tryCountLabel.text = "\(tryCount) / 5"
        
        //맞췄는지 비교
        if randomValue == hitValue {
            //print("YOU HIT!!")
            showAlert(message: "YOU HIT!!")
            reset()
        } else if tryCount >= 5 {
            //print("YOU LOSE...")
            showAlert(message: "YOU LOSE...")
            reset()
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton( sender:UIButton){
        print("touch up reset button")
        reset()
    }
    
    func reset(){
        print("reset!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
        
    }


}

