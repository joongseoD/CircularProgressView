//
//  ViewController.swift
//  CircularProgressView
//
//  Created by damor-js on 12/02/2021.
//  Copyright (c) 2021 damor-js. All rights reserved.
//

import UIKit
import CircularProgressView

final class ViewController: UIViewController {
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "play.circle.fill",
                                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 150, weight: .bold)),
                            for: .normal)
        }
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(startDownload), for: .touchUpInside)
        return button
    }()
    
    private let progressView: CircularProgressView = {
        let view = CircularProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.trackColor = .lightGray
        view.progressColor = .systemPink
        view.stopCornerRadius = 17
        view.isHidden = true
        return view
    }()
    
    private var downloading: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(startButton)
        view.addSubview(progressView)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 150),
            
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 150),
            progressView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    @objc private func startDownload() {
        startButton.isHidden = true
        progressView.isHidden = false
        
        downloadData()
    }
    
    private func stopDownload() {
        downloading = false
        startButton.isHidden = false
        progressView.isHidden = true
        progressView.set(progress: 0)
    }
    
    private func downloadData() {
        downloading = true
        
        progressView.onStop = { [weak self] in
            self?.stopDownload()
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            [0.1, 0.3, 0.7, 1.0].forEach { progress in
                guard self.downloading else { return }
                DispatchQueue.main.async {
                    self.progressView.set(progress: progress, duration: 0.5)
                }
                Thread.sleep(forTimeInterval: 1)
            }
        }
        
        //or, set animating duration
//        progressView.animate(duration: 3)
    }
}
