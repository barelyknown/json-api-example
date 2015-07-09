class BaseResource < JSONAPI::Resource
  attribute :created_at
  attribute :updated_at

  class << self
    def creatable_fields(context)
      super - [:id, :created_at, :updated_at]
    end

    def updatable_fields(context)
      creatable_fields(context)
    end
  end
end
