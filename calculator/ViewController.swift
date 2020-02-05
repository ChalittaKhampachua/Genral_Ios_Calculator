//
//  ViewController.swift
//  test
//
//  Created by Chatam8n5 on 29/1/2563 BE.
//  Copyright © 2563 Chatam8n5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMutiply: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnInvert: UIButton!
    @IBOutlet weak var btnExponent: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var lbAnswer: UILabel!
    @IBOutlet weak var lbHistory: UILabel!
    var textNumber = ""    // 1 + 1 | 1 - 1 | ...
    var valueNumber = ""   // 1 | 11 | 111 | ...
    var currentValue:Float = 0
    var key = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn0.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btn1.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btn2.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btn3.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btn4.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btn5.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btn6.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btn7.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btn8.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btn9.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btnEqual.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btnPlus.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btnMinus.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btnMutiply.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btnDivide.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btnInvert.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btnExponent.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
        btnClear.addTarget(self, action: #selector(buttonClickEvent), for: UIControl.Event.touchUpInside)
    }

    @objc func buttonClickEvent(btn:UIButton) {
        switch btn {
        case btn0:
            textNumber = textNumber + "0"
            valueNumber = valueNumber + "0"
            lbAnswer.text = textNumber
        case btn1:
            textNumber = textNumber + "1"
            valueNumber = valueNumber + "1"
            lbAnswer.text = textNumber
        case btn2:
            textNumber = textNumber + "2"
            valueNumber = valueNumber + "2"
            lbAnswer.text = textNumber
        case btn3:
            textNumber = textNumber + "3"
            valueNumber = valueNumber + "3"
            lbAnswer.text = textNumber
        case btn4:
            textNumber = textNumber + "4"
            valueNumber = valueNumber + "4"
            lbAnswer.text = textNumber
        case btn5:
            textNumber = textNumber + "5"
            valueNumber = valueNumber + "5"
            lbAnswer.text = textNumber
        case btn6:
            textNumber = textNumber + "6"
            valueNumber = valueNumber + "6"
            lbAnswer.text = textNumber
        case btn7:
            textNumber = textNumber + "7"
            valueNumber = valueNumber + "7"
            lbAnswer.text = textNumber
        case btn8:
            textNumber = textNumber + "8"
            valueNumber = valueNumber + "8"
            lbAnswer.text = textNumber
        case btn9:
            textNumber = textNumber + "9"
            valueNumber = valueNumber + "9"
            lbAnswer.text = textNumber
        case btnEqual:
            print("valueNumber: ", valueNumber)
            if valueNumber == "" {
                textNumber = ""
                currentValue = 0
                lbHistory.text = textNumber + "="
                lbAnswer.text = "0"
            }else{
                lbHistory.text = textNumber + "="
                let isNum = Float(valueNumber) ?? 0
                textNumber = calculator(num: isNum)
                lbAnswer.text = textNumber
            }
        case btnPlus:
            let isNum = Float(valueNumber) ?? 0
            setTextCalculator(isNum:isNum, sign: "+", isKey: "plus")
            
        case btnMinus :
            let isNum = Float(valueNumber) ?? 0
            setTextCalculator(isNum:isNum, sign: "-", isKey: "minus")
            
        case btnMutiply:
            let isNum = Float(valueNumber) ?? 1
            setTextCalculator(isNum:isNum, sign: "×", isKey: "mutiply")
            
        case btnDivide:
            let isNum = Float(valueNumber) ?? 1
            setTextCalculator(isNum:isNum, sign: "÷", isKey: "divide")

        case btnInvert:
            key = "invert"
            let isNum = Float(valueNumber) ?? 0
            if isNum > 0 {
                textNumber = "-" + textNumber
                valueNumber = "-" + valueNumber
            }else{
                textNumber = textNumber.replacingOccurrences(of: "-", with: "")
                valueNumber = valueNumber.replacingOccurrences(of: "-", with: "")
            }
            lbAnswer.text = textNumber

        case btnExponent:
             key = "exponent"
             currentValue = Float(Int(textNumber) ?? 0)
             textNumber = textNumber + "^"
             valueNumber = ""
             lbAnswer.text = textNumber
            
        case btnClear:
            lbAnswer.text = "0"
            textNumber = ""
            valueNumber = ""
            currentValue = 0
            
        default:
            textNumber = textNumber + ""
            lbAnswer.text = textNumber
        }
    }
    
    func calculator(num:Float) -> String{
        let answer:Float = calculatorValue(num: num)
        valueNumber = ""
        textNumber = ""
        print("answer: ", answer)
        if answer - floor(answer) > 0.000001 {
            return String(answer) //float
        }else{
            return String(Int(answer)) // decimal
        }
    }
    
    func calculatorValue(num: Float) -> Float{
        var answer:Float = 0
        if key == "plus" {
            answer = currentValue + num
        }
        else if key == "minus" {
            answer = currentValue - num
        }
        else if key == "mutiply" {
            answer = currentValue * num
        }
        else if key == "divide" {
            answer = currentValue / num
        }
        else if key == "percent" {
            print("currentValue: ", currentValue)
            print("num: ", num)
            answer = currentValue * num / 100
            print("answer percent: ", answer)
        }
        else if key == "exponent" {
            let expo = Int(valueNumber) ?? 0
            print("expo: ", expo)
            answer = currentValue  //round 1
            for _ in 2...expo where expo > 0 {
                answer = answer * currentValue
                print("expo answer : ", answer)
            }
        }
        else{
            answer = num
        }
        currentValue = answer
        print("currentValue: ", currentValue)
        return answer
    }
    
    func setTextCalculator(isNum: Float, sign: String, isKey: String){
        textNumber = textNumber + sign
        print("old currentValue : ", currentValue)
        if currentValue == 0 {
            currentValue = Float(isNum)
        }
        else{
            print("old valueNumber : ", valueNumber)
            if valueNumber != ""{
                _ = calculatorValue(num: isNum)
            }
        }
        key = isKey
        valueNumber = ""
        lbAnswer.text = textNumber
    }
}

