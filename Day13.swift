import Foundation

let lines = try String(contentsOfFile: "day13").trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n")

let timestamp = Int(lines[0])!
let busLinesArray = lines[1].components(separatedBy: ",")
let busLines = busLinesArray.compactMap {Int($0)}

var runningTime = timestamp
mainLoop: while(true){
    for busLine in busLines{
        if runningTime % busLine == 0{
            print("Bus Line:", busLine)
            print("Time of departure:", runningTime)
            print((runningTime-timestamp)*busLine)
            break mainLoop
        }
    }
    runningTime += 1
}

for i in 0..<busLinesArray.count{
    if let num = Int(busLinesArray[i]){
        print(i, num)
    }
}

//Part2 Solved with Wolfram Alpha lol

