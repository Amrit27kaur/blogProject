class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|

      t.string :user_id
      t.string :title
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end
