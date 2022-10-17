//
//  PlaceViewController.swift
//  GoToPOM☆
//
//  Created by 石丸剣心 on 2022/10/13.
//

import UIKit

class PlaceViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var placeData = ["北海道","青森","岩手","宮城","秋田","山形","福島","茨城","栃木","群馬","埼玉","千葉","東京",
                     "神奈川","新潟","富山","石川","福井","山梨","長野","岐阜","静岡","愛知","三重","滋賀","京都",
                     "大阪","兵庫","奈良","和歌山","鳥取","島根","岡山","広島","山口","徳島","香川","愛媛","高知",
                     "福岡","佐賀","長崎","熊本","大分","宮崎","鹿児島","沖縄"]
    
    var plessPlace = [String]()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "PlaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customCell")
        
        // セルのレイアウト設定
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumInteritemSpacing = 10
        
        collectionView.collectionViewLayout = layout
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewController(withIdentifier: "resultVC") as! ResultViewController
        
        resultVC.judge = false
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! PlaceCollectionViewCell
        cell.backgroundColor = .darkGray
        
        // 角の丸さ
        cell.layer.cornerRadius = 10
        
        // 影の濃さ
        cell.layer.shadowOpacity = 0.5
        
        // 影のぼかしの大きさ
        cell.layer.shadowRadius = 3
        
        // 影の色
        cell.layer.shadowColor = UIColor.black.cgColor
        
        // 影の方向
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        cell.placeLabel.text = placeData[indexPath.row]
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return placeData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let genreVC = storyboard.instantiateViewController(withIdentifier: "genreVC") as! GenreViewController
        UserDefaults.standard.set(placeData[indexPath.row], forKey: "place")
        
        performSegue(withIdentifier: "nextVC", sender: nil)
        
        
    }
    
    
    
}
