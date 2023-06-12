//
//  ViewController.swift
//  Counter
//
//  Created by Константин Букин on 11.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    private var counterValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set initial values and font size of button text
        countLabel.text = "0"
        addButton.titleLabel?.text = "+ 1"
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    }


    @IBAction func addOneToCounter(_ sender: Any) {
        // Increase counter value by 1 and show value by label
        counterValue += 1
        countLabel.text = "Значение счётчика: \(counterValue)"
    }
}

