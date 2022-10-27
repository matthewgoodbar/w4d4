
def my_uniq(arr)
    res = []
    arr.each {|el| res << el unless res.include?(el)}
    return res
end

class Array
    def two_sum
        res = []
        (0...(self.length+1)).each do |left|
            ((left+1)...self.length).each do |right|
                res << [left,right] if self[left] + self[right] == 0
            end
        end
        return res
    end
end

def my_transpose(arr)
    res = []
    (0...arr.length).each do |col|
        sub_res = []
        (0...arr.length).each do |row|
            sub_res << arr[row][col]
        end
        res << sub_res
    end
    return res
end

def stock_picker(arr)
    res = {}
    (0...(arr.length-1)).each do |buy_day|
        ((buy_day+1)...arr.length).each do |sell_day|
            res[arr[sell_day] - arr[buy_day]] = [buy_day, sell_day]
        end
    end
    max_dif = res.keys.max
    return nil if max_dif <= 0
    return res[max_dif]
end