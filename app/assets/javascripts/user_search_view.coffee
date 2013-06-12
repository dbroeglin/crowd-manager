define ['marionette'], ->
  Backbone.Marionette.ItemView.extend
    template: "#user-search-template"
    events:
      "click input[name=username]": "clickOnInput"
    clickOnInput: (e) ->
      console.log("Click", e)
