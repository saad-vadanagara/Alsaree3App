//
//  HomeScreenServices.swift
//  Alsaree3App
//
//  Created by Neosoft on 05/01/24.
//

import Foundation
class HomeScreenServices{
    
    //provide the basic details of application setup
    func getAppSettings(parameters:AppSettingParams, completion: @escaping (Result<AppSettingModel, APIError>) -> Void){
        let param:[String : Any] = ["device_token":parameters.device_token,"device_unique_id":parameters.device_unique_id,"device_type":parameters.device_type,"type":parameters.type]
        
        APIManager.sharedInstance.performRequest(serviceType: .AppSettings(parameters: param)) { response in
            switch response {
            case .success(let responseData):
                
                if let appSettingData = try? JSONDecoder().decode(AppSettingModel.self, from: responseData) {
                    completion(.success((appSettingData)))
                } else if let apiError = try? JSONDecoder().decode(ApiErrorModel.self, from: responseData) {
                    completion(.failure(.apiError(success: apiError.success, errorCode: apiError.error_code)))
                } else {
                    completion(.failure(.decodingError))
                }
                
            case .failure(_):
                completion(.failure(.decodingError))
            }
        }
    }
    
    // Check Weaher the FeedBack PopUp should appear or not
    func getFeedBackResponce(parameters:CheckFeedBackParams, completion: @escaping (Result<CheckFeedBackModel, APIError>) -> Void){
        let param:[String : Any] = ["user_id":parameters.user_id,"server_token":parameters.server_token]
        
        APIManager.sharedInstance.performRequest(serviceType: .CheckFeedBack(parameters: param)) { response in
            switch response{
            case .success(let responseData):
                
                if let checkFeedBackData = try? JSONDecoder().decode(CheckFeedBackModel.self, from: responseData){
                    completion(.success((checkFeedBackData)))
                } else if let apiError = try? JSONDecoder().decode(ApiErrorModel.self, from: responseData) {
                    completion(.failure(.apiError(success: apiError.success, errorCode: apiError.error_code)))
                } else {
                    completion(.failure(.decodingError))
                }
                
            case .failure(_):
                completion(.failure(.decodingError))
            }
        }
    }
    
    
    func 
    
}
