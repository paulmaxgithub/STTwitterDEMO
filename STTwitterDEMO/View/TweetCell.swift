//
//  TweetCell.swift
//  STTwitterDEMO
//
//  Created by PaulmaX on 20.12.22.
//

import UIKit

final class TweetCell: UITableViewCell {
    
    let nameLabel = UILabel(text: "Username",
                            font: .boldSystemFont(ofSize: 16),
                            textColor: .black,
                            textAlignment: .left,
                            numberOfLines: 0)
    
    let tweetTextLabel = UILabel(text: "Tweet Text Multilines",
                                 font: .systemFont(ofSize: 16),
                                 textColor: .darkGray,
                                 textAlignment: .left,
                                 numberOfLines: 0)
    
    let profileImage = UIImageView(image: nil, contentMode: .scaleAspectFill)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        profileImage.layer.cornerRadius = 8
        profileImage.layer.borderWidth = 0.5
        
        //LBTATools
        hstack(profileImage.withSize(.init(width: 50, height: 50)),
               stack(nameLabel, tweetTextLabel, spacing: 8),
                spacing: 20, alignment: .top).withMargins(.allSides(24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
