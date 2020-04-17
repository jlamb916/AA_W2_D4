require "byebug"

def pas(n)  
    debugger 
    triangle = [ [1], [1,1] ]
    
   while triangle.length < n
        small_arr = [1]
        i = small_arr.length
        while i < triangle.length
            prev = triangle.length - 1
            small_arr << (triangle[prev][i] + triangle[prev][i - 1])
            i += 1
        end
        small_arr << 1
        triangle << small_arr
    end
    triangle
end

p pas(4) #     0 [1],  triangle[0]
# #     1 [1, 1], triangle[1] row.len 2 == len 2
# #     2 [1, 2, 1], triangle[2]
# #     3 [1, 3, 3, 1], 
# #     4 [1, 4, 6, 4, 1]
# # ]

#p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]