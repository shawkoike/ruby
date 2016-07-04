class String
  # search the str means num?
  def number?
    self =~ /\A-?\d+(.\d+)?\Z/
  end
end

class Hash
  def diff_h(arg,com_hash)
    if com_hash.is_a?(Hash)
      # arg :１ or ２
      # 1 => return array which contains key belongs to only com_hash
      # 2 => return hash which contains key belongs to both Hash
      @@diff = []
      @@dif = {}
      if arg == 1
        com_hash.each_with_index do |(key,value),i|
          @@diff << key unless self.has_key?(key)
        end
        return @@diff
      elsif arg == 2
        com_hash.each_with_index do |(key,value),i|
          if self.has_key?(key)
            value = value.to_s
            self[key] = self[key].to_s
            if value.number? && self[key].number?
              @@dif[key] = value.to_i - self[key].to_i unless value.to_i - self[key].to_i == 0
            end
          end
        end
        return @@dif
      end
    else
      "Incorrect Input"
    end
  end
end
