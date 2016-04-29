import Foundation


//var points:Int = 0

//List of suggestions
var suggestionsName: [String] = ["Empire State Building","Sydney Opera","Burj Dubai","The Shard", "Building1","Building2","Building3"]



public class Game {
    var points:Int = 0
    //Initializer
    public init(points:Int) {
        self.points = points
    }
    
    public func showPoints(){
    print("You have",self.points,"points.")
    }
    
}

public class Collection {
    let collectionName:String
    var listOfQuestions: [Question]
    
     public init(collectionName:String, listOfQuestions:[Question]) {
       self.collectionName = collectionName
       self.listOfQuestions = listOfQuestions
    }
    
}

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
    
    public func listRandomOptions(){
        var suggestions:[String] = [self.answerName]
        for i in 0 ... 2 {
            //let randomNumber = Int(arc4random(UInt32(suggestionsName.count)))
            let randomNumber = i
            let suggestion:String = suggestionsName[randomNumber]
            suggestions.append(suggestion)
        }
        //let shuffledSuggestions:[String] = shuffleArray(suggestions)
        //print(shuffledSuggestions)
        print(suggestions)
    }
}

public func addPoints(morepoints:Int){
    game.points += morepoints
}

/*
public func shuffleArray<T>(array: Array<T>) -> Array<T>
{
  for var index = array.count - 1; index > 0; index--
  {
    // Random int from 0 to index-1
    var j = Int(arc4random_uniform(UInt32(index-1)))
 
    // Swap two array elements
    // Notice '&' required as swap uses 'inout' parameters
    swap(&array[index], &array[j])
  }
  return array
}
*/

//Start a new game
let game = Game(points:0)



//Instantiate a question for Eiffel Tower
let q = Question(photoTitle:"Eiffel Tower picture", answerName:"Eiffel Tower", answerLocation:"Paris", answerArchitect:"Gustav Eiffel")

//Show picture to guess
print("Guess: ",q.photoTitle)

//show 4 random options
q.listRandomOptions()

//show result for name answer
q.verifyAnswerName("Eiffel Tower")
//show result for the location
q.verifyAnswerLocation("Paris")
//show result for the architect
q.verifyAnswerArchitect("Gustav")
game.showPoints()

//Instantiate a question for Big Ben
let q2 = Question(photoTitle:"Big Ben", answerName:"Big Ben", answerLocation:"London")

let classicsCollection = Collection(collectionName:"Architecture Classics",listOfQuestions:[q,q2])
