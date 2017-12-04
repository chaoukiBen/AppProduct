//
//  ProductCell.swift

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var descriptionProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayDataFrom(_ product: Product){
        
        titleProduct.text = (product.title ?? "") + ": $" + (product.value ?? "") + " (\(product.currency!))"
        descriptionProduct.text = Product.getDescription(from: product)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
