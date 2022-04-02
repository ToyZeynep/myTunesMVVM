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
import McPicker

class MyTunesListViewController : UIViewController, BindableType, UICollectionViewDelegate , UISearchBarDelegate{
    private let cellIdentifier = String(describing: MyTunesListCell.self)
    let disposeBag = DisposeBag()
    var myTunesListView = MyTunesListView()
    var gridFlowLayout = GridFlowLayout()
    var viewModel: MyTunesListViewModel!
    var myTunesList = [Results]()
    var params: [String: Any] = [String: Any]()
    let filter: [String] = [ Media.media.rawValue , Entity.entity.rawValue]
    
    override func loadView() {
        view = myTunesListView
    }
    
    override func viewDidLoad() {
        myTunesListView.myTunesListSearchBar.delegate = self
        registerCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        myTunesListView.myTunesListCollectionView.reloadData()
        navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0xF5F5F5)
    }
    
    func filterTapped(){
        self.showPicker(self.myTunesListView.myTunesListFilterButton, list: self.filter)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(MyTunesListViewController.searchRules), object: nil)
        self.perform(#selector(MyTunesListViewController.searchRules), with: nil, afterDelay: 0.7)
    }
    
    func bindViewModel() {
        
        viewModel.output.myTunesListResponse.subscribe(onNext: { response in
           
            self.myTunesList.append(contentsOf: response.results!)
            self.viewModel.output.myTunesList.onNext(self.myTunesList)
        }).disposed(by: disposeBag)
        
        myTunesListView.myTunesListFilterButton.rx.tapGesture().when(.recognized).subscribe(onNext: { gesture in
            self.showPicker(self.myTunesListView.myTunesListFilterButton, list: self.filter)
        })
        
        viewModel.output.myTunesList.bind(to: myTunesListView.myTunesListCollectionView.rx.items(cellIdentifier: cellIdentifier,cellType: MyTunesListCell.self)) { _, model, cell in
            
            let urlString = model.artworkUrl100?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            cell.myTunesListCellImageView.kf.setImage(with: URL(string: urlString ?? ""))
            cell.myTunesListCellNameLabel.text = model.trackName
            cell.myTunesListCellTypeLabel.text = model.wrapperType
            cell.myTunesListCellKindLabel.text = model.kind
            cell.myTunesListCellAddFavoriteButton.rx.tapGesture().when(.recognized).subscribe(onNext: {gesture in
                let favoriteList = RealmHelper.sharedInstance.getObjects().map { $0 }
                if let position = favoriteList.firstIndex(where: {$0.trackName == model.trackName}){
                    RealmHelper.sharedInstance.deleteFromDb(tune: favoriteList[position])
                    
                    cell.myTunesListCellAddFavoriteButton.backgroundColor = .clear
                }else{
                    RealmHelper.sharedInstance.addCharacterToFavorites(tune: model)
                   
                    cell.myTunesListCellAddFavoriteButton.backgroundColor = .red
                }
            }).disposed(by: cell.disposeBag)
        } .disposed(by: disposeBag)
        
        myTunesListView.myTunesListFavoritesButton.rx.tapGesture().when(.recognized).subscribe(onNext: { gesture in
            self.viewModel.navigateToFavorites()
        }).disposed(by: disposeBag)
        
        myTunesListView.myTunesListCollectionView.rx.modelSelected(Results.self)
            .bind(to: viewModel.input.selectedTune).disposed(by: disposeBag)
    }
    
    
    @objc func searchRules(){
        
        guard let searchText = myTunesListView.myTunesListSearchBar.text else { return }

        if searchText == "" {
            myTunesList.removeAll()
            params.removeAll()
            myTunesListView.myTunesListCollectionView.reloadData()
        } else {
            search(searchText: searchText)
        }
        func search(searchText: String){
            params["limit"] = 25
            params["term"] = searchText
            viewModel?.fetchMyTunesList(params: params)
          
        }
     myTunesListView.myTunesListCollectionView.reloadData()
    }
    
    func registerCollectionView() {
        myTunesListView.myTunesListCollectionView.delegate = self
        myTunesListView.myTunesListCollectionView.register(MyTunesListCell.self, forCellWithReuseIdentifier: self.cellIdentifier)
        myTunesListView.myTunesListCollectionView.collectionViewLayout = gridFlowLayout
    }
    
    func showPicker(_ sender: UIButton, list: [String]){
        McPicker.showAsPopover(data:[list], fromViewController: self, sourceView: sender, doneHandler:{ [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                
                switch name {
                    
                case "media" :
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        let media : [String] = [Media.movie.rawValue, Media.podcast.rawValue, Media.music.rawValue, Media.musicVideo.rawValue, Media.audiobook.rawValue, Media.shortFilm.rawValue, Media.tvShow.rawValue , Media.software.rawValue, Media.ebook.rawValue, Media.all.rawValue]
                        self!.showPicker(sender, list: media)
                    }
                case "entity":
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
   
                        let entity: [String] = [Entity.musicVideo.rawValue , Entity.podcast.rawValue , Entity.mix.rawValue , Entity.audiobook.rawValue , Entity.tvSeason.rawValue , Entity.allTrack.rawValue]
                    self!.showPicker(sender, list: entity)
                    }
                    
                case  Entity.musicVideo.rawValue:
                    
                    self?.params["entity"] = Entity.musicVideo.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Entity.podcast.rawValue:
                    self?.params["entity"] = Entity.podcast.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Entity.mix.rawValue:
                    self?.params["entity"] = Entity.mix.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Entity.audiobook.rawValue:
                    self?.params["entity"] = Entity.audiobook.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Entity.tvSeason.rawValue:
                    self?.params["entity"] = Entity.tvSeason.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Entity.allTrack.rawValue:
                    self?.params["entity"] = Entity.allTrack.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case  Media.movie.rawValue:
                    self?.params["media"] =  Media.movie.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Media.podcast.rawValue:
                    self?.params["media"] = Media.podcast.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Media.music.rawValue:
                    self?.params["media"] = Media.music.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case  Media.musicVideo.rawValue:
                    self?.params["media"] =  Media.musicVideo.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Media.audiobook.rawValue:
                    self?.params["media"] = Media.audiobook.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Media.shortFilm.rawValue:
                    self?.params["media"] = Media.shortFilm.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Media.tvShow.rawValue:
                    self?.params["media"] = Media.tvShow.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Media.software.rawValue:
                    self?.params["media"] = Media.software.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case Media.ebook.rawValue:
                    self?.params["media"] = Media.ebook.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                case  Media.all.rawValue:
                    self?.params["media"] =  Media.all.rawValue
                    self?.myTunesList.removeAll()
                    self?.searchRules()
                    
                default:
                    break
                }
            }
        })
    }
}

