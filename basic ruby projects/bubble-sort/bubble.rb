=begin 
Build a method #bubble_sort that takes an array and returns a sorted array. 
It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).
=end


def bubble_sort(arr)
    sorted = false
    until sorted
        sorted = true
        (0...arr.length-1).each do |i|
            if arr[i] > arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted = false
            end
        end
    end
    arr
end

p bubble_sort([4,3,78,2,0,2]) #[0, 2, 2, 3, 4, 78]