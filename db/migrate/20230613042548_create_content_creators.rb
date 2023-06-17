class CreateContentCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :content_creators do |t|
      t.string :name
      t.string :tiktok
      t.string :instagram
      t.string :facebook
      t.string :youtube

      t.timestamps
    end
  end
end
