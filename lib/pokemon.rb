class Pokemon
  
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(id: nil, name:, type:, db:)
    @name = name
    @type = type
    @id = id
    self.db = db
  end
  
  def self.save 
    sql = <<-SQL
      INSERT INTO pokemon (id, name, type) 
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.id, self.name, self.type)

    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
    
end
