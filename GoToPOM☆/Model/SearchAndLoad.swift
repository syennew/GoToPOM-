//
//  SearchAndLoad.swift
//  GoToPOM☆
//
//  Created by 石丸剣心 on 2022/10/14.
//

import Foundation
import FirebaseFirestore
import Alamofire
import SwiftyJSON
import SDWebImage


protocol DoneCatchDataProtocol {
    
    func doneCatchData(array: [TenpoDataSets])
    
}


class SearchAndLoad {
    
    var db = Firestore.firestore()
    var tenpoDataSetsArray = [TenpoDataSets]()
    var resultParPage = Int()
    var urlString = String()
    
    var doneCatchDataProtocol: DoneCatchDataProtocol?
    
    init(urlString: String) {
        
        self.urlString = urlString
        
    }
    
    
    func search() {
        
        let encodeUrlString = self.urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print(urlString)
        
        AF.request(encodeUrlString!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result {
                
            case .success:
                do {
                    let json: JSON = try JSON(data: response.data!)
                    
                    var totalHitcount = json["results"]["results_returned"].string
                    var hitcount = Int(totalHitcount!)
                    
                    
                    self.resultParPage = hitcount!
                    
                    if self.resultParPage >= 1 {
                        
                        for i in 0...self.resultParPage - 1 {
                            
                            if let shopName = json["results"]["shop"][i]["name"].string,
                               let shopGenre = json["results"]["shop"][i]["genre"]["name"].string,
                               let shopPhoto = json["results"]["shop"][i]["photo"]["mobile"]["l"].string {
                                
                                
                                let dataSets = TenpoDataSets(tenpoName: shopName, tenpoImage: shopPhoto, tenpoGenre: shopGenre)
                                
                                if shopName.contains("Error 404") == true || shopName.contains("Error 404") == true || shopPhoto.contains("Error 404") {
                                    
                                    
                                }else {
                                    
                                    self.tenpoDataSetsArray.append(dataSets)
                                    
                                }
                                
                            }
                            
                            
                        } // for i in
                        
                    } else {
                        // resultParPageの中身が1より少なかった場合
                        
                        return
                        
                    }
                    
                    self.doneCatchDataProtocol?.doneCatchData(array: self.tenpoDataSetsArray)
                    
                    
                } catch {
                    
                    
                    
                }
            case .failure(_):
                break
            }
            
        }
        
        
    }
    
}
