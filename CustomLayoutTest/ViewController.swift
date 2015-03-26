//
//  ViewController.swift
//  CustomLayoutTest
//
//  Created by 相澤 隆志 on 2015/03/26.
//  Copyright (c) 2015年 相澤 隆志. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    let collectionView:UICollectionView
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        let layout:CustomLayoutViewLayout! = CustomLayoutViewLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1.0)
        self.view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        <#code#>
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    
}

