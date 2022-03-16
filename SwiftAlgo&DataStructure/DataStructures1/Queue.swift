//
//  Queue.swift
//  SwiftAlgo&DataStructure
//
//  Created by Mark Wong on 2022-03-15.
//

import Foundation

public final class Queue<E> {
  
  /// beginning of the queue
  private var head: Node<E>? = nil
  /// end of the queue
  private var tail: Node<E>? = nil
  
  /// number of items on queue
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
  
  public init() {}
  
  /// return true if the queue is empty
  public func isEmpty() -> Bool {
    return count == 0
  }
  
  /// add an item to the queue -> O(1)
  public func enqueue(item: E) {
    let newTail = Node(data: item, next: nil)
    
    if count == 0 {
      self.head = newTail
    }
    else if count == 1 {
      self.head?.next = newTail
      self.tail = newTail
    }
    else if let oldTail = tail {
      oldTail.next = newTail
      self.tail = newTail
    }
    
    count += 1
  }
  
  /// removes and returns the item least recently added to the queue -> O(1)
  public func dequeue() -> E? {
    guard let oldHead = head else { return nil }
    
    self.head = oldHead.next
    return oldHead.data
  }
  
  /// returns (but does not remove) the item least recently added to the queue. -> O(1)
  public func peek() -> E? {
    guard let head = head else { return nil }
    return head.data
  }
  
}

extension Queue: Sequence {
  
  public struct QueueIterator<E>: IteratorProtocol {
    fileprivate var current: Node<E>? = nil
    
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
  
  public func makeIterator() -> QueueIterator<E> {
    return QueueIterator<E>(head)
  }
  
}

extension Queue: CustomStringConvertible {
  
  public var description: String {
    self.reduce(into: "") { $0 += "\($1), " }
  }
  
}
