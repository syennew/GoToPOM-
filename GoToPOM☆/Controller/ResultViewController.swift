//
//  WebViewController.swift
//  GoToPOM☆
//
//  Created by 石丸剣心 on 2022/10/13.
//

import UIKit



class ResultViewController: UIViewController {
    
    
    
    @IBOutlet weak var tenpoImageView: UIImageView!
    @IBOutlet weak var tenpoNameLabel: UILabel!
    
    @IBOutlet weak var go_webVCButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var goback_TopButton: UIButton!
    
    
    var tenpoName = String()
    var tenpoImage = String()
    var tenpoGenre = String()
    
    var judge = Bool()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddShadow_Buttons()
        tenpoName = UserDefaults.standard.string(forKey: "tenpoName")!
        tenpoImage = UserDefaults.standard.string(forKey: "tenpoImage")!
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        judge = UserDefaults.standard.bool(forKey: "judge")

        Set_tenpoData()
        print(judge.description)
        
    }
    
    
    
    
    @IBAction func Go_webVCButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let webVC = storyboard.instantiateViewController(withIdentifier: "webVC") as! WebViewController
        var urlstring = tenpoName
        
        // urlstringに入っている店舗名をパーセントエンコードしてurlに組み込む
        var encodeString = urlstring.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        
        webVC.searchString = "https://www.google.co.jp/search?q=\(encodeString!)"
        
        self.present(webVC, animated: true)
    }
    
    
    @IBAction func ShareButton(_ sender: Any) {
        
        let searchString = tenpoName
        let encodeString = searchString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        let url = "https://www.google.co.jp/search?q=\(encodeString!)"
        let url_tmp = URL(string: url)
        let urlArray = [url_tmp]
        
        let activityViewController = UIActivityViewController(activityItems: urlArray, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true)
        
    }
    
    
    @IBAction func GoBack_TopButton(_ sender: Any) {
        
        
        
        if judge == true {
            
            self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
            
        } else if judge == false {
            
            self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
            
        }
            
    }
    
    
    
    func Set_tenpoData() {
        
        print(tenpoImage.debugDescription)
        tenpoImageView.sd_setImage(with: URL(string:tenpoImage))
        tenpoNameLabel.text = tenpoName
        
        
    }
    
    
    
    func AddShadow_Buttons() {
        
        go_webVCButton.layer.cornerRadius = 10
        shareButton.layer.cornerRadius = 10
        goback_TopButton.layer.cornerRadius = 10
        
        tenpoImageView.layer.cornerRadius = 10
        
        // 影の濃さ
        go_webVCButton.layer.shadowOpacity = 0.5
        shareButton.layer.shadowOpacity = 0.5
        goback_TopButton.layer.shadowOpacity = 0.5
        
        tenpoImageView.layer.shadowOpacity = 0.5
        
        // 影のぼかしの大きさ
        go_webVCButton.layer.shadowRadius = 3
        shareButton.layer.shadowRadius = 3
        goback_TopButton.layer.shadowRadius = 3
        
        tenpoImageView.layer.shadowRadius = 3
        
        // 影の色
        go_webVCButton.layer.shadowColor = UIColor.black.cgColor
        shareButton.layer.shadowColor = UIColor.black.cgColor
        goback_TopButton.layer.shadowColor = UIColor.black.cgColor
        
        tenpoImageView.layer.shadowColor = UIColor.black.cgColor
        
        // 影の方向
        go_webVCButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        shareButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        goback_TopButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        tenpoImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
    }
    
    

}
