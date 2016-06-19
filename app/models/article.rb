class Article < ActiveRecord::Base
  def json_format
    {
      user: "x",
      text: self.body,
      unique_id: self.id
    }
  end
end
