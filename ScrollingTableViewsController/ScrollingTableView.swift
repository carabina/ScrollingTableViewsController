//
//  ScrollingTableView.swift
//  ScrollingTableViewsController
//
//  Created by Kevin Wood on 10/11/18.
//  Copyright © 2018 KevinWoodsDevelopment. All rights reserved.
//

import UIKit

public class ScrollingTableView: UITableView {
    
    init() {
        super .init(frame: .zero, style: .plain)
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TableViewDatasoure & Delegate
extension ScrollingTableView: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
