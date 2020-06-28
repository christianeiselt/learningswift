//
////Don't change this
//var studentsAndScores = ["Amy": Int(readLine()!)!, "James": Int(readLine()!)!, "Helen": Int(readLine()!)!]
//
//func highestScore(scores: [String: Int]) {
//
//  //Write your code here.
//  if (studentsAndScores["Amy"] == nil || studentsAndScores["James"] == nil || studentsAndScores["Helen"] == nil)
//  {
//    print("NullPointerException")
//  }
//  else
//  {
//    let studentScores = [studentsAndScores["Amy"]!,studentsAndScores["James"]!,studentsAndScores["Helen"]!]
//    print(studentScores.max())
//  }
//}

//Don't change this
highestScore(scores: studentsAndScores)

//Don't change this
var studentsAndScores = ["Amy": Int(readLine()!)!, "James": Int(readLine()!)!, "Helen": Int(readLine()!)!]

func highestScore(scores: [String: Int]) {
  
  //Write your code here.
  let a = studentsAndScores["Amy"]!
  let b = studentsAndScores["James"]!
  let c = studentsAndScores["Helen"]!
  
  var temp = 0
  //If a is greater than b
  if a > temp {
    //And a is also greater than c
    temp = a
  }
    
  if b > temp {
    temp = b
  }
  
  if c > temp {
    temp = c
  }
  
  print(temp)
  
  
}

//Don't change this
highestScore(scores: studentsAndScores)
