define ['backbone'], (Backbone) ->
  Backbone.Model.extend
    validate: (attrs, options) ->
      errors = {}
      if _.isEmpty attrs.current_password
        errors.current_password = 'Current password is mandatory'
      if attrs.new_password != attrs.confirm_password
        errors.confirm_password = 'Passwords do not match'
        errors.new_password = ''
      if _.isEmpty errors then null else errors

