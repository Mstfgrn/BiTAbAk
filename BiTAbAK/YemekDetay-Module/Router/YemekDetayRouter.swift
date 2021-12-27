//
//  YemekDetayRouter.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 16.12.2021.
//

import Foundation
class YemekDetayRouter : PresenterToRouterYemekDetayProtocol {
    static func createModule(ref: YemekDetayVc) {
        ref.yemekDetayPresenterNesnesi = YemekDetayPresenter()
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = YemekDetayInteractor()
    }
}
