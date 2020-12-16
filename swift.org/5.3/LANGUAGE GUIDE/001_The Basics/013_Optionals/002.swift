// If Statements and Forced Unwrapping

let convertedNumber = Int("123")

if nil != convertedNumber {
    // I know that this optional definitely has a value;
    // please use it.
    print(convertedNumber!)
}