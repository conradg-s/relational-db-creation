// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-pdc-mongo.mongodb.js

// Student ID: 35484306
// Student Name: Conrad Guo

// ===================================================================================
// Do not modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Comments for your marker (add text below if needed):
//
//
//

// Use (connect to) your database - you MUST insert your authcate username
// between the "" below
use("cguo0022");

// 3(b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.appointments.drop();


// Create collection and insert documents
db.appointments.insertMany([
    { "_id": 1, "datetime": "01/09/2024 13:00", "provider_code": "END001", "provider_name": "Dr. Mark Stanton", "item_totalcost": 40, "no_of_items": 8, "items": [{ "id": 1, "desc": "Paper tips", "standardcost": 1, "quantity": 2 }, { "id": 3, "desc": "EDTA Cleansing Gel 17%", "standardcost": 8, "quantity": 1 }, { "id": 2, "desc": "Sodium hypochlorite 5.25%", "standardcost": 6, "quantity": 5 }] },
    { "_id": 2, "datetime": "01/09/2024 13:00", "provider_code": "GEN001", "provider_name": "Dr. Bruce Striplin", "item_totalcost": 108, "no_of_items": 14, "items": [{ "id": 1, "desc": "Paper tips", "standardcost": 1, "quantity": 10 }, { "id": 19, "desc": "Herculite XRV: For Dental Fillings", "standardcost": 42, "quantity": 2 }, { "id": 3, "desc": "EDTA Cleansing Gel 17%", "standardcost": 8, "quantity": 1 }, { "id": 2, "desc": "Sodium hypochlorite 5.25%", "standardcost": 6, "quantity": 1 }] },
    { "_id": 3, "datetime": "02/09/2024 13:00", "provider_code": "GEN002", "provider_name": "Dr. Amalia Morris", "item_totalcost": 6, "no_of_items": 3, "items": [{ "id": 10, "desc": "Molar mouth tube", "standardcost": 2, "quantity": 1 }, { "id": 11, "desc": "Archwire", "standardcost": 2, "quantity": 2 }] },
    { "_id": 4, "datetime": "03/09/2024 13:00", "provider_code": "GEN003", "provider_name": "Dr.  Corner", "item_totalcost": 46, "no_of_items": 1, "items": [{ "id": 17, "desc": "Universal restorative composite", "standardcost": 46, "quantity": 1 }] },
    { "_id": 5, "datetime": "04/09/2024 13:00", "provider_code": "ORS001", "provider_name": "Dr. Jessica Jones", "item_totalcost": 20, "no_of_items": 4, "items": [{ "id": 21, "desc": "Clinasept Film", "standardcost": 5, "quantity": 4 }] },
    { "_id": 6, "datetime": "04/09/2024 13:00", "provider_code": "PED001", "provider_name": "Dr. Kevin Barr", "item_totalcost": 47, "no_of_items": 6, "items": [{ "id": 12, "desc": "Curved lingual button", "standardcost": 1, "quantity": 5 }, { "id": 19, "desc": "Herculite XRV: For Dental Fillings", "standardcost": 42, "quantity": 1 }] },
    { "_id": 7, "datetime": "01/09/2024 18:00", "provider_code": "END001", "provider_name": "Dr. Mark Stanton", "item_totalcost": 184, "no_of_items": 13, "items": [{ "id": 8, "desc": "Irrigation Needle and Syringe", "standardcost": 2, "quantity": 2 }, { "id": 23, "desc": "Silane", "standardcost": 25, "quantity": 1 }, { "id": 22, "desc": "Porcelain Etch", "standardcost": 35, "quantity": 1 }, { "id": 21, "desc": "Clinasept Film", "standardcost": 5, "quantity": 4 }, { "id": 17, "desc": "Universal restorative composite", "standardcost": 46, "quantity": 1 }, { "id": 16, "desc": "Universal composite", "standardcost": 48, "quantity": 1 }, { "id": 14, "desc": "Silk surture", "standardcost": 2, "quantity": 3 }] }

]);



// Show all the documents you inserted
db.appointments.find();


// 3(c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

db.appointments.find({
    "$or": [
        { "no_of_items": { "$gt": 2 } },
        { "item_totalcost": { "$gt": 50 } }
    ]
});




// 3(d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
db.appointments.find({ "items.id": 1, "items.desc": "Paper tips" }, { "items.$": 1 });

db.appointments.updateMany(
    { "items.id": 1, "items.desc": "Paper tips" },
    { "$set": { "items.$[elem].desc": "Paper points" } },
    { arrayFilters: [ { "elem.id": 1 } ] }
  );

db.appointments.find({ "items.id": 1, "items.desc": "Paper points" }, { "items.$": 1 });



// 3(e)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

db.appointments.find({ "_id":4});

db.appointments.updateOne(
    { "_id": 4 },
    { 
        "$push": { 
            "items": { 
                "$each": [
                    { "id": 3, "desc": "EDTA Cleansing Gel 17%", "standardcost": 8, "quantity": 1 },
                    { "id": 4, "desc": "Irrigation Solution 2% Chlorhexidine", "standardcost": 9, "quantity": 1 },
                    { "id": 8, "desc": "Irrigation Needle and Syringe", "standardcost": 2, "quantity": 2 }
                ]
            }
        }
    });

db.appointments.find({ "_id":4});
