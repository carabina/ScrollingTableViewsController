//
//  ScrollingTableView.swift
//  ScrollingTableViewsController
//
//  Created by Kevin Wood on 10/11/18.
//  Copyright © 2018 KevinWoodsDevelopment. All rights reserved.
//

import UIKit

open class ScrollingTableView: UITableView {
    
    public init() {
        super .init(frame: .zero, style: .plain)
        self.dataSource = self
        self.delegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TableViewDatasoure & Delegate
extension ScrollingTableView: UITableViewDataSource, UITableViewDelegate {
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
