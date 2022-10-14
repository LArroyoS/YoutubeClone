//
//  ChannelCellTableViewCell.swift
//  YoutubeClone
//
//  Created by Learning on 23/09/22.
//

import UIKit
import Kingfisher

class ChannelCell: UITableViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var subscribeLabel: UILabel!
    @IBOutlet weak var susbcriberNumbersLabel: UILabel!
    @IBOutlet weak var channelInfoLabel: UILabel!
    @IBOutlet weak var bellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView(){
        selectionStyle = .none
        bellImage.image = UIImage(named: "bell")?.withRenderingMode(.alwaysTemplate)
        bellImage.tintColor = UIColor(named: "grayColor")
        profileImage.layer.cornerRadius = 51/2
    }

    func configCell(model : ChannelModel.Items){
        channelInfoLabel.text = model.snippet.description
        susbcriberNumbersLabel.text = "\(model.statistics?.subscriberCount ?? "0") subscribers - \(model.statistics?.videoCount ?? "0") videos"
        if let bannerUrl = model.brandingSettings?.image.bannerExternalUrl, let url = URL(string: bannerUrl){
            bannerImage.kf.setImage(with: url)
        }
        
        let imageUrl = model.snippet.thumbnails.medium.url
        guard let url = URL(string: imageUrl) else {
            return
        }
        profileImage.kf.setImage(with: url)
    }
    
}
