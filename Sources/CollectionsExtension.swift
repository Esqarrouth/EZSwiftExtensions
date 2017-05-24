//
//  CollectionsExtension.swift
//  EZSwiftExtensions
//
//  Created by Sanyal, Arunav on 3/5/17.
//  Copyright © 2017 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension Collection {

#if os(iOS)
    // EZSE : A parralelized map for collections, operation is non blocking
    public func parallelizedMap<R>(_ each: @escaping (Self.Iterator.Element) -> R) -> [R?] {
        let indices = indicesArray()
        var res = [R?](repeating: nil, count: indices.count)
        
        let queue = OperationQueue()
        let operations = indices.enumerated().map { index, elementIndex in
            return BlockOperation {
                res[index] = each(self[elementIndex])
            }
        }
        queue.addOperations(operations, waitUntilFinished: true)
        
        return res
    }

    
    /// EZSE : Helper method to get an array of collection indices
    private func indicesArray() -> [Self.Index] {
        var indicesArray: [Self.Index] = []
        var nextIndex = startIndex
        while nextIndex != endIndex {
            indicesArray.append(nextIndex)
            nextIndex = index(after: nextIndex)
        }
        return indicesArray
    }
#endif
}
