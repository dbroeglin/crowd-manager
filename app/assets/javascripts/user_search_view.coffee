define ['marionette', 'text!tpl/user_search_view.html'], (M, Template)->
  Backbone.Marionette.ItemView.extend
    template: _.template(Template)
    events:
      "click input[name=username]": "clickOnInput"
    clickOnInput: (e) ->
      console.log("Click", e)
