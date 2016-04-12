//
//  AlertPage.swift
//  Proton
//
//  Created by McDowell, Ian J [ITACD] on 3/28/16.
//  Copyright © 2016 Ian McDowell. All rights reserved.
//

import Proton

class AlertPage: Page, Alertable {

    private var items = SectionedTableData<AlertItem>()
    
    override func layout() -> ProtonView {
        return Table(data: items, cells: [AlertItemCell.self], style: .Grouped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Alert"
        
        self.items.value = [
            TableSection(title: "Alert Style", [
                AlertItem(title: "Simple", action: {
                    self.alert(
                        title: "A Short Title is Best",
                        message: "A message should be a short, complete sentence.",
                        actions: [UIAlertAction(title: "OK")]
                    )
                }),
                AlertItem(title: "Okay / Cancel", action: {
                    self.alert(
                        title: "A Short Title is Best",
                        message: "A message should be a short, complete sentence.",
                        actions: [
                            UIAlertAction(title: "Cancel", style: .Cancel),
                            UIAlertAction(title: "OK")
                        ]
                    )
                }),
                AlertItem(title: "Other", action: {
                    self.alert(
                        title: "A Short Title is Best",
                        message: "A message should be a short, complete sentence.",
                        actions: [
                            UIAlertAction(title: "Choice One"),
                            UIAlertAction(title: "Choice Two"),
                            UIAlertAction(title: "Cancel", style: .Cancel)
                        ]
                    )
                }),
                AlertItem(title: "Text Entry", action: {
                }),
                AlertItem(title: "Secure Text Entry", action: {
                })
            ]),
            TableSection(title: "Action Sheet Style", [
                AlertItem(title: "Okay / Cancel", action: {
                    self.actionSheet(
                        actions: [
                            UIAlertAction(title: "OK"),
                            UIAlertAction(title: "Cancel", style: .Cancel)
                        ]
                    )
                }),
                AlertItem(title: "Other", action: {
                    self.actionSheet(
                        title: "A Short Title is Best",
                        message: "A message should be a short, complete sentence.",
                        actions: [
                            UIAlertAction(title: "Destructive Choice", style: .Destructive),
                            UIAlertAction(title: "Safe Choice", style: .Default)
                        ]
                    )
                })
            ])
        ]
    }
    
}

private struct AlertItem {
    var title: String
    var action: () -> Void
}

private class AlertItemCell: TableCellTitle<AlertItem> {
    
    required init() {}
    
    override func configure(model: AlertItem) {
        self.titleLabel.text = model.title
    }
    
    override func tapped(model: AlertItem) {
        self.deselect()
        
        model.action()
    }
}