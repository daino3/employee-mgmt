require 'active_model_serializers'

module ActiveModel
  class Serializer
    # Have to monkey patch rc2 to get as_json helper method
    # can eventually delete this once this is merged in
    # see: https://github.com/rails-api/active_model_serializers/pull/889
    def as_json(options = {})
      self.class.adapter.new(self).as_json(options)
    end
  end
end
