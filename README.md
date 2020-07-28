# karateAPI
KARATE API VS. COUCHDB
docker run -p 5984:5984 -d couchdb

curl -X PUT 127.0.0.1:5984/somedatabase -u admin:mypassword

{

  “_id”: “9e987ea1a9b826fd16467bc59801d83d”,

  “_rev”: “1-a1a3ba8da99d40870fe0b18277c873ac”,

  “first-language”: “Englisch”,

  “second-language”: “Spanisch”,

  “question”: “which bus goes to the beach”,

  “answer”: “qué autobús va a la playa”

}

function (doc) {

  emit(doc._id, {refID:doc._rev, questionlanguage:doc.questionlanguage,answerlanguage:doc.answerlanguage,question:doc.question,answer:doc.answer});

}

http://localhost:5984/words/_design/view1/_view/new-view
