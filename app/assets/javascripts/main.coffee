require ["user_search_view"], (UserSearchView) ->
  CrowdManager = new Marionette.Application

  CrowdManager.addRegions
    searchRegion: "#search-region"
    resultsRegion: "#results-region"

  CrowdManager.on "initialize:after", ->
    CrowdManager.searchRegion.show new UserSearchView

  CrowdManager.start()
