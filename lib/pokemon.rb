class Pokemon
  
  attr_accessor :name, :type
  attr_reader :id
  
  def initialize(id: nil, name:, type:, db:)
    @name = name
    @type = type
    @id = id
    self.db = db
  end
  
  def save 
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.type)

    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
    
end
