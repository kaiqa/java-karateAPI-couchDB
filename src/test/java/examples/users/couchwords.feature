# http://localhost:5984/words/_design/view1/_view/new-view
# function (doc) {
# emit(doc._id, {refID:doc._rev, questionlanguage:doc.questionlanguage,answerlanguage:doc.answerlanguage,question:doc.question,answer:doc.answer});
#}

Feature: testing an API

  Background:
    * url 'http://localhost:5984/'

    Scenario: create a database
      Given path 'test/'
      Then  method get
      Then  match response contains { error:not_found,reason: Database does not exist.}


   Scenario: create verify and delete data
     # create
     Given path 'words/'
     And   request {questionlanguage: English, answerlanguage: Spanish, question: which bus goes to the beach, answer: qué autobús va a la playa}
     Then  method post
     And   status 201
     Then  def dataId = response.id
     And   def refId = response.rev
     # verify
     Given path 'words/' + dataId
     When  method get
     And   status 200
     Then  match response contains { question: which bus goes to the beach, answer: qué autobús va a la playa}
     # become admin
     Given path '_session'
     And   form field username = 'admin'
     And   form field password = 'asdfqwer1234#'
     When  method post
     And print response
     Then  status 200
     # delete
     Given path 'words/' + dataId
     And   param rev = refId
     And   method DELETE
     Then  status 200



