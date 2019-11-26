//
//  FruitListWireframe.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitListWireframe: FruitListWireFrameProtocol {
   
    func pushToFruitDetail(with fruit: Fruit,from view: UIViewController) {
        let fruitDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "FruitDetailView") as! FruitDetailView
        FruitDetailWireFrame.createFruitDetailModule(with: fruitDetailViewController, and: fruit)
        view.navigationController?.pushViewController(fruitDetailViewController, animated: true)
    }
    
    class func createFruitListModule(fruitListModuleRef: FruitListView) {
       let presenter: FruitListPresenterProtocol & FruitListOutputInteractorProtocol = FruitListPresenter()
        
        fruitListModuleRef.presenter = presenter
        fruitListModuleRef.presenter?.wireframe = FruitListWireframe()
        fruitListModuleRef.presenter?.view = fruitListModuleRef
        fruitListModuleRef.presenter?.interactor = FruitListInteractor()
        fruitListModuleRef.presenter?.interactor?.presenter = presenter
    }
    
}
