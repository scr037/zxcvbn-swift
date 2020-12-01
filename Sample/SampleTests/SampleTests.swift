//
//  SampleTests.swift
//  SampleTests
//
//  Created by lchinigioli on 01/12/2020.
//  Copyright © 2020 kgsoft. All rights reserved.
//

import XCTest
@testable import Sample
@testable import zxcvbn_swift

/// Sample tests show how to use DBZxcvbn instead of the visual component
/// (DBPasswordStrengthMeterView)
class SampleTests: XCTestCase {
    var sut: DBZxcvbn!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DBZxcvbn()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testWeakPassword() throws {
        let testPassword = "qwerty12"
        let strength = sut.passwordStrength(testPassword)
        XCTAssertEqual(strength?.score, 0)
    }

    func testStrongPassword() throws {
        let testPassword = "Ju|\\|3.2020!"
        let strength = sut.passwordStrength(testPassword)
        XCTAssertEqual(strength?.score, 4)
    }
}
