CrowdManager = new Marionette.Application

CrowdManager.addRegions
  searchRegion: "#search-region"
  resultsRegion: "#results-region"

CrowdManager.UserSearchView = Backbone.Marionette.ItemView.extend
  template: "#user-search-template"
  events:
    "click input[name=username]": "clickOnInput"
  clickOnInput: (e) ->
    console.log("Click", e)

CrowdManager.on "initialize:after", ->
  CrowdManager.searchRegion.show new CrowdManager.UserSearchView

CrowdManager.start()
