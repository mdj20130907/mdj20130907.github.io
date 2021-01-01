# https://www.shellcheck.net/

SOURCE_DIR="LANGUAGE GUIDE/005_Control Flow"
MAIN_SWIFT="$SOURCE_DIR/$1.swift"
cp "$MAIN_SWIFT" main.swift \
&& swiftc main.swift \
&& ./main

# && swiftc main.swift "$SOURCE_DIR/001.swift" "$SOURCE_DIR/002.swift" \
