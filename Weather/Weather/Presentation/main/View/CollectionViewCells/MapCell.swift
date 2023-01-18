//
//  MapCell.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/18.
//

import Foundation
import MapKit
import SnapKit

final class MapCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.isRotateEnabled = true
        mapView.isPitchEnabled = true
        return mapView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Init with coder is unavailable")
    }
    
    private func setUpView() {
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        
        let coordi = CLLocationCoordinate2D(latitude: 36.783611, longitude: 127.004173)
        
        setUpCamera(coordi)
        setUpAnnotation(coordi)
    }
    
    private func layout() {
        setUpView()
        
        contentView.addSubview(mapView)
        
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setUpAnnotation(_ coordinator: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinator
        mapView.addAnnotation(annotation)
    }
    
    private func setUpCamera(_ coordinator: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: coordinator,
                                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
}
