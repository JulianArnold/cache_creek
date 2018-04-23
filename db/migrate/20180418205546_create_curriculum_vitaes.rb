class CreateCurriculumVitaes < ActiveRecord::Migration
  def change
    create_table :curriculum_vitaes do |t|
      t.string :name
      t.text :description
      t.attachment :upload

      t.timestamps null: false
    end
  end
end
