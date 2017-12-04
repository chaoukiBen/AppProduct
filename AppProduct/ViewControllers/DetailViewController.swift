//
//  DetailViewController.swift

import UIKit
import Moya
import ObjectMapper

class DetailViewController: UIViewController {

    var product: Product?
    
    @IBOutlet weak var labelItem: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    private func updateView() {
        labelItem.text = "Item: " + (product?.title ?? "")
        labelPrice.text = "Price: $" + (product?.value ?? "") + " (\(product?.currency ?? ""))"
        labelDescription.text = "Description: " + Product.getDescription(from: product!)
    }

}
