//
//  MainPageCoreDataStore.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 10/28/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import CoreData

class MainPageCoreDataStore : MainPageStoreProtocol {
    
    lazy var moc = {
        CoreDataStore.persistentContainer.viewContext
    }()
    
    func fetchTrainers(completionHandler: @escaping (() throws -> [TutorDAO]) -> Void) {
        moc.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedTutor")
                let tutors = try self.moc.fetch(fetchRequest) as! [TutorDAO]
                completionHandler { return tutors }
            } catch {
                completionHandler { throw CoreDataError.CannotFetch("Cannot fetch Tutors") }
            }
        }
    }
    
    func fetchTopics(completionHandler: @escaping (() throws -> [TopicDAO]) -> Void) {
        moc.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedTopic")
                let topics = try self.moc.fetch(fetchRequest) as! [TopicDAO]
                completionHandler { return topics }
            } catch {
                completionHandler { throw CoreDataError.CannotFetch("Cannot fetch Topics") }
            }
        }
    }
    
    func fetchHomeQuiz(completionHandler: @escaping (() throws -> [QuizDAO]) -> Void) {
        moc.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedQuiz")
                let quizs = try self.moc.fetch(fetchRequest) as! [QuizDAO]
                completionHandler { return quizs }
            } catch {
                completionHandler { throw CoreDataError.CannotFetch("Cannot fetch Quiz") }
            }
        }
    }
    
    func getHomeVideos(completionHandler: @escaping (() throws -> [VideoDAO]) -> Void) {
        moc.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedVideo")
                let videos = try self.moc.fetch(fetchRequest) as! [VideoDAO]
                completionHandler { return videos }
            } catch {
                completionHandler { throw CoreDataError.CannotFetch("Cannot fetch Quiz") }
            }
        }
    }
    
    
}
