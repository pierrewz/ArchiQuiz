import Foundation


var points:Int = 0

//List of suggestions
var suggestionsName: [String] = ["Empire State Building","Sydney Opera","Burj Dubai","The Shard", "Building1","Building2","Building3"]

let randomNumber = Int(arc4random_uniform(UInt32(suggestionsName.count)))
var suggestion:String = suggestionsName[randomNumber]
print(suggestion)

public class Question {
    let photoTitle:String
    let photoLink:String?
    let answerName:String
    let answerLocation:String
    let answerArchitect:String?
    
    //Initializer
    public init(photoTitle:String, photoLink:String? = nil, answerName:String, answerLocation:String, answerArchitect:String? = nil) {
        self.photoTitle = photoTitle
        self.photoLink = photoLink
        self.answerName = answerName
        self.answerLocation = answerLocation
        self.answerArchitect = answerArchitect
    }
    
    public func verifyAnswerName(name:String) -> Bool {
        if self.answerName == name{
            print("Correct answer, you found the building name!")
            addPoints(10)
            return true
        } else {
            print("Wrong answer!")
            return false
        }
    }
    
    public func verifyAnswerLocation(location:String) -> Bool {
        if self.answerLocation == location {
            print("Correct answer, you found the location/city!")
            addPoints(10)
            return true
        } else {
            print("Wrong answer!")
            return false
        }
    }
    
    public func verifyAnswerArchitect(architect:String) -> Bool {
        if self.answerArchitect == architect {
            print("Correct answer, you found the architect!")
            addPoints(20)
            return true
        } else {
            print("Wrong answer!")
            return false
        }
    }
}

public func addPoints(morepoints:Int){
    points += morepoints
}

public func showPoints(){
    print("You have",points,"points.")
}

//Instantiate a question for Eiffel Tower
let q = Question(photoTitle:"Eiffel Tower picture", answerName:"Eiffel Tower", answerLocation:"Paris", answerArchitect:"Eiffel")

print(q.photoTitle)
//show result for name answer
q.verifyAnswerName("Eiffel Tower")
//show result for the location
q.verifyAnswerLocation("Paris")
//show result for the architect
q.verifyAnswerArchitect("Gustav Eiffel")
showPoints()

