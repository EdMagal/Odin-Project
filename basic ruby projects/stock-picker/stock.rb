=begin 
Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. 
It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
=end

def stock_picker(arr)
    best_deal = 0
    day_index = [0,0]
    arr.each_index   do |i|
        arr.each_index do |j|
            if j > i
                curr_price = arr[i]
                future_price = arr[j]
                if future_price - curr_price > best_deal
                    best_deal = future_price - curr_price
                    day_index = [i, j]
                end
            end
        end
    end
    day_index
end

p stock_picker([17,3,6,9,15,8,6,1,10]) # [1, 4]
p stock_picker([10,12,15,3,7,8,12,0,8]) # [3, 6]
