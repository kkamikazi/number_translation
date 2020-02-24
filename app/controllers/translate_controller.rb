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

    TENS = {
        10 => "dez",
        11 => "onze",
        12 => "doze",
        13 => "treze",
        14 => "quatorze",
        15 => "quinze",
        16 => "dezesseis",
        17 => "dezessete",
        18 => "dezoito",
        19 => "dezenove",
        20 => "vinte",
        30 => "trinta",
        40 => "quarenta",
        50 => "cinquenta",
        60 => "sessenta",
        70 => "setenta",
        80 => "oitenta",
        90 => "noventa"  
    }

    HUNDREDS = {
        100 => "cento",
        200 => "duzentos",
        300 => "trezentos",
        400 => "quatrocentos",
        500 => "quinhentos",
        600 => "seiscentos",
        700 => "setecentos",
        800 => "oitocentos",
        900 => "novecentos"
    }

    def show
        if params[:number] != "0" && params[:number].to_i == 0
            # Casting as int result in 0 if the string is NaN
            render json: { error: "Entrada Inválida. Você deve fornecer um número inteiro no intervalo [-99999, 99999]" }, status: 400
        elsif params[:number].to_i.abs > 99999
            render json: { error: "Número fora do intervalo aceito [-99999, 99999]" }, status: 422
        else
            render json: { extenso: translate(params[:number]) }
        end        
    end

    private
    def translate(number)
        n = number.to_i.abs
        res = (number.to_i < 0) ? "menos " : ""

        case n
        when 0..9
            res += UNIT[n]
        when 10..19
            res += TENS[n]
        when 20..99
            v = n % 10
            if v == 0
              res += TENS[n]
            else
              res += "#{TENS[n-v]} e #{translate(v)}"
            end
        when 100
            res += "cem"
        when 101..999
            v = n % 100
            if v == 0
              res += HUNDREDS[n]
            else
              res += "#{HUNDREDS[n-v]} e #{translate(v)}"
            end
        else
            m = n / 1000
            c = n % 1000
            res += "#{m == 1 ? "" : "#{translate(m)} "}mil#{ c == 0 ? "" : " e #{translate(c)}" }"
        end
    end
end
