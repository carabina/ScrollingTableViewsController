//
//  MenuBar.swift
//  ScrollingTableViewsController
//
//  Created by Kevin Wood on 10/11/18.
//  Copyright © 2018 KevinWoodsDevelopment. All rights reserved.
//

import UIKit

public protocol MenuBarDelegate: class {
    func menuBarMoveScrollViewWhenTapped(menuBar: MenuBar, button: UIButton)
}

public class MenuBar: UIView {
    
    //MARK: - Views
    private var menuBarStackView: UIStackView!
    private var buttons: [UIButton] = []
    private let arrangedViews: [UIView]!
    let menuBarLine: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Properties
    weak var delegate: MenuBarDelegate?
    
    //MARK: - Initializers
    init(menuNames: [String]) {
        arrangedViews = []
        super .init(frame: .zero)
        for (index, menuName) in menuNames.enumerated() {
            let button = UIButton()
            button.setTitle(menuName, for: .normal)
            button.setTitleColor(.darkGray, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            buttons.append(button)
            arrangedViews.append(button)
        }
        self.menuBarStackView = UIStackView(arrangedSubviews: arrangedViews)
        buttonSelected(tag: 0)
    }
    
    init(menuIcons: [UIImage]) {
        arrangedViews = []
        super .init(frame: .zero)
        for (index, menuIcon) in menuIcons.enumerated() {
            let button = UIButton()
            button.setImage(menuIcon.withRenderingMode(.alwaysTemplate), for: .normal)
            button.tintColor = .black
            button.contentMode = .scaleAspectFill
            button.clipsToBounds = true
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            buttons.append(button)
            arrangedViews.append(button)
        }
        self.menuBarStackView = UIStackView(arrangedSubviews: arrangedViews)
        buttonSelected(tag: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Setup
    override public func layoutSubviews() {
        super .layoutSubviews()
        //Adds views to super view
        addSubview(menuBarLine)
        addSubview(menuBarStackView)
        
        menuBarStackView.translatesAutoresizingMaskIntoConstraints = false
        menuBarStackView.distribution = .fillEqually
        menuBarStackView.axis = .horizontal
        
        //Lays out views in super view
        menuBarLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuBarLine.heightAnchor.constraint(equalToConstant: 3).isActive = true
        menuBarLine.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / CGFloat(arrangedViews.count)).isActive = true
        menuBarLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        menuBarStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuBarStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        menuBarStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menuBarStackView.bottomAnchor.constraint(equalTo: menuBarLine.topAnchor).isActive = true
    }
    
    //Moves menubar line when scrolling left or right
    func moveLine(whenScrolling scrollView: UIScrollView) {
        guard let superview = scrollView.superview else { return }
        menuBarLine.frame.origin.x = scrollView.contentOffset.x / CGFloat(arrangedViews.count)
        let tag = Int(scrollView.contentOffset.x / CGFloat(superview.frame.width))
        buttonSelected(tag: tag)
    }
    
    //Moves menubar line when selecting a button
    private func moveLine(whenSelectingButton button: UIButton) {
        let contentOffset = (CGFloat(button.tag) * bounds.width) / CGFloat(arrangedViews.count)
        UIView.animate(withDuration: 0.25) {
            self.menuBarLine.frame.origin.x = contentOffset
        }
    }
    
    
    //Handles changing button color when selected
    private func buttonSelected(tag: Int) {
        for button in buttons {
            if button.tag == tag {
                button.setTitleColor(.purple, for: .normal)
            } else {
                button.setTitleColor(.darkGray, for: .normal)
            }
        }
    }
    
    //Handles when a button is tapped
    @objc private func buttonTapped(_ sender: UIButton) {
        buttonSelected(tag: sender.tag)
        moveLine(whenSelectingButton: sender)
        self.delegate?.menuBarMoveScrollViewWhenTapped(menuBar: self, button: sender)
    }
}
