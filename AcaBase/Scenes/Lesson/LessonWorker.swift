//
//  LessonWorker.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/21/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import AVKit

class LessonWorker
{
    var chapterStore : ChapterDetailsStoreProtocol
    
    init(chapterStore: ChapterDetailsStoreProtocol)
    {
        self.chapterStore = chapterStore
    }
    
    func getQuizs(for chapter:ChapterDAO) -> [QuizDAO]
    {
        return chapter.quizs ?? [QuizDAO]()
    }
    
    func getVideos(for chapter: ChapterDAO) -> [VideoResponseAlias]
    {
        var videosResponse = [VideoResponseAlias]()
        if let videos = chapter.videos {
            for video in videos {
                var videoResponse = VideoResponseAlias()
                videoResponse.title = video.title
                videoResponse.provider = video.provider
                videoResponse.time = "1 hour ago"
                videoResponse.views = "78678"
                videoResponse.url = video.videoUrl
                
                videosResponse.append(videoResponse)
            }
        }
        return videosResponse
    }
    
    func getChapterDetails(chapter: ChapterDAO, completionHandler: @escaping (ChapterDAO?) -> Void) {
        self.chapterStore.getChapterDetails(chapterId: chapter.objectId) { (response: () throws -> ChapterDAO) in
            do {
                let response = try response()
                DispatchQueue.main.async {
                    completionHandler(response)
                }
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
}

protocol ChapterDetailsStoreProtocol {
    func getChapterDetails(chapterId:Int, completionHandler: @escaping (() throws -> ChapterDAO) -> Void)
}
