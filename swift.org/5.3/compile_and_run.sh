# https://www.shellcheck.net/

SOURCE_DIR="WELCOME TO SWIFT/A Swift Tour/006_Enumerations and Structures"
MAIN_SWIFT="$SOURCE_DIR/$1.swift"
cp "$MAIN_SWIFT" main.swift \
&& swiftc main.swift \
&& ./main

# && swiftc main.swift "$SOURCE_DIR/001.swift" "$SOURCE_DIR/002.swift" \
