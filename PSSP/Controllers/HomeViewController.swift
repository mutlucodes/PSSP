//
//  HomeViewController.swift
//  PSSP
//
//  Created by Mutlu Aydin on 7/18/22.
//

import UIKit

final class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectedNavigationControllerTitle: String?
    
    // Collection View Property
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
    }
 
    
    //MARK: - Collection View Set Up
    
    func configureCollectionView(){
        
        collectionView.register(PSSPHomeCollectionViewCell.self, forCellWithReuseIdentifier: PSSPHomeCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.frame
        collectionView.backgroundColor = .psspBackgroundColor

        view.addSubview(collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PSSPHomeCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) ->CGSize {
        return CGSize(
            width: view.frame.size.width/2-15,
            height: view.frame.size.width/2-15
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { collectionView.deselectItem(at: indexPath, animated: true)
        print("Selected a section: \(indexPath.section) X \(indexPath.row)")
        let selection = indexPath.item
        print(selection)
        let pushUpViewController = collectionViewCellPressedAction(item: indexPath.item)
        pushUpViewController.title = selectedNavigationControllerTitle
        pushUpViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "x.circle"), style: .done, target: self, action: #selector(dismissSelf))

        let navigationController = UINavigationController(rootViewController: pushUpViewController)
        navigationController.modalPresentationStyle = .overFullScreen

        present(navigationController, animated: true)
    }
    
    // Collection View Cell Pressed Action Function
    func collectionViewCellPressedAction (item: Int) -> UIViewController {
        if item == 0 {
            selectedNavigationControllerTitle = "Push Up"
            return PushUpViewController()
        } else if item == 1 {
            selectedNavigationControllerTitle = "Sit Up"
            return SitUpViewController()
        } else if item == 2 {
            selectedNavigationControllerTitle = "Squat"
            return SquatViewController()
        } else if item == 3 {
            ///!!!!!!!!!!!!
            return PlankViewController()
        } else {
            print("Something Wrong!")
            return UIViewController()
        }
        
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
    
    
   

}
