//
//  M3_T3_State_Binding_environmentUITestsLaunchTests.swift
//  M3-T3,State_Binding_environmentUITests
//
//  Created by ARYAN SINGHAL on 03/04/25.
//

import XCTest

final class M3_T3_State_Binding_environmentUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
