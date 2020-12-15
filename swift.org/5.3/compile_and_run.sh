# https://www.shellcheck.net/

SOURCE_DIR="WELCOME TO SWIFT/A Swift Tour/009_Generics"
MAIN_SWIFT="$SOURCE_DIR/$1.swift"
cp "$MAIN_SWIFT" main.swift \
&& swiftc \
main.swift \
&& ./main

# cp "WELCOME TO SWIFT/A Swift Tour/005_Objects and Classes/$1.swift" main.swift \
# && swiftc "WELCOME TO SWIFT/A Swift Tour/005_Objects and Classes/002_init_self_deinit.swift" main.swift \
# && ./main

# cp "WELCOME TO SWIFT/A Swift Tour/005_Objects and Classes/$1.swift" main.swift \
# && swiftc "WELCOME TO SWIFT/A Swift Tour/005_Objects and Classes/002_init_self_deinit.swift" \
# "WELCOME TO SWIFT/A Swift Tour/005_Objects and Classes/003_sub_super_override.swift" \
# "WELCOME TO SWIFT/A Swift Tour/005_Objects and Classes/004_get_set.swift" \
# "main.swift" \
# && ./main