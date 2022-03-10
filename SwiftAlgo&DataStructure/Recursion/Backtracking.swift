//
//  Backtracking.swift
//  SwiftAlgo&DataStructure
//
//  Created by Mark Wong on 2022-03-07.
//

import Foundation

// 1
func rollDice(_ n: Int) {
  var choices = [Int]()
  rollDiceHelper(n, choices: &choices)
}

private func rollDiceHelper(_ n: Int, choices: inout [Int]) {
  // base case
  if n == 0 {
    print(choices)
  }
  
  // recursive case
  else {
    for i in 1...6 {
      // choose one number
      choices.append(i)
      // explore
      rollDiceHelper(n - 1, choices: &choices)
      
      // unchoose the last choice
      choices.removeLast()
    }
  }
}


// 2
func rollDiceSumNaive(_ dice: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelperNaive(dice, sum, choices: &choices)
}

private func rollDiceSumHelperNaive(_ dice: Int, _ sum: Int, choices: inout [Int]) {
  // base case
  if dice == 0 {
    if sum == 0 {
      print(choices)
    }
  }
  
  // recursive case
  else {
    for i in 1...6 {
      // choose one number
      choices.append(i)
      // explore
      //                           subtract sum with your current choice
      rollDiceSumHelperNaive(dice - 1, sum - i, choices: &choices)
      
      // unchoose the last choice
      choices.removeLast()
    }
  }
}

var count = 0
func rollDiceSum(_ dice: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelper(dice, sum, choices: &choices)
}

private func rollDiceSumHelper(_ dice: Int, _ sum: Int, _ currentSum: Int = 0, choices: inout [Int]) {
  count += 1
  // base case
  if dice == 0 {
    if currentSum == sum {
      print(choices)
    }
  }
  
  // recursive case
  else {
    for i in 1...6 {
      // choose one number
      if currentSum + i + 1 * (dice - 1) <= sum && currentSum + i + 6 * (dice - 1) >= sum {
        choices.append(i)
        // explore
        //                           subtract sum with your current choice
        rollDiceSumHelper(dice - 1, sum, currentSum + i, choices: &choices)
        
        // unchoose the last choice
        choices.removeLast()
      }
      
      
    }
  }
}
