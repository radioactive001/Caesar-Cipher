require 'sinatra'


get '/' do
	str=params["str"].to_s
	num=params["num"].to_i
	message=cipher(str,num)
	erb :index, :locals => {:message => message}
end



def cipher(str,num)
	text=""
	str.each_byte{
		|x|

		if (65..90)===x
			if x+num>=90
				x=((x+num)-90)+64
			else
				x=x+num
			end
		elsif (97..122)===x
			if x+num>=122
				x=((x+num)-122)+96
			else
				x=x+num
			end
		else
			x=x
		end
		text << x.chr

	}
	return text

end
