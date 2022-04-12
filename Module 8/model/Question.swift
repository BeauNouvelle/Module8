//
//  Question.swift
//  Module 8
//
//  Created by Beau Nouvelle on 11/4/2022.
//

import Foundation

struct Question {
    let title: String
    let answers: [Answer]
}

struct Answer {
    let label: String
    let category: [Restuarant]
}

enum Restuarant: String {
    case nandos
    case mcdonalds
    case hungries
}

let restuarantQuestions = [
    Question(title: "What value?", answers: [
        Answer(label: "$0-$10", category: [.mcdonalds]),
        Answer(label: "$11-$15", category: [.hungries]),
        Answer(label: "$15+", category: [.nandos])
    ]),
    Question(title: "Takeaway", answers: [
        Answer(label: "Yes", category: [.mcdonalds, .hungries]),
        Answer(label: "NO", category: [.nandos])
    ]),
    Question(title: "Location", answers: [
        Answer(label: "North", category: [.mcdonalds]),
        Answer(label: "South", category: [.hungries]),
        Answer(label: "East", category: [.nandos])
    ])
]
