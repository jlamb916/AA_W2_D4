
def is_prime?(num)

    return false if num < 2

    (2...num).none? { |factor| num % factor == 0 }
end


def nth_prime(n)
    
    counter = 0
    num = 1
    while counter < n
        num += 1
        counter += 1 if is_prime?(num)
    end
    return num
end

def prime_range(min, max)
    
    (min..max).select {|ele| is_prime?(ele)}
end