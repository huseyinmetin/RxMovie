//
//  DetailViewController.swift
//  RxMovie
//
//  Created by Hüseyin Metin on 23.01.2020.
//  Copyright © 2020 HüseyinMetin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    private var viewModel: DetailViewModel!
    
    public var item: PopularItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        prepareUI()
    }
    
    func setup() {
        viewModel = DetailViewModel(item: item)
    }

    func prepareUI() {
        posterImageView.download(imageName: viewModel.posterUrl)
        nameLabel.text = viewModel.name
        originalNameLabel.text = viewModel.detail
        overviewTextView.text = viewModel.description
    }
}
