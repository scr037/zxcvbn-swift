import XCTest

import zxcvbn_swiftTests

var tests = [XCTestCaseEntry]()
tests += zxcvbn_swiftTests.allTests()
XCTMain(tests)
