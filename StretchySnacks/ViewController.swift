//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Rushan on 2017-06-08.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Properties
    @IBOutlet weak var stretchyView: UIView!
    @IBOutlet weak var stretchyViewHeightCons: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    var labelHeight: NSLayoutConstraint!
    var stackView: UIStackView = UIStackView()
    var snackLabel: UILabel = UILabel()
    var snackArray = [String]()
    var snacks: [String] = ["oreos", "pizzapockets", "poptarts", "popsicle", "ramen"]
    
    //MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snackArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let snack = snackArray[indexPath.row] as String
        cell.textLabel!.text = snack
        
        return cell
    }
    
    
    //MARK: StackView Helper method
    func addView(){
        //stack view
        stackView.axis = UILayoutConstraintAxis.horizontal
        stackView.distribution = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.isHidden = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0.0
        
        for(index, element) in snacks.enumerated(){
            let snackButtons: UIButton = UIButton()
            snackButtons.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
            snackButtons.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/5.0).isActive = true
            snackButtons.tag = index
            snackButtons.addTarget(self, action: #selector(ViewController.addSnacks(_:)), for: .touchUpInside)
            snackButtons.setImage(UIImage(named: element), for: .normal)
            //add buttons to stackView
            stackView.addArrangedSubview(snackButtons)
            
        }
        //add stackView to stretchyView
        stretchyView.addSubview(stackView)
        
        //MARK :Text
        snackLabel.text = "Snacks"
        snackLabel.textAlignment = .center
        snackLabel.translatesAutoresizingMaskIntoConstraints = false
        //add Label to stretchyView
        stretchyView.addSubview(snackLabel)
        
        //MARK: Contraints
        //stackView
        stackView.centerXAnchor.constraint(equalTo: stretchyView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: stretchyView.bottomAnchor).isActive = true
        //label
        snackLabel.centerXAnchor.constraint(equalTo: stretchyView.centerXAnchor).isActive = true
        labelHeight = snackLabel.centerYAnchor.constraint(equalTo: stretchyView.centerYAnchor, constant: 0.0)
        labelHeight.isActive = true
        
        
    }
    
    func addSnacks(){
        
    }
    
    //MARK: Actions
    @IBAction func plusTapped(_ sender: UIButton) {
        print("plus icon pressed")
        if self.stretchyViewHeightCons.constant == 49 {
            self.stretchyViewHeightCons.constant == 200
            labelHeight.constant = -40.0
            stackView.isHidden = false
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: <#T##UIViewAnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        }
        
    }

}

