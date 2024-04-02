//
//  ViewController.swift
//  counter.
//
//  Created by Герасичев Сергей on 02.04.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyField.isEditable = false
    }

    @IBOutlet weak var counterText: UILabel!
    @IBOutlet weak var counterValue: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func decreaseButton(_ sender: Any) {
        
        if counterNumber > 0 {
            counterNumber -= 1
            updateValue()
            addToHistory(change: "-1")
        } else {
        let dateTime = getCurrentDateTime()
            
        historyField.text.append("\n\(dateTime): попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func increaseButton(_ sender: Any) {
        counterNumber += 1
        updateValue()
        addToHistory(change: "+1")
    }
    
    @IBAction func clearButton(_ sender: Any) {
        counterNumber = 0
        updateValue()
        
        let dateTime = getCurrentDateTime()
        historyField.text.append("\n\(dateTime): значение сброшено")
    }
    
    private var counterNumber = 0
    
    private func updateValue() {
        counterValue.text = "\(counterNumber)"
    }
    
    @IBOutlet weak var historyField: UITextView!
    
    private func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        return formatter.string(from: Date())
    }
    
    private func addToHistory (change: String) {
        let dateTime = getCurrentDateTime()
        
        historyField.text.append("\n\(dateTime): значение изменено на \(change)")
    }
}

