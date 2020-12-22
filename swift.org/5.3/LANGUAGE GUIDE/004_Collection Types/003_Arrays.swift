/// Array Type Shorthand Syntax

// written in full as Array<Element>
// in shorthand form as [Element]

/// Creating an Empty Array

var someInts = [Int]()
print(someInts.count)

someInts.append(3)
print(someInts)

// empty array literal, which is written as []
someInts = []
print(someInts)

/// Creating an Array with a Default Value

var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

/// Creating an Array by Adding Two Arrays Together

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// addition operator (+)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

/// Creating an Array with an Array Literal

var shoppingList = ["Eggs", "Milk", ]
// infer that [String] is the correct type

/// Accessing and Modifying an Array

// read-only count property
print("shoppingList.count", shoppingList.count)

// Boolean isEmpty property
if shoppingList.isEmpty {
    print("isEmpty")
}

// add a new item to the end of an array by calling the array’s append(_:) method
shoppingList.append("Flour") // 面粉

// addition assignment operator (+=)
shoppingList += ["Chocolate Spread", "Cheese", "Butter", ]

// subscript syntax
shoppingList[0] = "Six eggs"// change
print(shoppingList[0])// retrieve

// You can also use subscript syntax to change a range of values at once,
// even if the replacement set of values has a different length than the range you are replacing.
shoppingList[2...3] = ["Bananas", ]
print(shoppingList)

// To insert an item into the array at a specified index, call the array’s insert(_:at:) method
shoppingList.insert("Apples", at: 0)

// remove an item from the array with the remove(at:) method
print(shoppingList.remove(at: 0))// and returns the removed item
// Any gaps in an array are closed when an item is removed
print(shoppingList)

// remove the final item from an array, use the removeLast() method
print("shoppingList.removeLast", shoppingList.removeLast())// removeLast() returns the removed item

/// Iterating Over an Array
// iterate over the entire set of values in an array
for item in shoppingList {
    print(item)
}
// If you need the integer index of each item as well as its value, use the enumerated() method to iterate over the array instead.
for (index, item) in shoppingList.enumerated() {
    print(index, item)
}

