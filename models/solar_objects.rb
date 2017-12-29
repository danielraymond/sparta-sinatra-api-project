class SolarObject

  attr_accessor :id, :title, :object_type, :radius

  def save

    conn = SolarObject.open_connection

    if(!self.id)
      sql = "INSERT INTO object (title, object_type, radius) VALUES ('#{self.title}', '#{self.object_type}', '#{self.radius}')"
    else
      sql = "UPDATE object SET title='#{self.title}', object_type='#{self.object_type}', radius='#{self.radius}' WHERE id = #{self.id}"
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

    object

  end

  def self.destroy(id)

    conn = self.open_connection

    sql = "DELETE FROM post WHERE id = #{id}"

    conn.exec(sql)

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT id,title,object_type,radius FROM object ORDER BY id"

    results = conn.exec(sql)

    solar_objects = results.map do |object|
      self.hydrate(object)
    end

  end

  def self.find(id)

    conn = self.open_connection

    sql = "SELECT * FROM post WHERE id =#{id} LIMIT 1"

    posts = conn.exec(sql)

    post = self.hydrate(posts[0])

    post

  end

end
