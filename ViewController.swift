import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    let questions = [
        Question(question: "Today is Friday", answer: true),
        Question(question: "Everyday is Friday", answer: true),
        Question(question: "Tomorrow is Monday", answer: false)
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0.0
        updateUi()
    }
    @IBAction func answerPressed(_ sender: UIButton) {
        var answer = false
        if(sender.currentTitle == "True") {
            answer = true
        }
        
        if(answer == questions[questionIndex].answer) {
            // correct answer
        } else {
            // wrong answer
        }
        
        if(questionIndex + 1 < questions.count) {
            questionIndex += 1
        } else {
            questionIndex = 0
        }
        progressBar.progress = Float(questionIndex) / Float(questions.count)
        updateUi()
    }
    
    func updateUi() {
        questionText.text = questions[questionIndex].question
    }
    

}

