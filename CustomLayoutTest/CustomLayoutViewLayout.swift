//
//  CustomLayoutViewLayout.swift
//  CustomLayoutTest
//
//  Created by 相澤 隆志 on 2015/03/26.
//  Copyright (c) 2015年 相澤 隆志. All rights reserved.
//

import UIKit

class CustomLayoutViewLayout: UICollectionViewLayout {

    var columnCount : NSInteger = 3
    var minimumColumnSpacing : CGFloat = 2
    var minimumRowSpacing : CGFloat = 2
    var minimumInteritemSpacing : CGFloat = 2
    var allItemAttributes : NSMutableArray = []
    var contentsHeight: CGFloat = 0
    
    override func prepareLayout() {
        super.prepareLayout()
        var attributes = []
        let countOf_Item = self.collectionView?.numberOfItemsInSection(0)
        contentsHeight = minimumRowSpacing
        for var index:NSInteger = 0; index < countOf_Item; index++ {
            let indexPath = NSIndexPath(forItem: index, inSection: 0)
            let frameWidth:CGFloat? = self.collectionView?.bounds.width
            let tempWidth:CGFloat = ( frameWidth! - minimumColumnSpacing*2.0) as CGFloat
            let itemWidth:CGFloat = tempWidth / CGFloat(self.columnCount)
            let itemHeight:CGFloat = itemWidth
            var offsetX:CGFloat = CGFloat(index % columnCount) * (self.minimumInteritemSpacing+itemWidth) + minimumColumnSpacing
            var offsetY:Int = index / columnCount * Int(minimumInteritemSpacing+itemHeight) + Int(minimumRowSpacing)
            contentsHeight += itemHeight+minimumInteritemSpacing
            var attrib = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            attrib.frame = CGRectMake(offsetX, CGFloat(offsetY), itemWidth, itemHeight)
            allItemAttributes.addObject(attrib)
            
        }
    }
    
    override func collectionViewContentSize() -> CGSize {
        let contentWidth = self.collectionView?.bounds.width
        let contentsSize = CGSizeMake(contentWidth!, contentsHeight)
        return contentsSize
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        return allItemAttributes[indexPath.row] as UICollectionViewLayoutAttributes
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attribArray:[AnyObject] = []
        let countOfItem = self.collectionView?.numberOfItemsInSection(0)
        for var i = 0; i < countOfItem; i++ {
            let attrib = allItemAttributes[i] as UICollectionViewLayoutAttributes
            if CGRectIntersectsRect(rect, attrib.frame) {
                attribArray.append(attrib)
            }
        }
        return attribArray
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
}
