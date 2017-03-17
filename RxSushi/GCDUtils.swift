//
//  GCDUtils.swift
//  RxSwift
//
//  Created by Justin Wright on 2/4/17.
//  Copyright © 2017 Justin Wright. All rights reserved.
//

import Foundation

var globalMainQueue: DispatchQueue {
    return DispatchQueue.main
}

/*
 * GlobalUserInteractiveQueue
 *
 * A QOS class which indicates work performed by this thread
 * is interactive with the user.
 */
var globalUserInteractiveQueue: DispatchQueue {
    return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)
}

/*
 * GlobalUserInitiatedQueue
 *
 * A QOS class which indicates work performed by this thread
 * was initiated by the user and that the user is likely waiting for the
 * results.
 */
var globalUserInitiatedQueue: DispatchQueue {
    return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated)
}

/*
 * GlobalUtilityQueue
 *
 * A QOS class which indicates work performed by this thread
 * may or may not be initiated by the user and that the user is unlikely to be
 * immediately waiting for the results.
 */
var globalUtilityQueue: DispatchQueue {
    return DispatchQueue.global(qos: DispatchQoS.QoSClass.utility)
}

/*
 * GlobalBackgroundQueue
 *
 * A QOS class which indicates work performed by this thread was not
 * initiated by the user and that the user may be unaware of the results.
 */
var globalBackgroundQueue: DispatchQueue {
    return DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
}

func createSerialQueue(_ name: String)-> DispatchQueue {
    return DispatchQueue(label: name, attributes: [])
}

func createConCurrentQueue(_ name: String)-> DispatchQueue {
    return DispatchQueue(label: name, attributes: DispatchQueue.Attributes.concurrent)
}

func delay(_ delay: Double, closure: @escaping ()->()){
    globalMainQueue.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
