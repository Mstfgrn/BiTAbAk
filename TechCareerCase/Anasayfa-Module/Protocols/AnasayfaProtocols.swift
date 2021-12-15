//
//  AnasayfaProtocols.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 15.12.2021.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func yemekleriYukle()
    func sil(sepetYemek_id: Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYemekleriAl()
    func sepettenYemekSil(sepetYemek_id: Int)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(gorevlerListesi:Array<Yemekler>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(gorevlerListesi:Array<Yemekler>)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVc)
}
