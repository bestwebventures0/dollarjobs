module RansackSearchable
  extend ActiveSupport::Concern

  included do
    def self.ransackable_attributes(auth_object = nil)
      authorizable_ransackable_attributes
    end

    def self.ransackable_associations(auth_object = nil)
      authorizable_ransackable_associations
    end
  end
end