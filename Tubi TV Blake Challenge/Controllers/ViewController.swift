//
//  ViewController.swift
//  Tubi TV Blake Challenge
//
//  Created by Blake Barrett on 2/16/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let api = TenorAPI()
    
    var values = [TenorResource]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.search(for: "wink")
        
        collectionView.register(GifCollectionViewCell.self, forCellWithReuseIdentifier: GifCollectionViewCell.identifier)
        searchBar.delegate = self
    }
    
    func search(for value: String) {
        api.search(for: value,
                   success: {[weak self] (values: [TenorResource]?) in
                    if let values = values {
                        self?.values.removeAll()
                        self?.values.append(contentsOf: values)
                        self?.collectionView.reloadData()
                    }
            },
                   failure: { (error) in
                    print(String(describing: error))
        })
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(for: searchText)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // gifCollectionViewCellReuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GifCollectionViewCell.identifier,
                                                      for: indexPath) as! GifCollectionViewCell
        let value = values[indexPath.row]
        cell.set(value)
        return cell
    }
}
