//
//  Collection.swift
//  Proton
//
//  Created by McDowell, Ian J [ITACD] on 3/29/16.
//  Copyright © 2016 Ian McDowell. All rights reserved.
//

public class Collection: View<UICollectionView> {

    private var dataSource = CollectionDataSource()
    
    public init(cells: [CollectionCell.Type]) {
        super.init()
        
        self.dataSource.cells = cells
        self.view.dataSource = self.dataSource
        
        for cell in cells {
            self.view.registerClass(cell.self, forCellWithReuseIdentifier: NSStringFromClass(cell.self))
        }
    }
    
    public convenience init(data: [AnyObject]..., cells: [CollectionCell.Type]) {
        self.init(cells: cells)
        
        dataSource.sections = data
    }
    
    public convenience init(sections: [[AnyObject]],  cells: [CollectionCell.Type]) {
        self.init(cells: cells)
        
        dataSource.sections = sections
    }
    
}



public class CollectionCell: UICollectionViewCell {
    
    internal var lastLayout: ProtonView?
    
    public class func displays(model: AnyObject) -> Bool {
        return false
    }
    
    public func configure(model: AnyObject) {
        
    }
    
    public func layout() -> ProtonView {
        return View<UIView>()
    }
    
    public override func layoutIfNeeded() {
        super.layoutIfNeeded()
        if self.lastLayout == nil {
            self.lastLayout = self.layout()
            let view = self.lastLayout!.getView()
            self.contentView.addSubview(view)
            view.constrainToEdgesOfSuperview()
        }
    }
}


@objc private class CollectionDataSource: NSObject, UICollectionViewDataSource {
    
    var sections = [[AnyObject]]()
    var cells = [CollectionCell.Type]()
    
    
    @objc func numberOfSectionsInCollectionView(CollectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    @objc func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    @objc func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let model = sections[indexPath.section][indexPath.row]
        let type = getTypeOfModel(model)
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(type), forIndexPath: indexPath) as! CollectionCell
        
        cell.layoutIfNeeded()
        
        cell.configure(model)
        
        return cell
    }
    
    private func getTypeOfModel(model: AnyObject) -> CollectionCell.Type {
        for cell in cells {
            if cell.displays(model) {
                return cell
            }
        }
        fatalError("No cell type provided to the Collection is able to display model of type: \(model.self). Make sure you are implementing the 'displays(model) -> Bool' method of your CollectionCell")
    }
}