class ApplicationRecord < ActiveRecord::Base
  include Dnnff::ActsAsDnnModeler

  self.abstract_class = true
end
