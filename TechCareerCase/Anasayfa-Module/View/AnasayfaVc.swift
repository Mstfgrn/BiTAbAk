//
//  AnasayfaVc.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 11.12.2021.
//

import UIKit

class AnasayfaVc: UIViewController {
    var yemekliste = [Yemekler]()
    
    @IBOutlet weak var yemekCollectionView: UICollectionView!
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        textAtt()
        collectionViewSetup()
        AnasayfaRouter.createModule(ref: self)
    }
    
    //Anasayfaya geri döndüğümüzde çalışır
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! YemekDetayVc
            gidilecekVC.yemek = yemek
        }
    }
    
    func textAtt(){
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 29, weight: .bold)
        ]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
    
    func collectionViewSetup(){
        yemekCollectionView.delegate = self
        yemekCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        yemekCollectionView.collectionViewLayout = layout
    }
}

extension AnasayfaVc: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemekliste.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = yemekliste[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yemekHucre", for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 12
        cell.configure(ylist: yemek)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let yemek = yemekliste[indexPath.row]
        cell?.isUserInteractionEnabled = false
        performSegue(withIdentifier: "toDetay", sender: yemek)
        cell?.startTappedAnimation(with: { [weak self] finish in
            if finish {
                cell?.isUserInteractionEnabled = true
            }
        })
    }
}

extension AnasayfaVc: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width - 40) / 2
        return CGSize(width: width, height: 250)
    }
}

extension AnasayfaVc : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemekListesi: Array<Yemekler>) {
        self.yemekliste = yemekListesi
        DispatchQueue.main.async {
            self.yemekCollectionView.reloadData()
        }
    }
}
