//
//  ZHSelectView.swift
//  GitExplorer-iOS
//
//  Created by Zoha on 6/21/20.
//  Copyright © 2020 Zoha. All rights reserved.
//

import UIKit

@IBDesignable
class ZHSelectView: UIView {
  
  let imageView = UIImageView()
  let labelView = ZHTextField()
  
  var data: [Command] = [] {
    didSet {
      labelView.data = data
    }
  }
  
  var onDataSelect: (Command) -> Void = {_ in } {
    didSet {
      labelView.onDataSelect = onDataSelect
    }
  }
  
  @IBInspectable var labelTxt: String = "Hello" {
    didSet {
      labelView.text = labelTxt
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }
  
  func setup() {
    translatesAutoresizingMaskIntoConstraints = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    labelView.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(imageView)
    addSubview(labelView)
    
    imageView.image = UIImage(systemName: "arrowtriangle.down")
    
    labelView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    labelView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
    labelView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
    
    imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    imageView.tintColor = .systemGray
    imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
    
    backgroundColor = .systemGray6
    layer.cornerRadius = 8
    
    layer.shadowColor = secondaryColor.cgColor
    layer.shadowOpacity = 0.2
    layer.shadowRadius = 4
    layer.shadowOffset = CGSize.zero
    
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: bounds.width, height: 40)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    DispatchQueue.main.async {
      self.layer.shadowOpacity = 0.2
      self.alpha = 1.0
      UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveLinear, animations: {
        self.layer.shadowOpacity = 0.0
        self.alpha = 0.7
      }, completion: nil)
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    labelView.becomeFirstResponder()
    
    DispatchQueue.main.async {
      self.layer.shadowOpacity = 0.0
      self.alpha = 0.7
      UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveLinear, animations: {
        self.layer.shadowOpacity = 0.2
        self.alpha = 1.0
      }, completion: nil)
    }
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    DispatchQueue.main.async {
      self.layer.shadowOpacity = 0.0
      self.alpha = 0.7
      UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveLinear, animations: {
        self.layer.shadowOpacity = 0.2
        self.alpha = 1.0
      }, completion: nil)
    }
  }
}
