define ["pwd_change_view"], (PwdChangeView) ->
  CrowdManager = new Marionette.Application

  CrowdManager.addRegions
    searchRegion: "#search-region"
    resultsRegion: "#results-region"

  CrowdManager.on "initialize:after", ->
    CrowdManager.searchRegion.show new PwdChangeView

  return CrowdManager
