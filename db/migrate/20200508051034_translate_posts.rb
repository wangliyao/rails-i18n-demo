class TranslatePosts < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        Post.create_translation_table!({
          :title => :string,
          :content => :text
        }, {
          :migrate_data => true,
          :remove_source_columns => true
        })
      end

      dir.down do
        Post.drop_translation_table! :migrate_data => true
      end
    end
  end
end
