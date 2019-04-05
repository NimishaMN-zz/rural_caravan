class CreateActivityDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_details do |t|
    	t.integer :work_detail_id, :null => false
    	t.integer :team_size
    	t.date :start_date
      t.date :end_date
      t.integer :status
      t.string :employes
      t.integer :user_id, null: false
      # t.integer :amount_of_work
    	# t.integer :expense
    	# t.integer :revenue
    	# t.integer :income
      t.timestamps
    end
  end
end
