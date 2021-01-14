class Group
    
    def self.create(name)
        path = name.split(" ").map {|word| word.downcase}.join("-")+".txt" #.split(" ")<-- this creates an array
        File.open("./groups/#{path}", "w") do |file| #"w" means to write on the file 
            file.write("")
        end
        puts "created file"
    end

    #allows access to variables in order files
    attr_reader :name, :file_path, :names_array
    def initialize(name, path)
        @name = name
        @file_path = path
        @names_array = self.path_to_array || [] # <-- if path fails initialise it to an empty array
    end

    def path_to_array
        array = File.readlines(@file_path).map {|name| name.strip}
        return array
    end

    def add_name(name)
        return @names_array.push(name)
    end

    def remove_name(name)
        return @names_array.delete(name)
    end

    def save
        File.open(@file_path, "w+") do |file|  #This will overide the file rather than append it
            file.puts(@names_array)
        end
    end

    def randomise_order
        return @names_array.shuffle
    end

    def who_am_i
        return self
    end
end

# group = Group.new("Test", "./groups/test-group.txt")
# # group.add_name("Greg")
# pp group.who_am_i

Group.create("the nerds")



