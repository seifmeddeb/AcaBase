//
//  TutorInteractor.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/27/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TutorBusinessLogic
{
    func getTutor(request: Tutor.Display.Request)
    func addToFavorites(request: Tutor.Favorite.Request)
    func removeFromFavorites(request: Tutor.Favorite.Request)
}

protocol TutorDataStore
{
    var tutorToDisplay: TutorDAO? { get set }
}

class TutorInteractor: TutorBusinessLogic, TutorDataStore
{
    var tutorToDisplay: TutorDAO?
    var presenter: TutorPresentationLogic?
    var worker: TutorWorker?
    
    // MARK: getTutor
    
    func getTutor(request: Tutor.Display.Request)
    {
        if let tutor = tutorToDisplay {
            let response = Tutor.Display.Response(tutor: tutor)
            presenter?.presentTutor(response: response)
        }
    }
    
    // MARK: addToFavorites
    
    func addToFavorites(request: Tutor.Favorite.Request)
    {
        self.worker = TutorWorker(tutorStore: TutorApi())
        let worker = self.worker!
        
        if let tutor = tutorToDisplay {
            worker.addToFavorites(id: tutor.objectId) { response in
                do {
                    let responseAddFav = try response()
                    let response = Tutor.Favorite.Response(message: responseAddFav, isFav: true)
                    self.presenter?.presentFavorite(response: response)
                } catch {
                    let message = "Un problème est survenu veuillez réessayer plus tard 😢"
                    let response = Tutor.Favorite.Response(message: message, isFav: false)
                    self.presenter?.presentFavorite(response: response)
                }
            }
        } else {
            let response = Tutor.Favorite.Response(message: "Un problème est survenu veuillez réessayer plus tard 😢", isFav: false)
            presenter?.presentFavorite(response: response)
        }
    }
    
    func removeFromFavorites(request: Tutor.Favorite.Request)
    {
        self.worker = TutorWorker(tutorStore: TutorApi())
        let worker = self.worker!
        
        if let tutor = tutorToDisplay {
            worker.removeFromFavorites(id: tutor.objectId) { response in
                do {
                    let responseAddFav = try response()
                    let response = Tutor.Favorite.Response(message: responseAddFav, isFav: false)
                    self.presenter?.presentFavorite(response: response)
                } catch {
                    let message = "Un problème est survenu veuillez réessayer plus tard 😢"
                    let response = Tutor.Favorite.Response(message: message, isFav: true)
                    self.presenter?.presentFavorite(response: response)
                }
            }
        } else {
            let response = Tutor.Favorite.Response(message: "Un problème est survenu veuillez réessayer plus tard 😢", isFav: true)
            presenter?.presentFavorite(response: response)
        }
    }
}
