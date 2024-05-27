//
//  DefaultDataConcentTransparencyHandler.swift
//  Meli
//
//  Created by Ricardo Santana on 25/05/24.
//

import AppTrackingTransparency

enum UserPermissionStatus {
    case denied, authorized, notDetermined
}

protocol TrackingPermissionManager {
    func requestPermission(completion: @escaping (UserPermissionStatus) -> Void)
}

public final class DefaultDataConcentTransparencyHandler: TrackingPermissionManager {
    
    func requestPermission(completion: @escaping (UserPermissionStatus) -> Void) {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                completion(.authorized)
            case .restricted, .denied:
                completion(.denied)
            default:
                completion(.notDetermined)
            }
        }
    }
}
