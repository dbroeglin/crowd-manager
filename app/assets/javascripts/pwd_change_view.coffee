define ['marionette', 'text!tpl/pwd_change_view.html', 'pwd_change_model'], (M, Template, PwdChangeModel) ->
  Backbone.Marionette.ItemView.extend
    template: _.template(Template)
    model: new PwdChangeModel 
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

