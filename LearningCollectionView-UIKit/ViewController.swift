//
//  ViewController.swift
//  LearningCollectionView-UIKit
//
//  Created by Manish Kumar on 22/01/25.
//
import UIKit

class CollectionViewController: UIViewController {
    
    let data = [
        UIImage(systemName: "video.fill"),
        UIImage(systemName: "video.fill"),
        UIImage(systemName: "video.fill"),
        UIImage(systemName: "video.fill"),
        UIImage(systemName: "video.fill"),
        UIImage(systemName: "video.fill"),
        UIImage(systemName: "video.fill"),
        UIImage(systemName: "video.fill"),
        UIImage(systemName: "video.fill"),
        UIImage(systemName: "video.fill")
    ]
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setCollectionDelegate()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    func setCollectionDelegate() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionViewConstraints()
    }
    
    func setupCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // Added bottom constraint
        ])
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.videoImageView.image = data[indexPath.row]
        return cell
    }
}
