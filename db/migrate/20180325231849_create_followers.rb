class CreateFollowers < ActiveRecord::Migration[5.1]
    def change
      create_table :followers do |t|
          me = TwitterApi.new
          attributes = me.get_followers.first
        attributes.attrs.each{|attribute, value|
        if attribute.to_sym == :id
          t.integer :twitter_id, limit: 8
        elsif value == nil
          t.string attribute.to_sym
        elsif value.class == Fixnum
          t.integer attribute.to_sym, limit: 8
        elsif value.class == String
          t.string attribute.to_sym
        elsif value.class == TrueClass || value.class == FalseClass
          t.boolean attribute.to_sym
        end
        }
        t.string :profile_banner_url
        t.string :website
        t.string :status_text
        t.string :status_time
      end
    end
  end
