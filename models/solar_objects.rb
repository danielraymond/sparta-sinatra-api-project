class SolarObject

  attr_accessor :id, :title, :object_type, :radius, :mass, :gravity, :planet

  def save

    conn = SolarObject.open_connection

    if(!self.id)
      sql = "INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('#{self.title}', '#{self.object_type}', '#{self.radius}', '#{self.mass}', '#{self.gravity}', '#{self.planet}')"
    else
      sql = "UPDATE object SET title='#{self.title}', object_type='#{self.object_type}', radius='#{self.radius}', mass='#{self.mass}', gravity='#{self.gravity}', planet='#{self.planet}' WHERE id = #{self.id}"
    end

    conn.exec(sql)

  end

  def self.open_connection

    conn = PG.connect(dbname: "solar_objects")

  end

  def self.hydrate(object_data)

    object = SolarObject.new

    object.id = object_data['id']
    object.title = object_data['title']
    object.object_type = object_data['object_type']
    object.radius = object_data['radius']
    object.mass = object_data['mass']
    object.gravity = object_data['gravity']
    object.planet = object_data['planet']

    object

  end

  def self.destroy(id)

    conn = self.open_connection

    sql = "DELETE FROM object WHERE id = #{id}"

    conn.exec(sql)

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT id,title,object_type,radius,mass,gravity,planet FROM object ORDER BY mass DESC"

    results = conn.exec(sql)

    solar_objects = results.map do |object|
      self.hydrate(object)
    end

  end

  def self.find(id)

    conn = self.open_connection

    sql = "SELECT * FROM object WHERE id =#{id} LIMIT 1"

    objects = conn.exec(sql)

    object = self.hydrate(objects[0])

    object

  end

end
