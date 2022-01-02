//
//  NewsTableViewCell.swift
//  Vk
//
//  Created by Александр Чигрин on 17.12.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var avtorImage: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var avtorLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        //newsLabel.lineBreakMode = .byWordWrapping
        avtorLabel.text = ""
        dataLabel.text = ""
        newsLabel.text = ""
        imageView?.image = nil
    }
}
