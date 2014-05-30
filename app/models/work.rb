class Work < ActiveRecord::Base
  attr_accessible :name, :description, :url, :date, :portfolio

  has_attached_file :portfolio,
    :styles => { :medium => "500x400>", :thumb => "200x200#" }

  validates_attachment_content_type :portfolio, content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'application/octet-stream']
  validates_attachment_size :portfolio, less_than: 2000.kilobytes

  class << self
    #Scopes
    def works_to_show
      if count() > 4
        limit(8).order('date DESC')
      else
        limit(4).order('date DESC')
      end

    end
  end
end