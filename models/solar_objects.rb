class SolarObject

  attr_accessor :id, :title, :object_type, :radius, :mass, :gravity, :planet

  # method to save the object if a new object is being created or an existing one is being updated
  def save

    # open connectection to the database using the open connection method
    conn = SolarObject.open_connection

    # id statement for writing the sql depending on if there is an id or not
    if(!self.id)
      sql = "INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('#{self.title}', '#{self.object_type}', '#{self.radius}', '#{self.mass}', '#{self.gravity}', '#{self.planet}')"
    else
      sql = "UPDATE object SET title='#{self.title}', object_type='#{self.object_type}', radius='#{self.radius}', mass='#{self.mass}', gravity='#{self.gravity}', planet='#{self.planet}' WHERE id = #{self.id}"
    end

    # runs the sql
    conn.exec(sql)

  end

  # method to create a connection to the database
  def self.open_connection

    conn = PG.connect(dbname: "solar_objects")

  end

  # method to turn the data the database gives after a request into useful information
  def self.hydrate(object_data)

    object = SolarObject.new

    # turns data from the databse into param data
    object.id = object_data['id']
    object.title = object_data['title']
    object.object_type = object_data['object_type']
    object.radius = object_data['radius']
    object.mass = object_data['mass']
    object.gravity = object_data['gravity']
    object.planet = object_data['planet']

    object

  end

  # method to delete an object
  def self.destroy(id)

    # creating a connection to the database
    conn = self.open_connection

    # sql to delete the object for a given id
    sql = "DELETE FROM object WHERE id = #{id}"

    # execute the sql
    conn.exec(sql)

  end

  # method to select all the values in the database
  def self.all

    # creating connection to the database
    conn = self.open_connection

    # sql to select all the values in the columns in a table
    sql = "SELECT id,title,object_type,radius,mass,gravity,planet FROM object ORDER BY mass DESC"

    # execute the sql
    results = conn.exec(sql)

    # loop to hydrate all the values returned by the database into useful data
    solar_objects = results.map do |object|
      self.hydrate(object)
    end

  end

  # method to find a value in the database by giving it an id
  def self.find(id)

    # creating connection to the database
    conn = self.open_connection

    # sql to select the object by the id provided
    sql = "SELECT * FROM object WHERE id =#{id} LIMIT 1"

    # execute the sql
    objects = conn.exec(sql)

    # hydrates the data returned by the database into useful data
    object = self.hydrate(objects[0])

    object

  end

  # method to find the highest id in the database
  def self.get_highest_id

    # creating connection to the database
    conn = self.open_connection

    # sql to find the highest id
    sql = "SELECT * FROM object WHERE id = (select MAX(id) FROM object)"

    # execute the sql
    results = conn.exec(sql)

    # hydrate the data from the database into useful data
    result = self.hydrate(results[0])

    # returns the id after it is converted into an integer
    result.id.to_i

  end

end
