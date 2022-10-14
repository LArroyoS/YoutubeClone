//
//  PlaylistCell.swift
//  YoutubeClone
//
//  Created by Learning on 23/09/22.
//

import UIKit
import Kingfisher

class PlaylistCell: UITableViewCell {
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoCount: UILabel!
    @IBOutlet weak var videoCountOverlay: UILabel!
    @IBOutlet weak var dotsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView(){
        selectionStyle = .none
        dotsImage.image = UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate)
        dotsImage.tintColor = UIColor(named: "whiteColor")
    }
    
    func configCell(model : PlaylistModel.Item){
        videoTitle.text = model.snippet.title
        videoCount.text = String(model.contentDetails?.itemCount ?? 0) + " videos"
        videoCountOverlay.text = String(model.contentDetails?.itemCount ?? 0)
        let imageUrl = model.snippet.thumbnails.medium.url
        if let url = URL(string: imageUrl){
            videoImage.kf.setImage(with: url)
        }
    }
    
}
