//
//  RunloopExtension.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/17/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation

extension RunLoop {
    static var backgroundWorkScheduler: OperationQueue {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 5
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }
}
