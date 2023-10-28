//
//  CardModel.swift
//  flipcard
//
//  Created by Quang Thanh on 22/08/2022.
//

import Foundation

class CardModel {
    func getCards () -> [Card] {
        //Khai báo một mảng trống
        var generatedCard = [Card] ()
       
        //Tạo ngẫu nhiên 8 cặp bài
        for _ in 1...8 {
            
            //chọn 1 số ngẫu nhiên
            let randomNumber = Int.random(in: 1...13)
            
            //Tạo 2 thẻ bài mới
            let cardOne = Card()
            let cardTwo = Card()
            
            //Đặt tên ảnh
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
            
            //Thêm vào mảng
            generatedCard += [cardOne, cardTwo]
            
            print(randomNumber)
        }
        //Random bài trong mảng
        generatedCard.shuffle()
        return generatedCard
    }
}
