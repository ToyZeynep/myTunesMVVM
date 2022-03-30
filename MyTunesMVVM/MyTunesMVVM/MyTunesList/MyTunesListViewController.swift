//
//  MyTunesListViewController.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//

import Foundation
import RxCocoa
import RxSwift
import RxGesture
import XCoordinator
import Kingfisher
import Action

class MyTunesListViewController : UIViewController, BindableType, UICollectionViewDelegate{
    private let cellIdentifier = String(describing: MyTunesListCell.self)
    let disposeBag = DisposeBag()
    var myTunesListView = MyTunesListView()
    var gridFlowLayout = GridFlowLayout()
    var viewModel: MyTunesListViewModel!
    var myTunesList = [Results]()
    
    override func loadView() {
        view = myTunesListView
    }
    
    override func viewDidLoad() {
        registerCollectionView()
    }
    
    func bindViewModel() {
        
        viewModel.output.myTunesListResponse.subscribe(onNext: { response in
            self.myTunesList.append(contentsOf: response.results!)
            self.viewModel.output.myTunesList.onNext(self.myTunesList)
        }).disposed(by: disposeBag)
        
        
        viewModel.output.myTunesList.bind(to: myTunesListView.myTunesListCollectionView.rx.items(cellIdentifier: cellIdentifier,cellType: MyTunesListCell.self)) { _, model, cell in
            
            let urlString = model.artworkUrl100!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            cell.myTunesListCellImageView.kf.setImage(with: URL(string: urlString!))
            cell.myTunesListCellNameLabel.text = model.trackName
            cell.myTunesListCellTypeLabel.text = model.wrapperType
            cell.myTunesListCellKindLabel.text = model.kind
        } .disposed(by: disposeBag)
    }
    
    func registerCollectionView() {
        myTunesListView.myTunesListCollectionView.delegate = self
        myTunesListView.myTunesListCollectionView.register(MyTunesListCell.self, forCellWithReuseIdentifier: self.cellIdentifier)
        myTunesListView.myTunesListCollectionView.collectionViewLayout = gridFlowLayout
    }
}
