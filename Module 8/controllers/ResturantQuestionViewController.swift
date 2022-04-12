//
//  ResturantQuestionViewController.swift
//  Module 8
//
//  Created by Beau Nouvelle on 11/4/2022.
//

import Foundation
import UIKit

class RestaurantViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!

    private let answerSegueID = "showResults"

    var chosenAnswers: [Answer] = []
    var questions = restuarantQuestions.shuffled()

    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }

    @IBAction func buttonTapped(sender: UIButton) {
        let answerTitle = sender.titleLabel?.text
        let allAnswers = restuarantQuestions.flatMap { $0.answers }
        if let answer = allAnswers.first(where: { $0.label == answerTitle }) {
            chosenAnswers.append(answer)
        } else {
            print("no answer found for \(answerTitle ?? "what????")")
        }

        // if last question. Show answers.
        if questions.isEmpty {
            performSegue(withIdentifier: answerSegueID, sender: nil)
        } else {
            nextQuestion()
        }
    }

    func nextQuestion() {
        let nextQuestion = questions.popLast()!
        let shuffedAnswers = nextQuestion.answers.shuffled()
        let iterationCount = min(answerButtons.count, shuffedAnswers.count)

        questionLabel.text = nextQuestion.title

        for button in answerButtons {
            button.isHidden = true
        }

        for index in 0..<iterationCount {
            answerButtons[index].titleLabel?.text = shuffedAnswers[index].label
            answerButtons[index].isHidden = false
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultsViewController {
            destination.answers = chosenAnswers
        }
    }

}


