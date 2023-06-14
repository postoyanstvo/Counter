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
    @IBOutlet weak var backgroundGradientView: UIView!
    
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
        
        addButton.titleLabel?.text = "+"
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 100)
        
        deductButton.titleLabel?.text = "-"
        deductButton.titleLabel?.font = UIFont.systemFont(ofSize: 100)
        
        resetButton.titleLabel?.text = "0"
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        
        textView.text = "История изменений:" + "\n"
        
        setBackground()
    }
    
    // Set gradient background
    private func setBackground() {
        view.backgroundColor = .white
        navigationItem.title = "Gradient View"

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [#colorLiteral(red: 0.9764705882, green: 0.5960784314, blue: 0.2901960784, alpha: 0.4039993791).cgColor, #colorLiteral(red: 0.9764705882, green: 0.7568627451, blue: 0.2901960784, alpha: 0.1489807533).cgColor]
        gradientLayer.locations = [0.0, 1.0]

        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)

        gradientLayer.frame = view.frame
        backgroundGradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // Scroll text in textView if added new line
    func scrollTextViewToBottom(textView: UITextView) {
        if textView.text.count > 0 {
            let location = textView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            textView.scrollRangeToVisible(bottom)
        }
    }
    
    // Actions with bottons
    @IBAction func addOneToCounter(_ sender: Any) {
        // Increase counter value by 1 and show value by label
        counterValue += 1
        countLabel.text = "Значение счётчика: \(counterValue)"
        textView.text += "\(currentDateTimeStamp): значение изменено на +1" + "\n"
        scrollTextViewToBottom(textView: textView)
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
        scrollTextViewToBottom(textView: textView)
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        // Reset counter and show value by label
        counterValue = 0
        countLabel.text = "0"
        textView.text += "\(currentDateTimeStamp): значение сброшено" + "\n"
        scrollTextViewToBottom(textView: textView)
    }
}

