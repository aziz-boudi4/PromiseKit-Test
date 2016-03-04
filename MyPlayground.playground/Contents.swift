//: Playground - noun: a place where people can play

import UIKit
import PromiseKit
import CoreLocation
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

class Station {

  var name: String
  var location: CLLocationCoordinate2D

  init(name: String, location: CLLocationCoordinate2D) {
    self.name = name
    self.location = location
  }
}

class Downloader {

    func downloadData() -> Promise<[Station]> {

      let deferred = Promise<[Station]>.pendingPromise()

      let stations = Promise<[String]>.pendingPromise()
      let locations = Promise<[CLLocationCoordinate2D]>.pendingPromise()

      // api call schedules
      var s = [String]()

      // map data
      (1...30).forEach { s.append("station\($0)") }

      // fullfill or reject
      stations.fulfill(s)

      // api call locations
      var l = [CLLocationCoordinate2D]()
      (1...30).forEach { l.append(CLLocationCoordinate2D(latitude: CLLocationDegrees($0), longitude: CLLocationDegrees($0)))}

      // in case of error , change it later with a fullfill similar to satations.fulfill(s)
      //locations.reject(NSError(domain: "", code: 1, userInfo: ["reason" : "some reason"]))
      locations.fulfill(l)

      when(stations.promise, locations.promise).then { stationsData, locationsData  -> Void in
        let count = stationsData.count
        var stationArray = [Station]()
        (0..<count).forEach{  stationArray.append(Station(name: stationsData[$0], location: locationsData[$0])) }
        deferred.fulfill(stationArray)
      }
        return deferred.promise
    }
  }

let dl = Downloader()

  dl.downloadData().then { stations -> Void in
    stations.forEach { print($0.name, $0.location) }
    }.recover { error -> Void in
      print("the error is: \(error)")
  }










