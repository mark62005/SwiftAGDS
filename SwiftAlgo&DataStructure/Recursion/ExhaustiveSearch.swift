//
//  ExhaustiveSearch.swift
//  SwiftAlgo&DataStructure
//
//  Created by Mark Wong on 2022-03-07.
//

import Foundation

// 1
/// Print all binary number representation with n digits
///  - Parameter n: the number of digits
func printBinaryExhaustive(_ n: Int) {
  printBinaryExhaustiveHelper(n)
}

private func printBinaryExhaustiveHelper(_ n: Int, soFar: String = "", indent: String = "") {
  print("\(indent)printBinaryExhaustiveHelper(\(n), soFar: \(soFar))")
  // base case
  if n == 0 {
    print("\(indent)\(soFar)")
  }
  
  // recursive case
  else {
    // for each available choices (0 or 1)
    // choose one
    printBinaryExhaustiveHelper(n - 1, soFar: soFar + "0", indent: indent + "  ")
    printBinaryExhaustiveHelper(n - 1, soFar: soFar + "1", indent: indent + "  ")
    // search again
  }
}

// Time complexity: O(n^2)

// 2
func printDecimal(_ n: Int, soFar: String = "") {
  // base case
  if n == 0 {
    print(soFar)
  }
  
  // recursive case
  else {
    for i in 0..<10 {
      printDecimal(n - 1, soFar: soFar + "\(i)")
    }
  }
}

// Time complexity: O(n^10)

// 3
func permutation(_ word: String) {
  permutationHelper(word)
}

private func permutationHelper(_ word: String, _ soFar: String = "") {
  // base case
  if word.count == 0 {
    print(soFar)
  }
  
  // recursive case
  else {
    for i in 0..<word.count {
      let c = word[i].lowercased()  // choose one character
      //                move to next character
      permutationHelper(word[0, i] + word[i + 1, word.count], soFar + c)
    }
  }
}

// Time complexity: O(n!)

func permutationUnique(_ word: String) {
  var set = Set<String>()
  permutationUniqueHelper(word, &set)
  
  for word in set {
    print(word)
  }
}

private func permutationUniqueHelper(_ word: String, soFar: String = "", _ set: inout Set<String>) {
  // base case
  if word.count == 0 {
    set.insert(soFar)
  }
  
  // recursive case
  else {
    for i in 0..<word.count {
      let c = word[i].lowercased()  // choose one character
      //                move to next character
      permutationUniqueHelper(word[0, i] + word[i + 1, word.count], soFar: soFar + c, &set)
    }
  }
}
