//
//  AnasayfaPresenter.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 15.12.2021.
//

import Foundation

class AnasayfaPresenter: ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?

    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
    
    func sil(sepetYemek_id: Int) {
        anasayfaInteractor?.sepettenYemekSil(sepetYemek_id: sepetYemek_id)
    }
    
    
}
extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(yemekListesi: Array<Yemekler>) {
        anasayfaView?.vieweVeriGonder(yemekListesi: yemekListesi)

    }
    
}
