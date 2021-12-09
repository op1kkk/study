//
//  TestView.swift
//  Vk
//
//  Created by Александр Чигрин on 09.12.2021.
//

import UIKit

@IBDesignable class TestView: UIView {
    
    var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    private var imageView: UIImageView = UIImageView()
    private var containerView: UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupImage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupImage()
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            self.updateColor()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 3.0 {
        didSet {
            self.updateOpacity()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {
            self.updateRadius()
        }
    }
    
    @IBInspectable var shadowOffSet: CGSize = .zero {
        didSet {
            self.updateOffSet()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    private func setupImage() {
        containerView.frame = self.bounds
        containerView.layer.cornerRadius = 20
        
        imageView.layer.masksToBounds = true
        imageView.frame = containerView.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.image = image
        
        containerView.addSubview(imageView)
        self.addSubview(containerView)
        updateShadows()
    }
    
    private func updateOpacity() {
        self.containerView.layer.shadowOpacity = shadowOpacity
    }
    
    private func updateColor() {
        self.containerView.layer.shadowColor = shadowColor.cgColor
    }
    
    private func updateOffSet() {
        self.containerView.layer.shadowOffset = shadowOffSet
    }
    
    private func updateRadius() {
        self.containerView.layer.shadowRadius = shadowRadius
    }
    
    private func updateShadows() {
        self.containerView.layer.shadowOpacity = shadowOpacity
        self.containerView.layer.shadowRadius = shadowRadius
        self.containerView.layer.shadowColor = shadowColor.cgColor
        self.containerView.layer.shadowOffset = shadowOffSet
    }
    
}
