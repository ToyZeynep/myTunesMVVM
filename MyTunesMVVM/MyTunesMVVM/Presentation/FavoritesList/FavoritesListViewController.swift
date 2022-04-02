//
//  FavoritesListViewController.swift
//  MyTunesMVVM
//
//  Created by MacOS on 1.04.2022.
//

import Foundation
import RxCocoa
import RxSwift
import RxGesture
import XCoordinator
import Kingfisher
import Action
import UIKit
import RealmSwift

class FavoriteListViewController : UIViewController, BindableType, UICollectionViewDelegate {
  

    private let cellIdentifier = String(describing: FavoritesListCell.self)
    let disposeBag = DisposeBag()
    var favoritesListView = FavoritesListView()
    var viewModel: FavoritesListViewModel!
    var gridFlowLayout = GridFlowLayout()
    var favoritesList = [Results]()
    
    override func loadView() {
        view = favoritesListView
    }
    override func viewDidLoad() {
        registerCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
        favoritesListView.favoriteListCollectionView.reloadData()
        let image = UIImage(named: "delete")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image , style: .plain, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem?.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: -4, right: -3)
        navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0xF5F5F5)
    }
    
    @objc func addTapped(){
        self.deleteButtonProcesses()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       // navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func bindViewModel() {
        
        viewModel.output.favoriteList.bind(to: favoritesListView.favoriteListCollectionView.rx.items(cellIdentifier: cellIdentifier, cellType: FavoritesListCell.self)) { [self] _, model , cell in
            
            let urlString = model.artworkUrl100?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            cell.favoriteListCellImageView.kf.setImage(with: URL(string: urlString ?? ""))
            cell.favoriteListCellNameLabel.text = model.trackName
            cell.favoriteListCellTypeLabel.text = model.wrapperType
            cell.favoriteListCellKindLabel.text = model.kind
    
            cell.favoriteListCellDeleteButton.backgroundColor = .red
            cell.favoriteListCellDeleteButton.addTapGesture {
                
                RealmHelper.sharedInstance.deleteFromDb(tune: model)
                self.viewModel.fetchFavoriteList()
            }
            
        }.disposed(by: disposeBag)
        
        favoritesListView.favoriteListCollectionView.rx.modelSelected(Results.self).bind(to: viewModel.input.selectedTune).disposed(by: disposeBag)
        
        favoritesListView.favoritesListDeleteButton.rx.tapGesture().when(.recognized).subscribe(onNext : { gesture in
            self.deleteButtonProcesses()
        }).disposed(by: disposeBag)
    }

    func registerCollectionView() {
        favoritesListView.favoriteListCollectionView.delegate = self
        favoritesListView.favoriteListCollectionView.register(FavoritesListCell.self, forCellWithReuseIdentifier: "FavoritesListCell")
        favoritesListView.favoriteListCollectionView.collectionViewLayout = gridFlowLayout
    }
    
    func deleteButtonProcesses(){
        RealmHelper.sharedInstance.deleteAllFromDatabase()
        self.viewModel.fetchFavoriteList()
        let alertAction = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            self.viewModel.dismiss()
        }
        self.alertAction(title: "Success", message: "Cleaned Favorite List", action: alertAction)
    }
}
