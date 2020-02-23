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
        render json: { extenso: translate(params[:number].to_i) }
    end

    private
    def translate(number)
        res = ""
        case number
        when 0..9
            res = UNIT[number]
        end    
    end
end
