define ['user_search_model'], (UserSearchModel) ->

  describe 'UserSearchModel', ->
    beforeEach ->
      this.model = new UserSearchModel

    it 'should respond to validate', ->
      this.model.should.respondTo('validate')

    it 'should not validate', ->
      this.model.isValid().should.be.false

    describe 'with non matching passwords', ->
      beforeEach ->
        this.model.set
          new_password: 'asdf',
          confirm_password: 'asdf1'

      it 'should not validate', ->
        this.model.isValid().should.be.false
        this.model.validationError.should.not.be.null
        this.model.validationError.should.include.keys('new_password', 'confirm_password')

    describe 'with empty current password', ->
      beforeEach ->
        this.model.set
          username: 'user'
          new_password: 'asdf'
          confirm_password: 'asdf'

      it 'should not validate', ->
        this.model.isValid().should.be.false
        this.model.validationError.should.not.be.null
        this.model.validationError.should.include.keys('current_password')
