//
//  GachaViewController.swift
//  GoToPOM☆
//
//  Created by 石丸剣心 on 2022/10/13.
//

import UIKit
import Lottie
import CoreLocation



class GachaViewController: UIViewController,CLLocationManagerDelegate,DoneCatchDataProtocol {

    
    
    var tenpoDataArray = [TenpoDataSets]()
    
    var number = 0
    
    var lat = Float()
    var lot = Float()
    
    var tenpoName = String()
    var tenpoImage = String()
    var tenpoGenre = String()
    
    var genreString = String()
    
    var judge_gachaVC = Bool()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Search(urlString: genreString)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        gacha()
        Set_Animation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        UserDefaults.standard.removeObject(forKey: "lat")
        UserDefaults.standard.removeObject(forKey: "lon")
        
    }
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            
            self.lat = Float(location.coordinate.latitude)
            self.lot = Float(location.coordinate.longitude)
            
        }
        
        
    }
    
    
    
    
    func go() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewController(withIdentifier: "resultVC") as! ResultViewController
        
        present(resultVC, animated: true)
        
    }
    
    
    func Set_Animation() {
        
        let animationView = AnimationView()
        let animation = Animation.named("gacha")
        
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play(completion: {(finishd: Bool) in
            self.go()
        })
        view.addSubview(animationView)
        
    }
    
    
    func gacha() {
        
        
        number = Int.random(in: 0...tenpoDataArray.count)
        print(number.description)
        
        
        if number >= 0 && tenpoDataArray.count > 0 {
            
            tenpoName = tenpoDataArray[number].tenpoName
            tenpoImage = tenpoDataArray[number].tenpoImage
            tenpoGenre = tenpoDataArray[number].tenpoGenre
            
        
        } else {
            
            let alert = UIAlertController(title: "エラー", message: "お店が見当たらないみたいです...。条件を変えてもう一度お試しください。", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default) {(action) in
                
                if self.judge_gachaVC != true {
                    
                    self.presentingViewController?.presentingViewController?.dismiss(animated: true)
                    
                    return
                    
                } else {
                    
                    self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
                    
                    return
                }
            }
            
            alert.addAction(defaultAction)
            present(alert, animated: true)
            
            return
        }
        
        
        print(self.tenpoName.debugDescription)
        UserDefaults.standard.set(self.tenpoName, forKey: "tenpoName")
        UserDefaults.standard.set(self.tenpoImage, forKey: "tenpoImage")
        
    }
    
    
    
    func Search(urlString: String) {
        
        lat = UserDefaults.standard.float(forKey: "lat")
        lot = UserDefaults.standard.float(forKey: "lon")
        
        print(lat.debugDescription)
        
        if lat == 0 && lot == 0 {
            
            let url = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=f6316967937072a9&keyword=\(urlString) \(UserDefaults.standard.string(forKey: "place")!)&order=4&count=30&format=json"
            
            let searchModel = SearchAndLoad(urlString: url)
            searchModel.doneCatchDataProtocol = self
            searchModel.search()
            
            judge_gachaVC = true
            
            UserDefaults.standard.set(true, forKey: "judge")
            
        } else {
            
            let url = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=f6316967937072a9&lat=\(self.lat)&lng=\(self.lot)&range=5keyword=\(urlString)&order=4&count=30&format=json"
            
            let searchModel = SearchAndLoad(urlString: url)
            searchModel.doneCatchDataProtocol = self
            searchModel.search()
            
            judge_gachaVC = false
            
            UserDefaults.standard.set(false, forKey: "judge")
            
            
        }
        
    }
    
    
    func doneCatchData(array: [TenpoDataSets]) {
        
        tenpoDataArray = array
    }
    

}
