//
//  FruitDetailView.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitDetailView: UIViewController, FruitDetailViewProtocol {

    @IBOutlet var fruitImage: UIImageView!
    @IBOutlet var fruitNameLbl: UILabel!
    @IBOutlet var vitaminLbl: UILabel!
    @IBOutlet weak var backgroundView: UIImageView!
    
    var presenter: FruitDetailPresenterProtocol?
    
    var roundButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupFloatingBtn()
        addTap2Image()
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        UIAlertController.showAlert(title:"Warning!", msg:"Memory is low! Please check your device! May be should close or clean some apps", target: self)
    }
    
    override func viewWillLayoutSubviews() {
        roundButton.layer.cornerRadius = roundButton.layer.frame.size.width/2
        roundButton.backgroundColor = UIColor.lightGray
        roundButton.clipsToBounds = true
        roundButton.setImage(UIImage(named:"floating-button-menu"), for: .normal)
        roundButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8),
            roundButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16),
            roundButton.widthAnchor.constraint(equalToConstant: 50),
            roundButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    override func viewDidLayoutSubviews() {
        setupUI()
    }
    
    private func addTap2Image() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(FruitDetailView.tappedOnImage))
        fruitImage.addGestureRecognizer(tap)
        fruitImage.isUserInteractionEnabled = true
    }
    
    @objc func tappedOnImage()
    {
        fruitImage.springViewAnimation(animatedElement: self.fruitImage, duration: 0.5)
    }
    
    private func setupUI() {
        backgroundView.frame = self.view.frame
        //backgroundView.transform.scaledBy(x: 2.0, y: 2.0)
        // Blur effect View
        applyBlurEffectView.frame = backgroundView.frame
        backgroundView.addSubview(applyBlurEffectView)
    }
    
    private func setupFloatingBtn() {
        self.roundButton = UIButton(type: .custom)
        self.roundButton.setTitleColor(UIColor.orange, for: .normal)
        self.roundButton.addTarget(self, action: #selector(ButtonClick(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(roundButton)
    }

    func showFruitDetail(with fruit: Fruit) {
        title = fruit.name
        fruitImage.image = UIImage(named: fruit.name)
        self.fruitImage.layer.masksToBounds = true
        self.fruitImage.layer.cornerRadius = self.fruitImage.frame.width/16.0
        fruitImage.springViewAnimation(animatedElement: self.fruitImage, duration: 0.5)
        fruitNameLbl.text = fruit.name
        vitaminLbl.text = fruit.vitamin
    }
    
    // menu operations
    func showMenu() {
           
       }
    
    /** Action Handler for button **/
    @IBAction func ButtonClick(_ sender: UIButton){
        self.fruitImage.springViewAnimation(animatedElement: self.fruitImage, duration: 0.5)
    
    }
    
    
    
    deinit {
        print("FruitDetailView removed")
    }

}
