//
//  Recursion.swift
//  SwiftAlgo&DataStructure
//
//  Created by Mark Wong on 2022-03-02.
//

import Foundation

func factorial(n: Int) -> Int {
  if n == 0 {
    return 1
  }
  return factorial(n: n - 1) * n
}

func mystery(n: Int) -> Int {
  if (n < 10) {
    return n;
  }
  let a = n / 10;
  let b = n % 10;
  return (mystery(n: a + b))
}

func power(base: Int, exponent: Int) -> Int {
  // base case
  if exponent == 0 {
    return 1
  }
  
  // recursive case
  return power(base: base, exponent: exponent - 1) * base
}

func isPalindrome(word: String) -> Bool {
  // base case
  if word.count <= 1 {
    return true
  }
  
  // recursive case
  if word[0] != word[word.count - 1] {
    return false
  }
  
  return isPalindrome(word: word[1, word.count - 1])
}

func printBinary(_ n: Int) {
  // base case
  if n < 0 {
    print("-", terminator: "")
    printBinary(-n)
  }
  
  if n <= 1 {
    print(n, terminator: "")
    return
  }
  
  // recursive case
  printBinary(n / 2)
  print(n % 2, terminator: "")
}

// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want
func reverseLines(_ line: Int) {
  let contents = try! String(contentsOfFile: "/Users/markwong/Desktop/WMAD/Algorithms & Data Structures/SwiftAlgo&DataStructure/SwiftAlgo&DataStructure/Recursion/story.txt")
  let lines = contents.split(separator: "\n")
  
  if line < lines.count {
    reverseLines(line + 1)
    print(lines[line])
  }
}

/**
 * 5. evaluate
 *
 * Write a recurive function evaluate that accepts a String
 * representing a math expression  and compute its value.
 * - The expression will be fully parenthesized and will consist of + & * on single-digit integers only.
 * - You can user a helper function. (Do not change the function header)
 * - Recursion
 *
 * evaluate ("7")
 */
func evaluate(expression: String) -> Int {
  // iterator
  var i = 0
  //                                    memory address of this var
  return evaluateHelper(expression, i: &i)
}

//                                      memory address of this var
private func evaluateHelper(_ expr: String, i: inout Int) -> Int {
  
  // base case
  if Character(expr[i]).isNumber {
    return Int(expr[i])!
  }
  
  // recursive case
  else {
    i += 1                                  // skip (
    let left = evaluateHelper(expr, i: &i)   // num or expr
    i += 1
    let op = expr[i]                        // + or *
    i += 1
    let right = evaluateHelper(expr, i: &i)  // num expr
    i += 1                                  // skip )
    
    if op == "+" {
      return left + right
    } else {
      return right + left
    }
  }
  
}
