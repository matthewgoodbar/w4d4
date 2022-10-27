class TowersOfHanoi

    attr_reader :pegs

    def initialize
        @pegs = [[3,2,1],[],[]]
    end

    def move(start_pos,end_pos)
        raise ArgumentError.new unless (0..2).include?(start_pos) && (0..2).include?(end_pos)
        if @pegs[start_pos] != nil && (@pegs[end_pos].empty? || @pegs[end_pos][-1] > @pegs[start_pos][-1])
            @pegs[end_pos] << @pegs[start_pos].pop
        end
    end
    
    def win?
        return @pegs[2] == [3,2,1]
    end

    def play
        until win?
            input = get_input
            move(input[0],input[1])
        end
        puts "you win!"
    end

    private
    def render_stacks
        print @pegs
        puts
    end

    def get_input
        render_stacks
        puts "enter a move\n"
        input = gets.chomp.split(" ").map! {|ele| ele.to_i}
        raise "Invalid input" unless input[0].is_a?(Integer) && input[1].is_a?(Integer)
        return input
    rescue
        puts "enter a valid move"
        retry
    end

end

#TowersOfHanoi.new.play
