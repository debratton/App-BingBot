//
//  ViewController.swift
//  App-BingBot
//
//  Created by David E Bratton on 9/30/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var showsLbl: UILabel!
    @IBOutlet weak var randomShowLbl: UILabel!
    @IBOutlet weak var bingeBotSpokenLbl: UILabel!
    @IBOutlet weak var addShowTxt: UITextField!
    @IBOutlet weak var addShowBtn: UIButton!
    @IBOutlet weak var whatToBingeBtn: UIButton!
    @IBOutlet weak var randomShowSV: UIStackView!
    @IBOutlet weak var addShowSV: UIStackView!
    @IBOutlet weak var showsSV: UIStackView!
    
    // DECLARE EMPTY ARRAY OR TYPE STRING
    var shows: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsSV.isHidden = true
        randomShowSV.isHidden = true
        addShowBtn.isEnabled = false
    }
    
 
    @IBAction func addShowTxtChanged(_ sender: UITextField) {
        if sender.text! != "" {
            addShowBtn.isEnabled = true
        } else {
            addShowBtn.isEnabled = false
        }
    }
    
    @IBAction func whatToBingeBtnPressed(_ sender: Any) {
        randomShowLbl.text = shows.randomElement()
        randomShowLbl.isHidden = false
        bingeBotSpokenLbl.isHidden = false
    }
    
    func updateShowsLbl() {
        showsLbl.text = shows.joined(separator: ", ")
    }
    
    @IBAction func addShowBtnPressed(_ sender: Any) {
        guard let showName = addShowTxt.text else {return}
        shows.append(showName)
        addShowTxt.text = ""
        addShowBtn.isEnabled = false
        updateShowsLbl()
        showsSV.isHidden = false
        
        if shows.count >= 2 {
            randomShowSV.isHidden = false
            randomShowLbl.isHidden = true
            bingeBotSpokenLbl.isHidden = true
        }
    }
}

