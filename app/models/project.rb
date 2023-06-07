require_relative './models_module'

class Project < ActiveRecord::Base
    extend InheritMethods::ClassMethods # 'extend' is used to define class methods
    has_many :boards, dependent: :destroy
    has_many :tasks, through: :boards

    # Class method to create a new project with default values
    def self.create_new_project_with_defaults(hash)
        title = hash["title"] ? hash["title"] : "New Project" # Assigning a default title if not provided
        favorite = hash["favorite"] ? hash["favorite"] : false # Assigning a default favorite status if not provided
        color = hash["color"] ? hash["color"] : '#e1bee7'  # Assigning a default color if not provided

        # Creating a new project with the specified attributes
        self.new(
            title: title,
            favorite: favorite,
            color: color
        )
    end

end
