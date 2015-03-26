//
//  CustomLayoutViewLayout.swift
//  CustomLayoutTest
//
//  Created by 相澤 隆志 on 2015/03/26.
//  Copyright (c) 2015年 相澤 隆志. All rights reserved.
//

import UIKit

class CustomLayoutViewLayout: UICollectionViewLayout {

    var columnCount : Int = 0
    var minimumColumnSpacing : Float = 0
    var minimumRowSpacing : Float = 0
    var minimumInteritemSpacing : Float = 0
    var allItemAttributes : NSMutableArray = []
    
    
    override func prepareLayout() {
        super.prepareLayout()
        let countOf_Item = self.collectionView?.numberOfItemsInSection(0)
        for var index:NSInteger = 0; index < countOf_Item; index++ {
            var offsetX:Float = Float(index % columnCount) * self.minimumInteritemSpacing + minimumColumnSpacing
            var offsetY:Int = index / columnCount * Int(minimumInteritemSpacing) + Int(minimumRowSpacing)
            let frameWidth:CGFloat = CGFloat(self.collectionView?.bounds.width)
            let itemWidth:CGFloat = ( frameWidth - minimumColumnSpacing*2.0)/Float(columnCount)
        }
        
    }
}
