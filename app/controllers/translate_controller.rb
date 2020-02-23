class TranslateController < ApplicationController
    UNIT = {
        0 => "zero",
        1 => "um",
        2 => "dois",
        3 => "três",
        4 => "quatro",
        5 => "cinco",
        6 => "seis",
        7 => "sete",
        8 => "oito",
        9 => "nove",
    }

    def show
        render json: { extenso: translate(params[:number]) }
    end

    private
    def translate(number)
        n = number.to_i.abs
        res = (number.to_i < 0) ? "menos " : ""

        case n
        when 0..9
            res += UNIT[n]
        end    
    end
end
