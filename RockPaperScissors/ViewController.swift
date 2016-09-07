//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Neil Cai on 9/7/16.
//  Copyright © 2016 Neil,Cai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var rps = Rps()
    
    @IBOutlet weak var lableUp: NSTextField!
    
    @IBOutlet weak var lableDown: NSTextField!
    
    @IBAction func Scissor(sender: AnyObject) {
        rps.setStatus(.Scissor)
        judgement()
    }
    @IBAction func Rock(sender: AnyObject) {
        rps.setStatus(.Rock)
        judgement()
    }
    @IBAction func Paper(sender: AnyObject) {
        rps.setStatus(.Paper)
        judgement()
    }
    @IBAction func again(sender: AnyObject) {
        resetall()
    }
    //全局初始化
    func resetall(){
        lableUp.stringValue = ""
        lableDown.stringValue = ""
        rps.setStatus(nil)
    }
    //判斷輸贏
    func judgement (){
        let randomrps = rps.randomRps()
        let currentStat = rps.getStatus()
        let result = rps.compare(currentStat, anotherRpsStat: randomrps)
        screen(result, stat: currentStat, anotherStat: randomrps)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    //控制顯示的方法
    func screen(result:Int, stat:Rps.Stats, anotherStat:Rps.Stats){
        var resultStrint = ""
        var statString = ""
        var anotherString = ""
        
        switch result{
        case 0 :
            resultStrint = "loss"
        case 1 :
            resultStrint = "win"
        case 2 :
            resultStrint = "tie"
        default :
            break
        }
        
        switch stat{
        case .Rock:
            statString = "👊"
        case.Scissor:
            statString = "✌️"
        case.Paper:
            statString = "✋"
        }
        
        switch anotherStat{
        case .Rock:
            anotherString = "👊"
        case.Scissor:
            anotherString = "✌️"
        case.Paper:
            anotherString = "✋"
        }
        
        lableUp.stringValue = "You" + resultStrint + "!"
        lableDown.stringValue = "You" + statString + ",but computer" + anotherString + "!"
    }

}

