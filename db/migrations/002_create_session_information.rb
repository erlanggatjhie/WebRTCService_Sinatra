Sequel.migration do
  change do
    create_table(:session_informations) do
      String :name, :primary_key => true
      String :value, :text => true
    end
  end
end
