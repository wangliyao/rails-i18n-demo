class Post < ApplicationRecord
  translates :title, :content, touch: true

  delegate :content, to: :translation
  delegate :content=, to: :translation

  after_save do
    content.save if content.changed?
  end

  class Translation
     has_rich_text :content
   end
end
