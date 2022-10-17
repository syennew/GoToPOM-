//
//  GenreViewController.swift
//  GoToPOM☆
//
//  Created by 石丸剣心 on 2022/10/13.
//

import UIKit
import BubbleTransition


class GenreViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var frenchButton: UIButton!
    @IBOutlet weak var IzakayaButton: UIButton!
    @IBOutlet weak var cafeButton: UIButton!
    @IBOutlet weak var ramenButton: UIButton!
    @IBOutlet weak var sushiButton: UIButton!
    @IBOutlet weak var japaneseButton: UIButton!
    @IBOutlet weak var chaineseButton: UIButton!
    @IBOutlet weak var barButton: UIButton!
    @IBOutlet weak var yakinikuButton: UIButton!
    @IBOutlet weak var udonButton: UIButton!
    
    let transition = BubbleTransition()
    
    var gourmetGenreArray = ["洋食","居酒屋","カフェ","ラーメン","寿司","和食","中華","バー","焼肉","うどん"]
    
    var lat = Float()
    var lot = Float()
    
    var tenpoArray = [TenpoDataSets]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddShadow_Buttons()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        
        gachaVC.tenpoDataArray = tenpoArray
        
    }
    
    
    @IBAction func FrenchButton(_ sender: Any) {
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[0]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        
        transition.startingPoint = frenchButton.center
        
    }
    
    
    @IBAction func IzakayaButton(_ sender: Any) {
    
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[1]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        
        transition.startingPoint = IzakayaButton.center
        
    }
    
    
    @IBAction func CafeButton(_ sender: Any) {
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[2]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        transition.startingPoint = cafeButton.center
        
    }
    
    
    @IBAction func RamenButton(_ sender: Any) {
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[3]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        transition.startingPoint = ramenButton.center
        
    }
    
    
    @IBAction func SushiButton(_ sender: Any) {
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[4]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        transition.startingPoint = sushiButton.center
        
    }
    
    
    @IBAction func JapaneseButton(_ sender: Any) {
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[5]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        transition.startingPoint = japaneseButton.center
        
    }
    
    
    @IBAction func ChaineseButton(_ sender: Any) {
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[6]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        transition.startingPoint = japaneseButton.center
        
    }
    
    
    @IBAction func BarButton(_ sender: Any) {
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[7]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        transition.startingPoint = barButton.center
        
    }
    
    
    @IBAction func YakinikuButton(_ sender: Any) {
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[8]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        transition.startingPoint = yakinikuButton.center
        
    }
    
    
    @IBAction func UdonButton(_ sender: Any) {
        
        let gachaVC = storyboard?.instantiateViewController(withIdentifier: "gachaVC") as! GachaViewController
        gachaVC.genreString = gourmetGenreArray[9]
        
        gachaVC.transitioningDelegate = self
        gachaVC.modalPresentationStyle = .custom
        
        present(gachaVC, animated: true)
        
        transition.startingPoint = udonButton.center
        
    }
    
    
    
    
    func AddShadow_Buttons() {
        
        frenchButton.layer.cornerRadius = 10
        IzakayaButton.layer.cornerRadius = 10
        cafeButton.layer.cornerRadius = 10
        ramenButton.layer.cornerRadius = 10
        sushiButton.layer.cornerRadius = 10
        japaneseButton.layer.cornerRadius = 10
        chaineseButton.layer.cornerRadius = 10
        barButton.layer.cornerRadius = 10
        yakinikuButton.layer.cornerRadius = 10
        udonButton.layer.cornerRadius = 10
        
        
        // 影の濃さ
        frenchButton.layer.shadowOpacity = 0.5
        IzakayaButton.layer.shadowOpacity = 0.5
        cafeButton.layer.shadowOpacity = 0.5
        ramenButton.layer.shadowOpacity = 0.5
        sushiButton.layer.shadowOpacity = 0.5
        japaneseButton.layer.shadowOpacity = 0.5
        chaineseButton.layer.shadowOpacity = 0.5
        barButton.layer.shadowOpacity = 0.5
        yakinikuButton.layer.shadowOpacity = 0.5
        udonButton.layer.shadowOpacity = 0.5
        
        
        // 影のぼかしの大きさ
        frenchButton.layer.shadowRadius = 3
        IzakayaButton.layer.shadowRadius = 3
        cafeButton.layer.shadowRadius = 3
        ramenButton.layer.shadowRadius = 3
        sushiButton.layer.shadowRadius = 3
        japaneseButton.layer.shadowRadius = 3
        chaineseButton.layer.shadowRadius = 3
        barButton.layer.shadowRadius = 3
        yakinikuButton.layer.shadowRadius = 3
        udonButton.layer.shadowRadius = 3
        
        
        // 影の色
        frenchButton.layer.shadowColor = UIColor.black.cgColor
        IzakayaButton.layer.shadowColor = UIColor.black.cgColor
        cafeButton.layer.shadowColor = UIColor.black.cgColor
        ramenButton.layer.shadowColor = UIColor.black.cgColor
        sushiButton.layer.shadowColor = UIColor.black.cgColor
        japaneseButton.layer.shadowColor = UIColor.black.cgColor
        chaineseButton.layer.shadowColor = UIColor.black.cgColor
        barButton.layer.shadowColor = UIColor.black.cgColor
        yakinikuButton.layer.shadowColor = UIColor.black.cgColor
        udonButton.layer.shadowColor = UIColor.black.cgColor
        
        
        // 影の方向
        frenchButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        IzakayaButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        cafeButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        ramenButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        sushiButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        japaneseButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        chaineseButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        barButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        yakinikuButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        udonButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        
    }
    
    
    
}

extension GenreViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        
        transition.bubbleColor = UIColor.systemGray
        
        return transition
    }
}
