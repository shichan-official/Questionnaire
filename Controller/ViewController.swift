import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var score: UILabel!
    
    var quizEngine = QuizEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScore()
        updateProgressBar()
        updateUi()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        var answer = false
        if(sender.currentTitle == "True") {
            answer = true
        }
        
        let answerStatus = quizEngine.verifyAnswer(answer)
        
        if(answerStatus) {
            // correct answer
            quizEngine.addScore()
            sender.backgroundColor = UIColor.green
        } else {
            // wrong answer
            sender.backgroundColor = UIColor.red
        }
        
        quizEngine.nextQuestion()
        updateScore()
        updateProgressBar()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo:nil, repeats: false)
    }
    
    @objc func updateUi() {
        questionText.text = quizEngine.getCurrentQuestion()
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }
    
    func updateProgressBar() {
        progressBar.progress = quizEngine.calculateProgress()
    }
    
    func updateScore() {
        score.text = "Score: \(quizEngine.score)"
    }
}

