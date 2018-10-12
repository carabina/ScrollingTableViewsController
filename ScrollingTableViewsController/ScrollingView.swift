//
//  ScrollingView.swift
//  ScrollingTableViewsController
//
//  Created by Kevin Wood on 10/11/18.
//  Copyright © 2018 KevinWoodsDevelopment. All rights reserved.
//

import UIKit

open class ScrollingView: UIView {
    
    //MARK: - Views
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let menuBar: MenuBar
    
    private let menuNames: [String]
    //MARK: - Initializers
    public init(menuNames: [String]) {
        self.menuNames = menuNames
        self.menuBar = MenuBar(menuNames: menuNames)
        self.menuBar.translatesAutoresizingMaskIntoConstraints = false
        
        super .init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Setup
    override open func layoutSubviews() {
        super .layoutSubviews()
        //Adds views to super view
        addSubview(menuBar)
        addSubview(scrollView)
        
        //Lays out the views in super view
        menuBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08).isActive = true
        
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

