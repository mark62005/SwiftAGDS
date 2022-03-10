//
//  Sorting.swift
//  SwiftAlgo&DataStructure
//
//  Created by Mark Wong on 2022-03-10.
//

import Foundation

// Bubble Sort
// Time: O(n^2)
// Space: O(n)
func bubbleSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 0..<elements.count - 1 {
    for j in 1..<elements.count - i {
      if comparator(elements[j - 1], elements[j]) {
        let temp = elements[j - 1]
        elements[j - 1] = elements[j]
        elements[j] = temp
      }
    }
  }
  
  return elements
}


// Selection Sort (A bit faster than bubble sort technically)
// Time: O(n^2)
// Space: O(n)
func selectionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 0..<elements.count - 1 {
    var indexMin = i
    for j in i + 1..<elements.count {
      if comparator(elements[j], elements[indexMin]) {
        indexMin = j
      }
    }
    
    if i != indexMin {
      elements.swapAt(indexMin, i)
    }
  }
  
  return elements
}


// Insertion Sort
// Time: O(n^2)
// Space: O(n)
func insertionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  var elements = arr
  for i in 1..<elements.count {
    var j = i
    let toInsert = elements[j]
    while j > 0 && comparator(toInsert, elements[j - 1]) {
      // shift
      elements[j] = elements[j - 1]
      j -= 1
    }
    elements[j] = toInsert
  }
  
  return elements
}


// Merge Sort
// Time: O(nlogn)
// Space: O(n)
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  let mid = arr.count / 2
  let sortedLeft = mergeSort(Array(arr[..<mid]), comparator)
  let sortedRight = mergeSort(Array(arr[mid...]), comparator)
  
  // merge sortedLeft + sortedRight O(N)
  return merge(sortedLeft, sortedRight, comparator)
}

// Time: O(N)
private func merge<T: Comparable>(_ l: [T], _ r: [T], _ comparator: (T, T) -> Bool) -> [T] {
  var i = 0
  var j = 0
  var merged = [T]()
  
  while true {
    guard i < l.count else {
      merged.append(contentsOf: r[j...])
      break
    }
    guard j < r.count else {
      merged.append(contentsOf: l[i...])
      break
    }
    
    if comparator(l[i], r[j]) {
      merged.append(l[j])
      i += 1
    } else {
      merged.append(r[j])
      j += 1
    }
  }
  return merged
}


// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
  // TODO
  
  guard arr.count > 1 else { return }
  
  // base case
  if start >= end { return }
  
  // recursive case
  else {
    let indexPivot = partition(&arr, start, end)
    
    quickSort(&arr, start, indexPivot - 1)
    quickSort(&arr, indexPivot + 1, end)
  }
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
  // TODO
  
  // pick the last index
  let pivot = arr[end]
  
  // remeber the lsat position that an elem was placed in, that was less than pivot
  var i = start - 1
  
  // scan from start to the item before end
  for j in start..<end - 1 {
    
    // if current element is smaller than pivot
    if arr[j] < pivot {
      // i move to next index
      i += 1
      // swap "current element" with "previous element"
      arr.swapAt(i, j)
    }
  }
  
  // use an index between i and j to be the next index of pivot
  arr.swapAt(i + 1, end)
  return i + 1
}
