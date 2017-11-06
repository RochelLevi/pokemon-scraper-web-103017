class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(attributes)
    attributes.each{|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (\"#{name}\", \"#{type}\")")
  end

  def self.find(id, db)
    attributes = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
    hash = {}
    hash["id"] = attributes[0][0]
    hash["name"] = attributes[0][1]
    hash["type"] = attributes[0][2]
    Pokemon.new(hash)
  end
end
