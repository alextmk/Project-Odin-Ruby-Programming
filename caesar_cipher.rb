def caesar_cipher(string,key)
    hash_l_to_n={
        "a"=>1,
        "b"=>2,
        "c"=>3,
        "d"=>4,
        "e"=>5,
        "f"=>6,
        "g"=>7,
        "h"=>8,
        "i"=>9,
        "j"=>10,
        "k"=>11,
        "l"=>12,
        "m"=>13,
        "n"=>14,
        "o"=>15,
        "p"=>16,
        "q"=>17,
        "r"=>18,
        "s"=>19,
        "t"=>20,
        "u"=>21,
        "v"=>22,
        "w"=>23,
        "x"=>24,
        "y"=>25,
        "z"=>26,
        }
        hash_n_to_l={
        1=>"a",
        2=>"b",
        3=>"c",
        4=>"d",
        5=>"e",
        6=>"f",
        7=>"g",
        8=>"h",
        9=>"i",
        10=>"j",
        11=>"k",
        12=>"l",
        13=>"m",
        14=>"n",
        15=>"o",
        16=>"p",
        17=>"q",
        18=>"r",
        19=>"s",
        20=>"t",
        21=>"u",
        22=>"v",
        23=>"w",
        24=>"x",
        25=>"y",
        26=>"z",
        }
    char_arr=string.split("")

    num_arr=char_arr.each_with_index.map do |item, i|
        if(item=~/[a-zA-Z]/)
            hash_l_to_n[item.downcase]
        else
            item
        end
    end

    num_arr.each_with_index do |item, i|
        if(item.is_a?(Fixnum))
            num_arr[i]+=key
            num_arr[i]=num_arr[i]%26
        end
    end
    
    result_arr=num_arr.each_with_index.map do |item, i|
        if(item.is_a?(Fixnum))
            hash_n_to_l[item]
        else
          item
        end
    end
    
    char_arr.each_with_index do |item, i|
        if(item=~/[a-zA-Z]/&&item==item.upcase)
            result_arr[i]=result_arr[i].upcase
        end
    end
    
    return result_arr.join("")
        
    
end