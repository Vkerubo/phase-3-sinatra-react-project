require_relative './models_module'

class Task < ActiveRecord::Base
    extend InheritMethods::ClassMethods # 'extend' is used to define class methods


end
