class ActionText::Record < ActiveRecord::Base
  def self.ransackable_attributes(auth_object = nil)
    authorizable_ransackable_attributes
  end
end

ActiveSupport.on_load(:action_text_rich_text) do
  class ActionText::RichText < ActionText::Record
    def self.ransackable_attributes(auth_object = nil)
      authorizable_ransackable_attributes
    end
  end
end

module RansackableAttachment
  def ransackable_attributes(_auth_object = nil)
    %w[blob_id created_at id id_value name record_id record_type]
  end
end

ActiveSupport.on_load(:active_storage_attachment) do
  ActiveStorage::Attachment.extend RansackableAttachment
end