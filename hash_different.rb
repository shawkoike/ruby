class String
  # 文字列に対して数値を示すものか調べる
  def number?
    self =~ /\A-?\d+(.\d+)?\Z/
  end
end

class Hash
  def diff_h(arg,com_hash)
    # arg は１、２
    # 1 => com_hash にあって元にないものを配列で返す
    # 2 => com_hash と元の共通部分の差をハッシュで返す
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
  end
end
