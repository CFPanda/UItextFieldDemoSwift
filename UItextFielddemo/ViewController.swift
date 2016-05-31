//
//  ViewController.swift
//  UItextFielddemo
//
//  Created by duanchuanfen on 16/5/27.
//  Copyright © 2016年 duanchuanfen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName.keyboardType = UIKeyboardType.Default
        self.userName.clearButtonMode  = UITextFieldViewMode.WhileEditing
        self.passWord.keyboardType = UIKeyboardType.NumberPad
        self.passWord.clearButtonMode = UITextFieldViewMode.WhileEditing
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == passWord{
            passWord.becomeFirstResponder()
        }
        
        if textField == userName{
            userName.becomeFirstResponder()
        }
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == passWord{
            passWord.resignFirstResponder()
        }
        
        if textField == userName{
            userName.resignFirstResponder()
        }
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == passWord{
            passWord.resignFirstResponder()
        }
        
        if textField == userName{
            userName.resignFirstResponder()
        }
        
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        passWord.resignFirstResponder()
        userName.resignFirstResponder()
    }
    //限制用户名只能输入字母,密码框只能输入数字
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var res = true
        
        
        //用户名只能输入字母
        if textField == userName{
            let tmSet = NSCharacterSet(charactersInString:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXWZ")
            var i = 0
            while i < string.characters.count {
                let string1:NSString = (string as NSString).substringWithRange(NSMakeRange(i, 1))
                let range = string1.rangeOfCharacterFromSet(tmSet)
                if (range.length == 0) {
                    res = false
                    break;
                }
                i++
            }
        }
        
        //密码框只能输入数字
        if textField == passWord{
            let tmSet = NSCharacterSet(charactersInString:"0123456789")
            var i = 0
            while i < string.characters.count {
                let string1:NSString = (string as NSString).substringWithRange(NSMakeRange(i, 1))
                let range = string1.rangeOfCharacterFromSet(tmSet)
                if (range.length == 0) {
                    res = false
                    break;
                }
                i++
            }
        }
        return res
    }
    
}

