# frozen_string_literal: true

# bundle exec rake db:create_migration\[create_tasks\]
ROM::SQL.migration do
  change do
    create_table :tasks do
      primary_key :id
      column :title, :text, null: false
      column :description, :text
      column :due_date, :date
    end
  end
end

# then run by
# bundle exec rake db:migrate
# HANAMI_ENV=test bundle exec rake db:migrate
