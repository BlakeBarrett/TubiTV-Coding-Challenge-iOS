//
//  GifCollectionViewCell.swift
//  Tubi TV Blake Challenge
//
//  Created by Blake Barrett on 2/17/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

import UIKit

@IBDesignable class GifCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "gifCollectionViewCellReuseIdentifier"
    
    var item: TenorResource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTapListener()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ value: TenorResource) {
        loadImageFrom(url: value.preview)
        item = value
    }
    
    func loadImageFrom(url value: String) {
        
        DispatchQueue.global(qos: .background).async {
            guard let url = URL(string: value),
                let data = try? Data(contentsOf: url)
                else { return }
            let image = UIImage(data: data)
            
            DispatchQueue.main.async { [weak self] in
                let imageView = UIImageView(image: image!)
                imageView.frame = self?.contentView.frame ?? CGRect.zero
                imageView.contentMode = .scaleAspectFit
                
                self?.contentView.removeAllSubviews()
                
                self?.contentView.addSubview(imageView)
            }
        }
    }
    
}

extension GifCollectionViewCell {
    func addTapListener() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        self.contentView.addGestureRecognizer(recognizer)
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        
    }
}

extension UIView {
    
    func removeAllSubviews() {
        subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}
