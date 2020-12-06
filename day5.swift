let lines = try String(contentsOfFile: "day5").split(separator: "\n")
var ids = [Int]()
for boarding in lines{
    var left = 0, right = 127
    for letter in boarding.prefix(7){
        let mid = (left+right)/2
        if letter == "F"{
            right = mid
        }
        else{
            left = mid+1
        }
    }
    let row = left
    left = 0
    right = 7
    for letter in boarding.suffix(3){
        let mid = (left+right)/2
        if letter == "L"{
            right = mid
        }
        else{
            left = mid + 1
        }
        
    }
    let col = left
    ids.append(row * 8 + col)
}
ids.sort()
print(ids)
for i in 0..<ids.count{
    if i+1 < ids.count && ids[i+1] != (ids[i]+1){
        print(ids[i]+1)
    }
}

