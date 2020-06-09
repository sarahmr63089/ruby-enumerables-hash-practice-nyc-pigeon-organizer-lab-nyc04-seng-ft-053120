def nyc_pigeon_organizer(data)
  # get all bird names and attributes
  bird_attributes = []
  bird_names = []
  data.each {|key, value|
    bird_attributes << key
    value.each_value {|names|
      i = 0
      while names.length > i
        bird_names << names[i]
        i += 1
      end
    }
  }
  bird_names.uniq!

  # create an empty hash for each name
  birds_by_name = {}

  #adds attribute key value pairs to name hash
  bird_names.each {|name|
    birds_by_name[name] = {}
    bird_attributes.each {|attribute|
      birds_by_name[name][attribute] = []
    }
  }

   data.each {|reference, value|
    value.each {|key, array_of_name|
      i = 0
      while i < bird_names.length
        if array_of_name.include?(bird_names[i]) 
          birds_by_name[bird_names[i]][reference] << key.to_s
        end
      i += 1
      end
    }
   }

birds_by_name

end