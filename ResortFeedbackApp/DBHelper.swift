//
//  DBHelper.swift
//  ResortFeedbackApp
//
//  Created by admin on 4/28/21.
//

import Foundation
import CoreData
import UIKit


class DBHelper {
    static var inst = DBHelper()
    
    enum RelationshipError : Error {
        case rtError(String)
    }
    
    var context : NSManagedObjectContext?
    
    init() {
        context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
    }
    
    func addGuest(guestDataObject: [String:String]) {
        
        let guest = NSEntityDescription.insertNewObject(forEntityName: "Guest", into: context!) as! Guest
        
        guest.username = guestDataObject["username"]
        guest.password = guestDataObject["password"]
        
        do {
            try context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        
        
    }
    
    func updateGuest(guestDataObject: [String:String]) {
        print(guestDataObject)
        var isSuccessful = false
        var guest = Guest()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Guest")
        fetchReq.predicate = NSPredicate(format: "username == %@", guestDataObject["username"]!)
        
        do {
            let res = try context?.fetch(fetchReq)
            if (res?.count != 0) {
                guest = res?.first as! Guest
                guest.password = guestDataObject["password"]
                try context?.save()
            }
        } catch {
            print("error with fetching data or saving context")
        }
    }
    
    func getAllGuests() -> [Guest] {
        var guests = [Guest]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Guest")
        
        do {
            guests = try context?.fetch(fetchReq) as! [Guest]
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
        return guests
    }
    
    func getAllResponses() -> [SurveyResponse] {
        var responses = [SurveyResponse]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "SurveyResponse")
        
        do {
            responses = try context?.fetch(fetchReq) as! [SurveyResponse]
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
        return responses
    }
    
    func deleteAllGuests() {
        let fetchReq = Guest.fetchRequest() as NSFetchRequest<Guest>
        do {
            let result = try context?.fetch(fetchReq)
            for data in result! {
                context?.delete(data)
            }
            try context?.save()
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    func getGuest(name: String) -> Guest {
        var guest = Guest()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Guest")
        fetchReq.predicate = NSPredicate(format: "username == %@", name)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Guest]
            if (res.count != 0){
                guest = res.first!
            } else {
                print("data not found")
            }
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
        return guest
    }
    
    func addFormData(name: String, formName: String, data: Double) {
        var guest = Guest(entity: Guest.entity(), insertInto: context)
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Guest")
        fetchReq.predicate = NSPredicate(format: "username == %@", name)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Guest]
            if (res.count != 0){
                var attributeFound = false
                guest = res.first!
                let response = guest.response ?? SurveyResponse(entity: SurveyResponse.entity(), insertInto: context)
                response.guest = guest
                for attribute in response.entity.attributesByName {
                    if (attribute.key  == formName) {
                        response.setValue(data, forKey: attribute.key)
                        attributeFound = true
                    }
                }
                if (!attributeFound) {
                    print("that attribute was not found in this entity's collection of attributes")
                }
                
            } else {
                print("data not found")
            }
        }catch (let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    
}
