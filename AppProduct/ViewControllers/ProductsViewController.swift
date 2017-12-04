//
//  ProductsViewController.swift


import UIKit

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let cellId = "ProductCell"
    var productViewModel = ProductsModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        productViewModel.tableView = tableView
        productViewModel.fetchingData()
    }
}

extension ProductsViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  productViewModel.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
        
        guard let _product = productViewModel.products?[indexPath.row] else {
            return cell
        }
        
        cell.displayDataFrom(_product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
           viewController.product = productViewModel.products?[indexPath.row]
            self.navigationController!.pushViewController(viewController, animated: true)
        }
    }
}
