require "employee"
require "byebug"

class Startup

    attr_reader :name, :funding, :salaries, :employees
   
    def initialize(name, funding, salaries)
        @name, @funding, @salaries = name, funding, salaries
        @employees = []
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        else
            return false
        end
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees.push(Employee.new(employee_name, title))
        else
            raise "Invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        title = employee.title
        salary = 0
        if valid_title?(title)
            salary = @salaries[title]
            if @funding >= salary
                employee.pay(salary)
                @funding -= salary
            else
                raise "Not enough funds"
            end
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @employees += startup.employees
        startup.close
    end
end
