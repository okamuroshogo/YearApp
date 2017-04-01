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
        if UIApplication.shared.supportsAlternateIcons { return }
        let alert = UIAlertController(
            title: "この端末には対応していません",
            message: "iOS 10.3以降にあげていただくと切り替えることができます",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func onClick(_ sender: UIButton) {
        self.isHeisei = sender == self.heisei ? true : false
        self.switchIcon()
    }

    private func switchIcon() {
        let heisei = self.isHeisei ? UIImage(named: "HeiseiTap") : UIImage(named: "Heisei")
        let seireki = self.isHeisei ? UIImage(named: "Seireki") : UIImage(named: "SeirekiTap")
        self.heisei.setImage(heisei, for: .normal)
        self.seireki.setImage(seireki, for: .normal)
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


