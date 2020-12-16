// Enforcing Preconditions

precondition(5>1, "这不能出问题吧")

preconditionFailure("代码中已经检测出了问题")

// swiftc -Ounchecked 002.swift
// If you compile in unchecked mode (-Ounchecked), preconditions aren’t checked.