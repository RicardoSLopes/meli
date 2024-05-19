//
//  Logger.swift
//  Meli
//
//  Created by Ricardo Santana on 19/05/24.
//

import os.log

class Logger {
    static let shared = Logger()

    private init() {}
    
    func log(_ message: String, level: LogLevel = .debug) {
        switch level {
        case .debug:
            os_log("%{public}@", log: OSLog.default, type: .debug, message)
        case .info:
            os_log("%{public}@", log: OSLog.default, type: .info, message)
        case .error:
            os_log("%{public}@", log: OSLog.default, type: .error, message)
        }
    }
}

enum LogLevel {
    case debug, info, error
}
