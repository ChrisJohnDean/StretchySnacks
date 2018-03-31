//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Chris Dean on 2018-03-30.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import UIKit


class StretchyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var plusIconOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
//    var selectedImage
    var imageViewArray = Array<UIImageView>()
    var selectedImages = Array<String>()
    var plusButtonSelected: Bool = false
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let oreoView = UIImageView(image: #imageLiteral(resourceName: "oreos"))
        imageViewArray.append(oreoView)
        let pocketView = UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))
        imageViewArray.append(pocketView)
        let poptartView = UIImageView(image: #imageLiteral(resourceName: "pop_tarts"))
        imageViewArray.append(poptartView)
        let popsicleView = UIImageView(image: #imageLiteral(resourceName: "popsicle"))
        imageViewArray.append(popsicleView)
        let ramenView = UIImageView(image: #imageLiteral(resourceName: "ramen"))
        imageViewArray.append(ramenView)
        addTapGesture()
        createStackView()
        stackView.isHidden = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    @IBAction func plusIconAction(_ sender: Any) {
        animateSpringyHeader()
    }
    
    func addTapGesture() {
        for i in imageViewArray {
            i.tag = imageViewArray.index(of: i)!
            i.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(StretchyViewController.didTapImage))
            i.addGestureRecognizer(tap)
        }
    }
    
    @objc private func didTapImage(sender: UITapGestureRecognizer) {
        
        guard let tag = sender.view?.tag else {return}
        switch tag {
        case 0:
            selectedImages.append("Oreos")
        case 1:
            selectedImages.append("Pizza Pockets")
        case 2:
            selectedImages.append("Poptarts")
        case 3:
            selectedImages.append("Popsicle")
        case 4:
            selectedImages.append("Ramen")
        default:
            break
        }
        tableView.reloadData()
    }
    
    func createStackView() {
        
        stackView = UIStackView(arrangedSubviews: imageViewArray)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(stackView)
        stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    

    
    func animateSpringyHeader() {
        
        if plusButtonSelected {
            let rotate = CGAffineTransform(rotationAngle: 0)
            plusIconOutlet.transform = rotate
            stackView.isHidden = true
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
                self.heightConstraint.constant = 44
                self.view.layoutIfNeeded()
                self.plusButtonSelected = false
            }, completion: nil)
        } else {
            let rotate = CGAffineTransform(rotationAngle: 0.785398)
            plusIconOutlet.transform = rotate
            stackView.isHidden = false
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
                self.heightConstraint.constant = 200
                self.view.layoutIfNeeded()
                self.plusButtonSelected = true
            }, completion: nil)
        }
    }
    
}

// UITableViewDataSource methods
extension StretchyViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedString = selectedImages[indexPath.row]
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = selectedString
        return cell
    }
    
}











