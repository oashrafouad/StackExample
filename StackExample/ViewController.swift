//
//  ViewController.swift
//  StackExample
//
//  Created by Omar Ashraf on 25/11/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var stack = Stack<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        textView.text = ""
    }
    
    
    @IBAction func undoButtonPressed(_ sender: UIButton) {
        textView.text = stack.pop()
    }
    
    //    @IBAction func saveButtonPressed(_ sender: UIButton) {
    //        stack.push(element: textView.text!)
    //    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text!.last == " " {
            stack.push(element: textView.text!)
        }
    }
}
