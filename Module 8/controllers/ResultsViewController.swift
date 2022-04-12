//
//  ResultsViewController.swift
//  Module 8
//
//  Created by Beau Nouvelle on 11/4/2022.
//

import UIKit

class ResultsViewController: UIViewController {

    let reccomendationLabel = UILabel()
    var answers: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        showReccomendation()
    }

    func setupSubviews() {
        view.addSubview(reccomendationLabel)
        reccomendationLabel.translatesAutoresizingMaskIntoConstraints = false
        reccomendationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        reccomendationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        reccomendationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    func showReccomendation() {

        var resturantCounts: [Restuarant:Int] = [.hungries:0, .nandos: 0, .mcdonalds: 0]

        for answer in answers {
            if answer.category.contains(where: { rest in
                rest == .hungries
            }) {
                resturantCounts[.hungries]! += 1
            }

            if answer.category.contains(where: { rest in
                rest == .nandos
            }) {
                resturantCounts[.nandos]! += 1
            }

            if answer.category.contains(where: { rest in
                rest == .mcdonalds
            }) {
                resturantCounts[.mcdonalds]! += 1
            }
        }

        let maxRest = max(resturantCounts[.mcdonalds]!, resturantCounts[.hungries]!, resturantCounts[.nandos]!)
        let restaurant = resturantCounts.first { key, value in
            value == maxRest
        }
        reccomendationLabel.text = restaurant?.key.rawValue
    }

}
