//
//  ScrollingTableViewsController.swift
//  ScrollingTableViewsController
//
//  Created by Kevin Wood on 10/11/18.
//  Copyright © 2018 KevinWoodsDevelopment. All rights reserved.
//

import UIKit

open class ScrollingTableViewsWithMenu: UIViewController {
    
    //MARK: - Properties
    private let tableViews: [UITableView]
    private let scrollingView: ScrollingView
    
    //MARK: - Initializers
    public init(tableViews: [ScrollingTableView], menuNames: [String]) {
        self.tableViews = tableViews
        self.scrollingView = ScrollingView(menuNames: menuNames)
        
        super .init(nibName: nil, bundle: nil)
        
        self.scrollingView.menuBar.delegate = self
        self.scrollingView.scrollView.delegate = self
        
        self.view.addSubview(scrollingView)
        
        scrollingView.scrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(tableViews.count), height: self.view.frame.height)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        for (index, tableView) in tableViews.enumerated() {
            tableView.frame = CGRect(x: self.view.frame.width * CGFloat(index), y: 0, width: self.view.frame.width, height: self.scrollingView.scrollView.frame.height)
            scrollingView.scrollView.addSubview(tableView)
        }
    }
}

//MARK: - UIScrollViewDelegate
extension ScrollingTableViewsWithMenu: UIScrollViewDelegate {
    private func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollingView.menuBar.moveLine(whenScrolling: scrollView)
    }
}

//MARK: - MenubarDelegate
extension ScrollingTableViewsWithMenu: MenuBarDelegate {
    open func menuBarMoveScrollViewWhenTapped(menuBar: MenuBar, button: UIButton) {
        UIView.animate(withDuration: 0.25) {
            self.scrollingView.scrollView.contentOffset.x = CGFloat(button.tag) * self.view.frame.width
        }
    }
}
