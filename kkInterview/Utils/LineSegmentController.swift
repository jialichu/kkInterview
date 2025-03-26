//
//  LineSegment.swift
//  NewebPay
//
//  Created by Charlie Chu on 2023/1/15.
//

import UIKit

protocol LineSegmentControllerDelegate: NSObject {
    func change(to index: Int)
}

class LineSegmentController: UIView {
    private var buttonTitles:[String]!
    private var buttons: [UIButton]!
    private var selectorView: UIView!
    
    var isEnable: Bool = true {
        didSet {
            if let buttons = buttons {
                buttons.forEach { $0.isEnabled = isEnable }                
            }
        }
    }
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var buttonsWidth: CGFloat = 0
    var anchorWidth: CGFloat = 20
    
    var textColor:UIColor = ColorGuide.lightGrey
    var selectorViewColor: UIColor = ColorGuide.hotPink
    var selectorTextColor: UIColor = ColorGuide.lightGrey
    
    weak var delegate: LineSegmentControllerDelegate?
    
    public private(set) var selectedIndex : Int = 0
    
    convenience init(frame:CGRect,buttonTitle:[String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    func setIndex(index:Int) {
        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    @objc func buttonAction(sender:UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            if btn == sender {
                let selectorViewW = frame.width/CGFloat(buttonTitles.count)
                let selectorViewOringinX = selectorViewW * CGFloat(buttonIndex)
                let selectorPosition = selectorViewOringinX + (selectorViewW - anchorWidth) / 2
                selectedIndex = buttonIndex
                delegate?.change(to: selectedIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
                btn.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
            }
        }
    }
    
    private func updateView() {
        createButton()
        configSelectorView()
        configStackView()
    }
    
    private func configStackView() {
        buttons.forEach { stack.addArrangedSubview($0) }
        addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stack.leftAnchor.constraint(equalTo: self.leftAnchor),
            stack.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    private func configSelectorView() {
        let selectorWidth: CGFloat = anchorWidth
        let selectorViewW = frame.width/CGFloat(buttonTitles.count)
        let x = (selectorViewW - anchorWidth) / 2
        selectorView = UIView(frame: CGRect(x: x, y: self.frame.height-4, width: selectorWidth, height: 4))
        selectorView.layer.cornerRadius = 2
        selectorView.layer.masksToBounds = true
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        
        subviews.forEach({$0.removeFromSuperview()})
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
            button.addTarget(self, action:#selector(buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            button.isEnabled = isEnable
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
}
