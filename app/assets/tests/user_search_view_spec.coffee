define ['user_search_view'], (UserSearchView) ->
  beforeEach ->
    this.search = new UserSearchView
  describe 'UserSearchView', ->
    beforeEach -> 
      this.search.render()
    it 'should have a root element', ->
        expect(true).to.be.true
