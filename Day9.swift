import Foundation

let numbers = try String(contentsOfFile: "day9").trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n").compactMap{Int($0)}

//Part A
//var current = [Int]()
//
//for i in 0..<25{
//    current.append(numbers[i])
//}

//for i in 25..<numbers.count{
//    let target = numbers[i]
//    let dict = current.reduce(into: Set<Int>()){$0.insert($1)}
//    var result = -1
//    for i in current{
//        if dict.contains(target - i){
//            print("Target found, continue to next element")
//            result = target - i
//            break
//        }
//    }
//    if result == -1{
//        print("Found a number not contained in previous 25:", target)
//        break
//    }
//    current.dropFirst()
//    current.append(target)
//}

var target = 1504371145
for i in 0..<numbers.count{
    var runningTotal = numbers[i]
    for j in (i+1)..<numbers.count{
        runningTotal += numbers[j]
        if runningTotal == target{
            print("Found the contiguous set:", i, j)
            print(numbers[i...j].min()! + numbers[i...j].max()!)
            break
        }
    }
}


