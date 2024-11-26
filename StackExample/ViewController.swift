//
//  ViewController.swift
//  StackExample
//
//  Created by Omar Ashraf on 25/11/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var undoStack = Stack<String>()
    var redoStack = Stack<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        textView.text = ""
        undoStack.removeAll()
        redoStack.removeAll()
    }
    
    
    @IBAction func undoButtonPressed(_ sender: UIButton) {
        textView.text = undoStack.pop()
        redoStack.push(element: textView.text!)
    }
    
    
    @IBAction func redoButtonPressed(_ sender: UIButton) {
        textView.text = redoStack.pop()
        undoStack.push(element: textView.text!)
    }
    
    //    @IBAction func saveButtonPressed(_ sender: UIButton) {
    //        stack.push(element: textView.text!)
    //    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.endEditing(true)
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text!.last == " " {
            undoStack.push(element: textView.text!)
        }
    }
}

//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        return true
//    }
//}
