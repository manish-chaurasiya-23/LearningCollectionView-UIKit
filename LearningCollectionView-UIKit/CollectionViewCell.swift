//
//  CollectionViewCell.swift
//  LearningCollectionView-UIKit
//
//  Created by Manish Kumar on 22/01/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let videoBackgroundView = UIView()
    let videoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        videoBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(videoBackgroundView)
        
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoBackgroundView.addSubview(videoImageView)
        
        NSLayoutConstraint.activate([
            videoBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            videoBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            videoBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            videoBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            videoImageView.topAnchor.constraint(equalTo: videoBackgroundView.topAnchor, constant: 10),
            videoImageView.leadingAnchor.constraint(equalTo: videoBackgroundView.leadingAnchor, constant: 10),
            videoImageView.trailingAnchor.constraint(equalTo: videoBackgroundView.trailingAnchor, constant: -10),
            videoImageView.bottomAnchor.constraint(equalTo: videoBackgroundView.bottomAnchor, constant: -10)
        ])
        
        videoBackgroundView.backgroundColor = .lightGray
        videoImageView.contentMode = .scaleAspectFit
    }
    
    func configure(image: UIImage?) {
        videoImageView.image = image
    }
}
