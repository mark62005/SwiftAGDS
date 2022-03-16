//
//  Stack.swift
//  SwiftAlgo&DataStructure
//
//  Created by Mark Wong on 2022-03-15.
//

import Foundation

/// Stack
///   - Last-In-First-Out

public final class Stack<E> {
  
  /// beginning of stack
  private var head: Node<E>?
  
  /// the number of items in the stack
  private (set) var count: Int = 0
  
  /// helper linked list node class
  fileprivate class Node<E> {
    fileprivate var data: E
    fileprivate var next: Node<E>?
    
    fileprivate init(data: E, next: Node<E>? = nil) {
      self.data = data
      self.next = next
    }
  }
  
  /// initializes an empty bag
  init() {}
  
  /// Return true if the stack is empty
  public func isEmpty() -> Bool {
//    return count == 0
    return head == nil
  }
  
  /// add an item (front of the stack) -> O(1)
  public func push(item: E) {
    let oldHead = head
    self.head = Node(data: item, next: oldHead)
    count += 1
  }
  
  /// removes and returns the item most recently added to the stack
  public func pop() -> E? {
    if let oldHead = head {
      self.head = oldHead.next
      return oldHead.data
    }
    
    return nil
  }
  
  /// returns (but does not remove) the item most recently added to the stack
  public func peek() -> E? {
    if let data = head?.data {
      return data
    }
    
    return nil
  }
  
}

extension Stack: Sequence {
  
  public struct StackIterator<E>: IteratorProtocol {
    private var current: Node<E>? = nil
    
    fileprivate init(_ head: Node<E>?) {
      self.current = head
    }
    
    public mutating func next() -> E? {
      if let data = current?.data {
        self.current = current?.next
        return data
      }
      
      return nil
    }
  }
  
  /// Returns an iterator that iterates over the data in this stack in reverse order.
  public func makeIterator() -> StackIterator<E> {
    return StackIterator<E>(head)
  }
  
}

extension Stack: CustomStringConvertible {
  
  public var description: String {
    self.reduce(into: "") { $0 += "\($1), " }
  }
  
}
