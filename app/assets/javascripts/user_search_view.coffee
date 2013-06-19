define ['marionette', 'text!tpl/user_search_view.html', 'user_search_model'], (M, Template, UserSearchModel) ->
  Backbone.Marionette.ItemView.extend
    template: _.template(Template)
    model: new UserSearchModel 
    bindings:
      "input[name=username]": "username"
      "input[name=current_password]": "current_password"
      "input[name=new_password]": "new_password"
      "input[name=confirm_password]": "confirm_password"
    events:
      "submit form": 'clickOnSubmit'
    clickOnSubmit: (e) ->
      e.preventDefault()
      this.model.isValid()
      console.log("Submit", this.model.validationError)
    onRender: ->
      this.stickit()

