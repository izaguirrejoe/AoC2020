import Foundation

var numbers = try String(contentsOfFile: "day10").trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n").compactMap{Int($0)}

numbers.sort()
numbers.insert(0, at: 0)
numbers.append(numbers.max()!+3)

var dict = [Int:Int]()

for i in 1..<numbers.count{
    let diff = numbers[i] - numbers[i-1]
    dict[diff, default: 0] += 1
}

print("Number of 1-jolt differences", dict[1]!)
print("Number of 3-jolt differences", dict[3]!)

var memo = [Int:Int]()

func helper(_ i: Int) -> Int{
        
    if i == numbers.count-1{
        return 1
    }
    
    if let val = memo[i]{
        return val
    }
    
    var answer = 0
    for j in i+1..<numbers.count{
        if numbers[j] - numbers[i] <= 3{
            answer += helper(j)
        }
    }
    
    memo[i] = answer
    return answer
}

print(helper(0))


