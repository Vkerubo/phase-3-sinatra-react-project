module InheritMethods
    module ClassMethods
      # Method to find a board by its path in the URL
        def find_by_path(path, url)
            id = path.split(url).last.to_i
            find_by_id(id) # Implicit self: equivalent to self.find_by_id(id)
        end
    end
end
