var valid = 0
let lines = readTextFile(file: "day2", separatedBy: .newlines)
for line in lines{
    if line.isEmpty{
        continue
    }
    let components = line.split(separator: " ")
    let freqString = components[0]
    let letterString = components[1]
    let password = components[2]
    
    //Get Min and Max
    let hypenIndex = freqString.firstIndex(of: "-")!
    let min = Int(freqString[..<hypenIndex])!
    
    let nextIndex = freqString.index(after: hypenIndex)
    let max = Int(freqString[nextIndex...])!
    
    let letter = letterString.first!
    
//    Part 1
//    var totalChar = 0
//    for char in password{
//        if char == letter{
//            totalChar += 1
//        }
//    }
//    if totalChar >= min && totalChar <= max{
//        valid += 1
//    }
    
    let minIndex = password.index(password.startIndex, offsetBy: min-1)
    let maxIndex = password.index(password.startIndex, offsetBy: max-1)
    let a = password[minIndex], b = password[maxIndex]
    
    if((a == letter || b == letter) && !(a == letter && b == letter) ){
        valid += 1
    }
        
}

print(valid)

