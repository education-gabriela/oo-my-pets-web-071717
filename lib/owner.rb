class Owner
  @@all_owners = []

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all_owners << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.class.action_pet(self.pets[:dogs], "happy")
  end

  def play_with_cats
    self.class.action_pet(self.pets[:cats], "happy")
  end

  def feed_fish
    self.class.action_pet(self.pets[:fishes], "happy")
  end

  def sell_pets
    self.pets.each do |kind, pet|
      self.class.action_pet(pet, "nervous")
    end

    self.pets.clear
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end

  def self.action_pet(pets, mood)
    pets.each do |pet|
      pet.mood = mood
    end
  end

  def self.all
    @@all_owners
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.length
  end

end
