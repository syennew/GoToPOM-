//
//  StartViewController.swift
//  GoToPOM☆
//
//  Created by 石丸剣心 on 2022/10/12.
//

import UIKit
import CoreLocation
import BubbleTransition



class StartViewController: UIViewController, CLLocationManagerDelegate {
    
    let transition = BubbleTransition()
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    var latitude = Float()
    var longitude = Float()
    
    
    @IBOutlet weak var go_PlaceVCButton: UIButton!
    @IBOutlet weak var searchNearShopButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddShadow_Buttons()
        
        self.locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            
            self.locationManager.delegate = self
            self.locationManager.distanceFilter = 10
            self.locationManager.startUpdatingLocation()
            
        }
        
    }
    

    
    // PlaceVCに画面遷移
    @IBAction func Go_PlaceVCButton(_ sender: Any) {
        
        transition.startingPoint = go_PlaceVCButton.center
        
        // 画面遷移
        let placeVC = storyboard?.instantiateViewController(withIdentifier: "placeVC") as! PlaceViewController
        placeVC.transitioningDelegate = self
        placeVC.modalPresentationStyle = .custom
        
        self.present(placeVC, animated: true)
        
    }
    

    
    
    // gachaVCに位置情報を渡しながら,genreVCに画面遷移
    @IBAction func SearchNearShopButton(_ sender: Any) {
        
        print(latitude.debugDescription)
        
        // バブルアクションが起こる起点をボタンの真ん中に設定する
        transition.startingPoint = searchNearShopButton.center
        
        UserDefaults.standard.set(self.latitude, forKey: "lat")
        UserDefaults.standard.set(self.longitude, forKey: "lon")
        
        
        let genreVC = storyboard?.instantiateViewController(withIdentifier: "genreVC") as! GenreViewController
        
        genreVC.transitioningDelegate = self
        genreVC.modalPresentationStyle = .custom
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewController(withIdentifier: "resultVC") as! ResultViewController
        
        resultVC.judge = true
        
        // 画面遷移
        self.present(genreVC, animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            
            self.latitude = Float(location.coordinate.latitude)
            self.longitude = Float(location.coordinate.longitude)
            
        }

        
    }
    
    
    
    func AddShadow_Buttons() {
        
        go_PlaceVCButton.layer.cornerRadius = 10
        searchNearShopButton.layer.cornerRadius = 10
        
        // 影の濃さ
        go_PlaceVCButton.layer.shadowOpacity = 0.5
        searchNearShopButton.layer.shadowOpacity = 0.5
        
        // 影のぼかしの大きさ
        go_PlaceVCButton.layer.shadowRadius = 3
        searchNearShopButton.layer.shadowRadius = 3
        
        // 影の色
        go_PlaceVCButton.layer.shadowColor = UIColor.black.cgColor
        searchNearShopButton.layer.shadowColor = UIColor.black.cgColor
        
        // 影の方向
        go_PlaceVCButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        searchNearShopButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        
    }
    


}

extension StartViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        
        if transition.startingPoint == searchNearShopButton.center {
            
            transition.bubbleColor = UIColor.systemYellow
            
        } else {
            
            transition.bubbleColor = UIColor.systemBlue
            
        }
        return transition
    }
}
