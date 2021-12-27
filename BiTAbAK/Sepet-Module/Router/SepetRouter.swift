//
//  SepetRouter.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 18.12.2021.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {

    static func createModule(ref: SepetVc) {
        let presenter : ViewToPresenterSepetProtocol & InteractorToPresenterSepetProtocol = SepetPresenter()
        
        //View controller için
        ref.sepetPresenterNesnesi = presenter
        
        //Presenter için
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        
        //Interactor için
        //ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
}
