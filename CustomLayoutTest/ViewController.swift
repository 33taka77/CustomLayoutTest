//
//  ViewController.swift
//  CustomLayoutTest
//
//  Created by 相澤 隆志 on 2015/03/26.
//  Copyright (c) 2015年 相澤 隆志. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    let CELL_IDENTIFIER = "customLayoutCell"

    @IBOutlet weak var collectView: UICollectionView!
    var items:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout:CustomLayoutViewLayout! = CustomLayoutViewLayout()
        layout.columnCount = 3
        
        //self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout) as UICollectionView
        collectView.dataSource = self
        collectView.delegate = self
        collectView.backgroundColor = UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1.0)

        for var i = 0; i < 100; i++ {
            items.append(String(format: "%d", i ))
        }
        /*
        collectionView.registerClass(CustomLayoutCollectionViewCell.self, forCellWithReuseIdentifier: CELL_IDENTIFIER)
*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CustomLayoutCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(CELL_IDENTIFIER, forIndexPath: indexPath) as CustomLayoutCollectionViewCell
        cell.label.text = items[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
}

