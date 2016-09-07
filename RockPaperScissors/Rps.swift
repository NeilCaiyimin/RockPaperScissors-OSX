//
//  Rps.swift
//  RockPaperScissors
//
//  Created by Neil Cai on 9/7/16.
//  Copyright © 2016 Neil,Cai. All rights reserved.
//

import Foundation

struct Rps {
    private var stat:Stats!
    
    enum Stats {
        case Rock
        case Scissor
        case Paper
    }
    func getStatus() -> Stats{
        return stat
    }
    
    mutating func setStatus(stats:Stats!){
        stat = stats
    }
    
    // 設定一個隨機的手勢
    func randomRps() -> Stats {
        let randomNumber = arc4random_uniform(3)
        var randomStat:Stats!
        switch randomNumber {
        case 0:
            randomStat = .Rock
        case 1:
            randomStat = .Scissor
        case 2:
            randomStat = .Paper
        default:
            break
        }
        
        return randomStat
    }
    
    func compare (aRpsStats: Stats , anotherRpsStat: Stats) -> Int{
        //返回三種狀態, 0為前者輸, 1為前者贏 , 2為平局。
        var result:Int!
        
        switch aRpsStats {
        case .Rock :
            switch anotherRpsStat{
            case .Rock :
                result = 2
            case.Scissor :
                result = 1
            case .Paper:
                result = 0
            }
        case .Scissor :
            switch anotherRpsStat{
            case .Rock :
                result = 0
            case.Scissor :
                result = 2
            case .Paper:
                result = 1
            }
        case .Paper :
            switch anotherRpsStat{
            case .Rock :
                result = 1
            case.Scissor :
                result = 0
            case .Paper:
                result = 2
            }
            
        }
        
        return result
        
    }
}