//
//  ViewController.swift
//  SmartServTest
//
//  Created by Kondya on 01/07/19.
//  Copyright © 2019 Fortune4. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productListTableView: UITableView!
    
    @IBOutlet weak var searchBarText: UISearchBar!
    
    var productListArray : [ProductModel] = []
    var productListArrayCopy : [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Confirm Protocol
        self.productListTableView.delegate = self
        self.productListTableView.dataSource = self
        self.searchBarText.delegate = self
        
        //Api Call
        self.activityStartAnimating()
        ApiCall().getProductList(url: productListUrl) { (productModel) in
            
            self.productListArray = []
            
            let array = productModel.products.map {$0.value}
            //Sort Array by popularity
            let sortArray = array.sorted(by: { Int($0.popularity) ?? 0 > Int($1.popularity) ?? 0 })
            self.productListArray = sortArray
            self.productListArrayCopy = sortArray
            DispatchQueue.main.async {
                self.productListTableView.reloadData()
            }
            self.activityStopAnimating()
            
        }
        
    }


}

//Product List TableView Delegate DataSource
extension ProductListViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productListArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.productListTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell {
            
            cell.setModel(model: self.productListArray[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
    
}

//UISearchBarDelegate
extension ProductListViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBarText.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if searchBarText.text?.trimmingCharacters(in: .whitespaces) != "" {
            let searchResult = self.productListArrayCopy.filter{$0.title.localizedCaseInsensitiveContains(self.searchBarText?.text ?? "")}
            self.productListArray = searchResult
            self.productListTableView.reloadData()
        }
        else{
            self.productListArray = productListArrayCopy
            self.productListTableView.reloadData()
            
        }
        return true
    }
    
    
}
