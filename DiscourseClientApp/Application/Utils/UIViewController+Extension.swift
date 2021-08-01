//
//  UIViewController+Extension.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 15/7/21.
//

import UIKit
extension UIViewController {
    func showAlert(title: String, message:String, actionTitle: String = "Ok") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func showLoader() {
        let loaderView = UIView(frame: CGRect(x:0,y:0, width: view.frame.width, height: view.frame.height))
        loaderView.tag = 387
        loaderView.backgroundColor = .white
        
        let loader = UIActivityIndicatorView(frame: CGRect(x:0, y:0, width: 60, height: 30))
        loader.center = loaderView.center
        loader.style = .large
        loader.color = .black
        loader.startAnimating()
        
        loaderView.addSubview(loader)
        view.addSubview(loaderView)
    }
    
    func hideLoader() {
        view.viewWithTag(387)?.removeFromSuperview()
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
