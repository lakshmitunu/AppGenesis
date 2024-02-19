import Cocoa


//In the assignment for Week 3, part D asked you to write a function that would compute the average of an array of Int.
//Using that function and the array created in part A, create two overloaded functions of the function average.

func average(_ numbers: [Int]?) {
  guard let numbers = numbers else {
    print("The array is nil. Calculating the average is impossible")
    return
  }
  
  guard !numbers.isEmpty else {
    print("Array is Empty")
    return
  }
  
  let sum = numbers.reduce(0, {$0 + $1})
  let average = Double (sum) / Double(numbers.count)
  
  print("The average of the values in the array is \(average).")
  
}

//Overload function 1:
func average(_ numbers: Int...) {
  average(numbers)
}

//Overload function 2:
func average(_ numbers: [Double]?) {
  guard let numbers = numbers else {
    print("The array is nil. Calculating the average is impossible")
    return
  }
  
  guard !numbers.isEmpty else {
    print("Array is Empty")
    return
  }
  
  let sum = numbers.reduce(0, {$0 + $1})
  let average = sum / Double(numbers.count)
  
  print("The average of the values in the array is \(average).")
  
}


print("--------Part 2a--------------")
//Calling method
average([1,2,3,4,5])
average([] as [Int])
average(nil as [Int]?)

// Calling Overload function
average(2, 4, 6)
average([2.0, 4.5, 6.5])


//Create an enum called Animal that has at least five animals. Next, make a function called theSoundMadeBy that has a parameter of type Animal. This function
//should output the sound that the animal makes. For example, if the Animal passed is a cow, the function should output, “A cow goes moooo.”
//Hint: Do not use if statements to complete this section.
//Call the function twice, sending a different Animal each time.

enum Animal {
  case cat
  case dog
  case cow
  case bird
  case elephant
  
  
  func soundMadeBy() -> String {
    switch self {
    case .cat:
      return "A cat goes meow"
    case .dog:
      return "A dog goes woof"
    case .cow:
      return "A cow goes moooo"
    case .bird:
      return "A bird goes chirp"
    case .elephant:
      return "A elephant goes trumpet"
    }
  }
  
}

func thesoundMadeBy(animal: Animal) {
  print(animal.soundMadeBy())
}

print("--------Part 2b--------------")
thesoundMadeBy(animal: Animal.cow)
thesoundMadeBy(animal: Animal.elephant)

//This question will have you creating multiple functions that will require you to use closures and collections. First, you will do some setup.

//Create an array of Int called nums with the values of 0 to 100.
//Create an array of Int? called numsWithNil with the following values:
//79, nil, 80, nil, 90, nil, 100, 72

//Create an array of Int called numsBy2 with values starting at 2 through 100, by 2.
//Create an array of Int called numsBy4 with values starting at 2 through 100, by 4.

//You can set the values of the arrays above using whatever method you find the easiest. In previous weeks you were introduced to ranges and sequences in Swift. Leveraging those in the Array initializer will allow you to create the requested arrays in a single line. Don’t let the last two break your stride.

print("--------Part 2c--------------")

let nums = Array(0...100)
let numsWithNil: [Int?] = [79, nil, 80, nil, 90, nil, 100, 72]
let numsBy2 = Array(stride(from: 2, to: 100, by:2))
let numsBy4 = Array(stride(from: 2, to: 100, by:4))
print(nums)
print(numsBy2)
print(numsBy4)

//Create a function called evenNumbersArray that takes a parameter of [Int] (array of Int) and returns [Int].
//The array of Int returned should contain all the even numbers in the array passed. Call the function passing the nums array and print the output.

func evenNumbersArray(numbers: [Int])-> [Int] {
  return numbers.filter {$0 % 2 == 0}
}
let evenNums = evenNumbersArray(numbers: nums)
print(evenNums)

//Create a function called sumOfArray that takes a parameter of [Int?] and returns an Int.
//The function should return the sum of the array values passed that are not nil. Call the function passing the numsWithNil array, and print out the results.

func sumOfArray(numbers: [Int?]) -> Int {
  return numbers.compactMap { $0 }.reduce(0, {$0+$1})
}

let sum = sumOfArray(numbers: numsWithNil)
print(sum)

//Create a function called commonElementsSet that takes two parameters of [Int] and returns a Set<Int> (set of Int).
//The function will return a Set<Int> of the values in both arrays.

func commonElementsSet(array1: [Int], array2:[Int]) -> Set<Int> {
  let set1 = Set(array1)
  let set2 = Set(array2)
  
  return set1.intersection(set2)
  
}
let commonElements = commonElementsSet(array1: numsBy2, array2: numsBy4)
print("Common elements in the arrays: \(commonElements)")

//Create a struct called Square that has a stored property called sideLength and a computed property called area. Create an instance of Square and print the area.

struct Square {
  var sideLength: Double
  
  var area : Double {
      return sideLength * sideLength
  }
}

let square = Square(sideLength: 5.0)
print("Area of the square: \(square.area)")


//Create a protocol called Shape with a calculateArea() -> Double method. Create two structs called Circle and Rectangle that conform to the protocol Shape. Both Circle and Rectangle should have appropriate stored properties for calculating the area.

protocol Shape {
  
  func calculateArea() -> Double
}

struct Circle: Shape {
  
  var radius: Double
  
  func calculateArea() -> Double {
    return Double.pi * radius * radius
  }
  
}

struct Rectangle : Shape {
  var width: Double
  var height: Double
  
  func calculateArea() -> Double {
    return width * height
  }
}

let circle = Circle(radius: 5.0)
let rectangle = Rectangle(width: 4.0, height: 6.0)

print("Area of the circle: \(circle.calculateArea())")
print("Area of the rectangle: \(rectangle.calculateArea())")

extension Shape {
  func calculateVolume() -> Double {
    return 0
  }
}

struct Sphere: Shape {
  
  var radius: Double
  
  func calculateArea() -> Double {
          return 4 * Double.pi * radius * radius
      }
  
  func calculateVolume() -> Double {
          return (4/3) * Double.pi * pow(radius, 3)
      }
}

let sphere = Sphere(radius: 3.0)

// Print the area and volume of the sphere
print("Area of the sphere: \(sphere.calculateArea())")
print("Volume of the sphere: \(sphere.calculateVolume())")



