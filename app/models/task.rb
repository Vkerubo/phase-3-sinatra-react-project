require_relative './models_module'

class Task < ActiveRecord::Base
    extend InheritMethods::ClassMethods # 'extend' is used to define class methods

    belongs_to :board
    has_one :project, through: :board


end
