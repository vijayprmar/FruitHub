//
//  HomeScreenVC.swift
//  FruitHub
//
//  Created by Vijay Parmar on 28/08/23.
//

import UIKit

class HomeVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var lblWelcomeMessage: UILabel!
    @IBOutlet weak var collectionviewTitleName: UICollectionView!
    @IBOutlet weak var collectionviewRecommended: UICollectionView!
    @IBOutlet weak var collectionviewTitleListing: UICollectionView!
  
    //MARK: - Local Variables
    var vmHome = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        collectionviewConfigure()
    }
    
    //MARK: - Initial Setup
    func initialSetup(){
        self.navigationItem.setHidesBackButton(true, animated: true)
        lblWelcomeMessage.text = "Hello \(vmHome.firestName), What fruit salad combo do you want today?"
    }
    
    //MARK: - Collectionview Configuration
    func collectionviewConfigure(){
        collectionviewRecommended.delegate = self
        collectionviewRecommended.dataSource = self
        
        collectionviewTitleName.delegate = self
        collectionviewTitleName.dataSource = self
        
        collectionviewTitleListing.delegate = self
        collectionviewTitleListing.dataSource = self
        
        collectionviewRecommended.register(UINib(nibName: "FruitListingCollectionviewCell", bundle: nil), forCellWithReuseIdentifier: "FruitListingCollectionviewCell")
        collectionviewTitleListing.register(UINib(nibName: "FruitListingCollectionviewCell", bundle: nil), forCellWithReuseIdentifier: "FruitListingCollectionviewCell")
    }
}

//MARK: - Collectionview
extension HomeVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionviewTitleName{
            return vmHome.arrTitle.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionviewRecommended{
            let cell = collectionviewRecommended.dequeueReusableCell(withReuseIdentifier: "FruitListingCollectionviewCell", for: indexPath) as! FruitListingCollectionviewCell
            return cell
        }
        else if collectionView == collectionviewTitleName{
            let cell = collectionviewTitleName.dequeueReusableCell(withReuseIdentifier: "TitleNameCollectionViewCell", for: indexPath) as! TitleNameCollectionViewCell
            cell.configure(selectedIndex: vmHome.selectedIndex, currentIndex: indexPath.row, title: vmHome.arrTitle[indexPath.row])
            return cell
        }else{
            let cell = collectionviewTitleListing.dequeueReusableCell(withReuseIdentifier: "FruitListingCollectionviewCell", for: indexPath) as! FruitListingCollectionviewCell
            cell.configure()
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == collectionviewTitleName{
            vmHome.selectedIndex = indexPath.row
            collectionviewTitleName.reloadData()
            scrollToIndex(index: indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionviewTitleName{
            
            return CGSize(width: getTitileWidth(index: indexPath.row), height: collectionView.frame.size.height)
        }else if collectionView == collectionviewTitleListing{
           
            return CGSizeMake(collectionView.frame.size.width/2 - 20, collectionView.frame.size.height)
        }
        else{
            return CGSizeMake(collectionView.frame.size.width/2, collectionView.frame.size.height)
        }
    }
    
    //Scroll to selected index
    private func scrollToIndex(index:Int) {
              self.collectionviewTitleName.scrollToItem(at:IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
              collectionviewTitleName.layoutSubviews()
     }
    
    //Get collectionview cell dynamic width acourding to title text
    private func getTitileWidth(index:Int)->CGFloat{
        let label = UILabel(frame: CGRect.zero)
        label.text = vmHome.arrTitle[index]
        label.sizeToFit()
        if vmHome.selectedIndex == index{
            label.font = UIFont.systemFont(ofSize:18)
        }else{
            label.font = UIFont.systemFont(ofSize:16)
        }
        return (label.frame.width+30)
    }
    
    
}
