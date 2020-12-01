import Foundation

///Finds two numbers that sum to a third number
func twoSum(arr: [Int], target: Int) -> (Int,Int)?{
    var set = Set<Int>()
    for num in arr{
        let complement = target - num
        if set.contains(complement){
            return (num, complement)
        }
        set.insert(num)
    }
    return nil
}

///Find three numbers that sum to a target
func threeSum(arr: [Int], target: Int) -> (Int, Int, Int)? {
    let arrCpy = arr.sorted()
    for pivot in 0..<arrCpy.count{
        var left = pivot + 1
        var right = arrCpy.count-1
        while(left < right){
            let a = arrCpy[pivot], b = arrCpy[left], c = arrCpy[right]
            print("\(a) + \(b) + \(c) = \(a+b+c)")
            if a + b + c == target{
                return (a,b,c)
            }
            else if a + b + c > target{
                right -= 1
            }
            else{
                left += 1
            }
        }
    }
    return nil
}


let lines = readTextFile(file: "inputDay1", separatedBy: .newlines)
let nums = lines.compactMap {Int($0)}

if let (a,b,c) = threeSum(arr: nums, target: 2020){
    print(a*b*c)
}
else{
    print("No numbers add up to the target")
}
