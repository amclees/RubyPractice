# frozen_string_literal: false

adjacency_string = <<START
AK
AL,MS,TN,GA,FL
AR,MO,TN,MS,LA,TX,OK
AZ,CA,NV,UT,CO,NM
CA,OR,NV,AZ
CO,WY,NE,KS,OK,NM,AZ,UT
CT,NY,MA,RI
DE,MD,PA,NJ
FL,AL,GA
GA,FL,AL,TN,NC,SC
HI
IA,MN,WI,IL,MO,NE,SD
ID,MT,WY,UT,NV,OR,WA
IL,IN,KY,MO,IA,WI
IN,MI,OH,KY,IL
KS,NE,MO,OK,CO
KY,IN,OH,WV,VA,TN,MO,IL
LA,TX,AR,MS
MA,RI,CT,NY,NH,VT
MD,VA,WV,PA,DE
ME,NH
MI,WI,IN,OH
MN,WI,IA,SD,ND
MO,IA,IL,KY,TN,AR,OK,KS,NE
MS,LA,AR,TN,AL
MT,ND,SD,WY,ID
NC,VA,TN,GA,SC
ND,MN,SD,MT
NE,SD,IA,MO,KS,CO,WY
NH,VT,ME,MA
NJ,DE,PA,NY
NM,AZ,UT,CO,OK,TX
NV,ID,UT,AZ,CA,OR
NY,NJ,PA,VT,MA,CT
OH,PA,WV,KY,IN,MI
OK,KS,MO,AR,TX,NM,CO
OR,CA,NV,ID,WA
PA,NY,NJ,DE,MD,WV,OH
RI,CT,MA
SC,GA,NC
SD,ND,MN,IA,NE,WY,MT
TN,KY,VA,NC,GA,AL,MS,AR,MO
TX,NM,OK,AR,LA
UT,ID,WY,CO,NM,AZ,NV
VA,NC,TN,KY,WV,MD
VT,NY,NH,MA
WA,ID,OR
WI,MI,MN,IA,IL
WV,OH,PA,MD,VA,KY
WY,MT,SD,NE,CO,UT,ID
START

adjacency_map = {}

adjacency_string.split("\n").each do |line|
  adjacent = line.split(',')
  state = adjacent.shift
  adjacency_map[state] = adjacent
end

puts '{'
adjacency_map.each do |state, adjacents|
  line = '  '
  line << "'" + state.downcase + "' => ["
  line << adjacents.map { |adjacent| "'" + adjacent + "'" }.join(', ').downcase
  line << '],'
  puts line
end
puts '}'
