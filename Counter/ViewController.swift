//
//  ViewController.swift
//  Counter
//
//  Created by Константин Букин on 11.06.2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deductButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    private var counterValue: Int = 0
    private var currentDateTimeStamp: String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d/M/yy HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set initial properties
        countLabel.text = "0"
        
        addButton.tintColor = .red
        addButton.titleLabel?.text = "+"
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        
        deductButton.titleLabel?.text = "-"
        deductButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        
        resetButton.titleLabel?.text = "0"
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        
        textView.text = "История изменений:" + "\n"
        textView.layer.borderWidth = 0.5
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 10.0
    }

    @IBAction func addOneToCounter(_ sender: Any) {
        // Increase counter value by 1 and show value by label
        counterValue += 1
        countLabel.text = "Значение счётчика: \(counterValue)"
        textView.text += "\(currentDateTimeStamp): значение изменено на +1" + "\n"
    }
    @IBAction func deductOneFromCounter(_ sender: Any) {
        // Decrease counter value by 1 and show value by label
        if counterValue > 0 {
            counterValue -= 1
            countLabel.text = "Значение счётчика: \(counterValue)"
            textView.text += "\(currentDateTimeStamp): значение изменено на -1" + "\n"
        } else {
            textView.text += "\(currentDateTimeStamp): попытка уменьшить значение счётчика ниже 0" + "\n"
        }
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        // Reset counter and show value by label
        counterValue = 0
        countLabel.text = "0"
        textView.text += "\(currentDateTimeStamp): значение сброшено" + "\n"
    }
}

