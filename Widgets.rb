# Widgets.rb

input = File.open("widgets.csv", "r")
header = input.readline.split(",")
puts "#{header[0]} #{header[1]} #{header[2]} #{header[3]} #{header[5].strip} #{header[4]} \n" 
testDept = 0
testPlant = 0
testState = 0
x = 0
y = 0
z = 0
total = 0
input.each do |line|
	read = line.split(",")
	read[5] = Integer(read[5].strip)
	if testDept != 0
		if testDept != read[2]
			y += x
			z += x
			printf("\n\n%28s TOTAL FOR DEPT %3s *\n", x, testDept)
			if testPlant != read[1]
				printf("%28s TOTAL FOR PLANT %s **", y, testPlant)
				y = 0
				if testState != read[0]
					printf("\n%28s TOTAL FOR STATE %s ***\n", z, testState)
					total += z
					z = 0
				else
					puts "\n"
				end
			end
			x = read[5]
		elsif testPlant != read[1]
			y += x
			z += x
			printf("\n\n%28s TOTAL FOR DEPT %3s *\n", x, testDept)
			printf("%28s TOTAL FOR PLANT %s **\n", y, testPlant)
			y = 0
		else
			x += read[5]
		end
		testDept = read[2]
		testPlant = read[1]
		testState = read[0]
	printf("\n%5s %5s %4s %5s %5s %s", read[0], read[1], read[2], read[3], read[5], read[4])
	else
		testDept = read[2]
		testPlant = read[1]
		testState = read[0]
		x = read[5]
		printf("\n%5s %5s %4s %5s %5s %s", read[0], read[1], read[2], read[3], read[5], read[4])
	end
end
if y == 0
	y = x
	z += x
	total += z
end
printf("\n\n%28s TOTAL FOR DEPT %3s *\n", x, testDept)
printf("%28s TOTAL FOR PLANT %s **", y, testPlant)
printf("\n%28s TOTAL FOR STATE %s ***", z, testState)
printf("\n\n%28s GRAND TOTAL        ****\n\n", total)
