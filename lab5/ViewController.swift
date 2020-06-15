//
//  ViewController.swift
//  lab5
//
//  Created by Tina Andria on 25/04/2020.
//  Copyright © 2020 Tina Andria. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: URL(string: "https://bing.com")!)
        webView.load(request)
        webView.navigationDelegate = self
        webAddress.delegate = self
    }
    
    let homePage = "https://apple.com"

    @IBOutlet weak var webAddress: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func goBack(_ sender: Any) {
        if (webView.canGoBack == true) {
            webView.goBack()
        }
    }
    
    @IBAction func goForward(_ sender: Any) {
        if (webView.canGoForward == true) {
            webView.goForward()
        }
    }

    @IBAction func goHome(_ sender: Any) {
        let request = URLRequest(url: URL(string: homePage)!)
        webView.load(request)
    }

    @IBAction func goTo(_ sender: Any) {
        if webAddress.text == "" {
            let title = "ERROR"
            let message = "You must provide some URL to go!"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        } else {
            goTo()
        }
    }
    
    func goTo() {
        if (webAddress.text?.hasPrefix("https://") == false) {
            let prefix = "https://"
            webAddress.text = prefix + webAddress.text!
        }
        let request = URLRequest(url: URL(string: webAddress.text!)!)
        webView.load(request)
        webAddress.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard
        goTo()
        return true
    }
}
