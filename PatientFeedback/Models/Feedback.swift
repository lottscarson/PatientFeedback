//
//  Feedback.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import Foundation
import CoreGraphics

struct Feedback {
    var rating: Int = 1
    var doctorExplained: Bool = true
    var doctorThoughts: String = ""
    var diagnosisThoughts: String = ""
    var image: CGImage? = nil
}
