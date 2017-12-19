//
//  AlgoTest.swift
//  Practice
//
//  Created by pooja on 19/12/2017.
//  Copyright © 2017 pooja. All rights reserved.
//

import UIKit

class AlgoTest: NSObject {

    static func binarySearch()
    {
        let search = 6
        var shoppingList: [NSInteger] = [1, 2, 3, 4, 5, 6]
        var start = 0;
        var end = shoppingList.count-1;
        var  i = 0;
        
        while (i < shoppingList.count) {
            
            var x = Float(start+end)/2
            x.round()
            let mid:Int = Int(x)
            
            if (shoppingList[mid] == search)
            {
                print("\(search) found at \(mid) in \(i) iterations")
                break;
            }
            else if (search < mid)
            {
                end = mid
            }
            else if (search > mid)
            {
                start = mid;
            }
            i += 1
        }
    }
}
