define ['backbone'], (Backbone) ->
  Backbone.Model.extend
    validate: (attrs, options) ->
      console.log(arguments)
      if (attrs.new_password != attrs.confirm_password)
        return "Passwords do not match"

