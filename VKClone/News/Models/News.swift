//
//  News.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 01.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation

struct News {
    var image: String
    var name: String
    var dateOfNews: String
    var textNews: String
    var photo: String
    
    static func getNews(from tuplesOfNews: [(image: String, name: String, dateOfNews: String, textNews: String, photo: String)]) -> [News] {
        var arrayOfNews = [News]()
        
        for news in tuplesOfNews {
            arrayOfNews.append(News(image: news.image, name: news.name, dateOfNews: news.dateOfNews, textNews: news.textNews, photo: news.photo))
        }
        
        return arrayOfNews
    }
}
