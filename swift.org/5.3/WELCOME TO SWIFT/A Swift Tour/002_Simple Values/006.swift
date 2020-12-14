var shoppingList = ["eggs", "apples", "fish", ]
shoppingList[0] = "fresh eggs"
print(shoppingList)

var simple = [
    "鲁": "山东",
    "京": "北京",
    "沪": "上海",
]
simple["粤"] = "广东"
print(simple)
// Create arrays and dictionaries using brackets ([]), and access their elements by writing the index or key in brackets.
// A comma is allowed after the last element.

shoppingList.append("tomato")
print(shoppingList)
// Arrays automatically grow as you add elements

let emptyArray = [String]()
let emptyDictionary = [String: Float]()
// To create an empty array or dictionary, use the initializer syntax.

shoppingList = []
simple = [:]
// If type information can be inferred, you can write an empty array as [] and an empty dictionary as [:]