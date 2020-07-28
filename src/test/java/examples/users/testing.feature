Feature: testing an API
  Background:
     * url 'http://my-json-server.typicode.com/KaiMohr/fakejson/'

    # pretty print the response payload
    # * configure logPrettyResponse = true
    # time-out if the response is not received within 10 seconds (after the connection is established)
    * configure readTimeout = 10000


    Scenario: check id and title

      Given path 'posts/1'
      When method get
      Then status 200
      Then match response $ contains { id: '1' }
      Then match response $ contains { title: 'hello' }
      * print ' TEST PASSED: \n ID = ' + response.id + ' title = ' + response.title


   Scenario: create a new entry

      Given def user =
      """
      {
      "title": "Test User"
      }
      """

      And path 'posts/'
      Then request user
      When method post
      Then status 201
      And match response $ contains { id: '2' }
      And match response $ contains { title: 'Test User' }
      Then print ' TEST PASSED: \n ID = ' + response.id + ' title = ' + response.title

     Given path 'posts/2'
     When method get
     Then status 200

      * def cat =
  """
  {
    name: 'Billie',
    kittens: [
      { id: 23, name: 'Bob' },
      { id: 42, name: 'Wild' }
    ]
  }
  """
      * def kitnums = get cat.kittens[*].id
      * match kitnums == [23, 42]
      * def kitnames = get cat $.kittens[*].name
      * match kitnames == ['Bob', 'Wild']



  #  Given url 'http://my-json-server.typicode.com/KaiMohr/fakejson/'
  #  And request user
  #  When method post
  #  Then status 201
    * def myJson = { foo: 'bar', baz: [1, 2, 3] }

  #  * print karate.pretty(myJson)
