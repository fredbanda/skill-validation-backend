class CreateSolidQueueTables < ActiveRecord::Migration[6.0]
  def change
    # Create solid_queue schema if it doesn't exist
    create_schema :solid_queue unless schema_exists?(:solid_queue)

    # Create solid_queue.processes table
    create_table :processes, schema: :solid_queue do |t|
      t.string :name
      t.integer :job_id
      t.timestamps
    end

    # Create other SolidQueue tables (jobs, queues, etc.)
    create_table :jobs, schema: :solid_queue do |t|
      t.string :name
      t.text :data
      t.timestamps
    end

    create_table :queues, schema: :solid_queue do |t|
      t.string :name
      t.timestamps
    end
  end
end
