//
//  ContentView.swift
//  Project 6!
//
//  Created by Loaner on 4/29/23.
//
import MapKit
import SwiftUI
struct ContentView: View {
    
@StateObject private var viewModel = ContentViewModel()
       


    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear{
                viewModel.checkIfLocationServicesIsEnabled()
            }
}
}
                                                   struct ContentView_Previews: PreviewProvider { static var previews: some View {
        ContentView()
                                                       
            
    }
                                                       
                                                       
                                                   }

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.4993, longitude: 81.6944), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            
            
            
    } else {
        print("Show an alert letting them know this is off and go turn it on")
    }
    
}
   private func checkLocationAuthorization(){
        guard let locationManager = locationManager else { return }
            switch locationManager.authorizationStatus {
            
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is retricted likely due to parental controls")
            case .denied:
                print("You have denied this app location permissions please go to settings to fix this")
            case .authorizedAlways, .authorizedWhenInUse:
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            @unknown default:
                break
            }
    }
    func locationManagerDidChangeAuthorization( _ Manager: CLLocationManager){
            checkLocationAuthorization()
        }
}










