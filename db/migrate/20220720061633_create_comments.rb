class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :article, foreign_key: true

      t.timestamps

    end
  end
end
