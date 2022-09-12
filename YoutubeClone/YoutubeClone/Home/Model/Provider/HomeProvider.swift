//
//  Home.swift
//  YoutubeClone
//
//  Created by Learning on 12/09/22.
//

import Foundation

protocol HomeProviderProtocol{
    func getVideos(searchString : String, channelId : String) async throws -> VideoModel
}

class HomeProvider : HomeProviderProtocol{
    func getVideos(searchString : String, channelId : String) async throws -> VideoModel{
        var queryParams : [String:String] = ["part":"snippet"]
        if(!channelId.isEmpty){
            queryParams["channelId"] = channelId
        }
        if(!searchString.isEmpty){
            queryParams["q"] = searchString
        }
        let requestModel = RequestModel(endpoint: .search, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, VideoModel.self)
            return model
        }
        catch{
            print(error)
            throw error
        }
    }
}
