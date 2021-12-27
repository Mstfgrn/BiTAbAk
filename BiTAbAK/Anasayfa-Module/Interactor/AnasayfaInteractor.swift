//
//  AnasayfaInteractor.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 15.12.2021.
//

import Foundation
import Alamofire
class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var yemekliste = [Yemekler]()
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).responseJSON { response in
            if let data = response.data{
                do{
                    let cevap =  try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    if let gelenData = cevap.yemekler{
                        self.yemekliste = gelenData
                        self.anasayfaPresenter?.presenteraVeriGonder(yemekListesi: self.yemekliste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

