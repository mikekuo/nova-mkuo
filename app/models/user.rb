class User < ApplicationRecord
  include Tokenable
  belongs_to :team, optional: true
end
