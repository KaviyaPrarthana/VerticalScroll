//
//  ViewController.swift
//  VerticalScroll
//
//  Created by Kaviya Prarthana on 21/01/21.
//

import UIKit

struct Content {
    var poster : String
}

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var details = [Content(poster: "album1"),Content(poster: "album2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initScreen()
    }
    
    func initScreen(){
        self.collectionView.dataSource = self
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
//MARK:- CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.details.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! FirstCollectionViewCell
        cell.poster.image = UIImage(named: self.details[indexPath.row].poster)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    

}





