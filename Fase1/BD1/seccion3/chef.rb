require 'sqlite3'

class Chef

  def initialize(first_name, last_name, birthday, email, phone)
    @first_name = first_name
    @last_name = last_name
    @birthday = birthday
    @email = email
    @phone = phone
    @created_at = Time.now
    @updated_at = Time.now
  end

  def self.create_table
    Chef.db.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Ferran', 'Adriá', '1985-02-09', 'ferran.adria@elbulli.com', '42381093238', DATETIME('now'), DATETIME('now')),
        -- Añade aquí más registros
          ('Isaac', 'Gonzalez', '1986-05-18', 'jah_razta86@hotmail.com', '5527541207', DATETIME('now'), DATETIME('now')),
          ('Roberto', 'Herrera', '1990-07-19', 'rherrerarami@gmail.com', '5512457856', DATETIME('now'), DATETIME('now')),
          ('Chester', 'Di Caprio', '1986-11-30', 'yeyi@mail.com', '12333143108', DATETIME('now'), DATETIME('now')),
          ('Trobin', 'Del Rayo', '2015-01-11', 'trobin@mail.com', '42223239306', DATETIME('now'), DATETIME('now')),
          ('Misty', 'Monfil', '2007-08-13', 'misty@mail.com', '12331646650', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end

  def self.all
    # all = db.execute("SELECT * FROM chefs")
    Chef.db.execute(
      <<-SQL
        SELECT * FROM chefs;
      SQL
    )
  end

  def self.where(field, data)
    Chef.db.execute("SELECT * FROM chefs WHERE #{field} = ?", "#{data}")
    
    # Chef.db.execute(
    #   <<-SQL
    #     SELECT * FROM Chefs WHERE '"#{field}" = ?, "#{data}"';
    #   SQL
    # )
  end

  def save
    Chef.db.execute(
    <<-SQL
      INSERT INTO chefs
        (first_name, last_name, birthday, email, phone, created_at, updated_at)
      VALUES
        ('#{@first_name}', '#{@last_name}', '#{@birthday}', '#{@email}', '#{@phone}', '#{@created_at}', '#{@updated_at}')
    SQL
    )
  end

  def self.delete(field, data)

    Chef.db.execute("DELETE FROM chefs WHERE #{field} = ?", "#{data}")
    # Chef.db.execute(
    #   <<-SQL
    #     -- DELETE FROM chefs WHERE "#{field}" = "#{data}";
    #     DELETE FROM chefs WHERE "'#{field}' = ?, '#{data}'";
    #   SQL
    # )
  end

  private

  def self.db
    @@db ||= SQLite3::Database.new("chefs.db")
  end

end


# chef = Chef.new("Calvin", "Del Rayo", "2017-01-11", "calvin@mail.com", "12345678910")