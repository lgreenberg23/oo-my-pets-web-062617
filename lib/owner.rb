# require 'pry'

class Owner
  attr_accessor :pets, :fish, :dog, :cat, :name
  attr_reader :species

  @@all = []
  @@count = 0

  def initialize(species)
  	@species = species

  	@pets = {fishes: [], dogs: [], cats: []}
  	self.save 

  end

  def save
	@@all << self
  	@@count += 1
  end


  def self.reset_all
   	@@count = 0
   	@@all.clear
   	#empty the @pets hash here and call this method in #sell_pets
  end

  def self.all
  	@@all
  end

  def self.count
  	@@count
  end

  def say_species
  	"I am a #{self.species}."
  end

  def buy_fish(name)
  	fish = Fish.new(name)
  	self.pets[:fishes] << fish
  	num_fishes = self.pets[:fishes].length
  end

  def buy_cat(name)
  	cat = Cat.new(name)
  	self.pets[:cats] << cat
  	num_cats = self.pets[:cats].length
  end

  def buy_dog(name)
  	dog = Dog.new(name)
  	self.pets[:dogs] << dog
  	num_dogs = self.pets[:dogs].length
  end

  def walk_dogs
  	self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
  	self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
  	self.pets[:fishes].each {|fish| fish.mood = 'happy'}
  end

  def sell_pets
  	self.pets.each do |pet_type, pet_array|
  		pet_array.each do |indiv_pet|
  			indiv_pet.mood = "nervous"
  		end
  		pet_array.clear
  	end
  	@@count = 0
  end

  def list_pets
  	"I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end

end


=begin
When an owner buys a new pet, the buy_``cat/dog/fish method takes in an 
argument of a name. You must take that name and do the following:

Make a new instance of the appropriate pet, initializing it with that name.

Associate that new pet instance to the owner by adding it to the appropriate 
array-value of the @pets hash stored in the pets attr_accessor.
When an owner plays with a cat or feeds a fish or walks a dog, that pet will 
get happier. Remember that the pets method stores all of an owners pets. 
The @pets hash stored in that method is full of instances of the Cat/Dog/Fish class. 
That means you can call Cat/Dog/Fish instance methods (such as .mood=) on those pets.
=end