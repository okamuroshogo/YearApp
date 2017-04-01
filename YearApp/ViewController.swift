//
//  ViewController.swift
//  YearApp
//
//  Created by shogo okamuro on 2017/04/01.
//  Copyright © 2017 ro.okamu. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var seireki: UIButton!
    @IBOutlet weak var heisei: UIButton!
    private var isHeisei = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.switchIcon()

    }


    @IBAction func onClick(_ sender: UIButton) {
        self.isHeisei = sender == self.heisei ? true : false
        self.switchIcon()
    }

    private func switchIcon() {
        self.heisei.layer.borderColor = self.isHeisei ? UIColor.black.cgColor : UIColor.clear.cgColor
        self.seireki.layer.borderColor = self.isHeisei ? UIColor.clear.cgColor : UIColor.black.cgColor
    }
    
    @IBAction func setIcon(_ sender: Any) {
        let iconName: String = self.isHeisei ? "Heisei" : "Seireki"
        UIApplication.shared.setAlternateIconName(iconName, completionHandler: { error in
            let alert = UIAlertController(
                title: "アイコンを設定しました",
                message: "ホームボタンで修了すると確認できます",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true, completion: nil)
        })
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
}

