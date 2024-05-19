//
//  ConnectivityManager.swift
//  Meli
//
//  Created by Ricardo Santana on 17/05/24.
//

//import Foundation
////import Reachability
//
//class ConnectivityManager {
//    static let shared = ConnectivityManager()
//    private let reachability = try! Reachability()
//
//    private init() {
//        startMonitoring()
//    }
//
//    private func startMonitoring() {
//        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged), name: .reachabilityChanged, object: reachability)
//        do {
//            try reachability.startNotifier()
//        } catch {
//            print("Could not start reachability notifier")
//        }
//    }
//
//    @objc private func reachabilityChanged(notification: Notification) {
//        // Post custom notification or handle change internally
//    }
//
//    var isConnectedToInternet: Bool {
//        return reachability.connection != .unavailable
//    }
//
//    deinit {
//        reachability.stopNotifier()
//        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
//    }
//}
//
