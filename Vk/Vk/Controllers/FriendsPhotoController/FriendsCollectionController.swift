//
//  CollectionViewController.swift
//  Vk
//
//  Created by Александр Чигрин on 28.11.2021.
//

import UIKit

//private let reuseIdentifier = "Cell"

class FriendsCollectionController: UICollectionViewController {
	var friend: UserModel?
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? FriendsColCell else { return UICollectionViewCell()
            }

		cell.icon.image = UIImage(named: friend?.avatar ?? "") ?? UIImage()
      
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier:
                                                            "SwipeViewController") as? SwipeViewController else { return }

        if let images = friend?.storedImages {
        vc.photos = images
        }
        vc.selectedPhoto = indexPath.item
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
