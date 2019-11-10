--init
local outVMD='VMD/demo.vmd'  --< change vmd name

-- build segment MSH
local function BuidlMSH(inMsg,outMsg)

   -- Change some fields
   outMsg.MSH[3][1] = 'Iguana'
   outMsg.MSH[5][1] = 'Also Iguana'
   outMsg.MSH[17] = 'CA'
   outMsg.MSH[8] = 'Very high'
   outMsg.MSH[19][1] = 'English'
   outMsg.MSH[19][5] = 'EN'
   outMsg.MSH[19][2] = 'Engrish'
   outMsg.MSH[5][2] = 'iFW'
   outMsg.MSH[13] = '1234'
   outMsg.MSH[18][1] = 'EU'
   outMsg.MSH[16] = 'ACK'
   outMsg.MSH[15] = 'AT'

end


-- build segment PID
local function BuidlPID(inMsg,outMsg)

   -- Change some fields
   outMsg.PID[5][1][2] = 'Paul'
   outMsg.PID[5][1][1][1] = 'Le'
   outMsg.PID[8] = 'M'
   outMsg.PID[12] = 'CA'
   outMsg.PID[6][1][1][1] = 'Nguyen'
   outMsg.PID[13][1][1] = '9054575161'
   outMsg.PID[22][1][1] = 'Vietnamese'
   outMsg.PID[17][1] = 'None'
   outMsg.PID[26][1][1] = 'CA'
   outMsg.PID[23] = 'Canada'
   outMsg.PID[29][1] = 'Never'
   outMsg.PID[28][1] = 'Vietnamese'
   outMsg.PID[20][1] = 'I can drive'
   outMsg.PID[15][1] = 'English'
   outMsg.PID[9][1][1][1] = 'Rick'
   outMsg.PID[25] = 'I came out first'
   outMsg.PID[35][1] = 'Human'
   outMsg.PID[30] = 'Not yet'
   outMsg.PID[16][1] = 'Single'
   outMsg.PID[35][2] = 'HU'
   outMsg.PID[21][1][1] = '1'
   outMsg.PID[37] = 'Infected'
   outMsg.PID[39][1][1] = 'No tribe'
   outMsg.PID[14][1][1] = '911'
   outMsg.PID[27][1] = 'Too young'
   outMsg.PID[36][2] = 'Normal breed'
   outMsg.PID[34][1] = 'asdf2345'
   outMsg.PID[1] = '1234'
   outMsg.PID[24] = 'No twin'
   outMsg.PID[32][1] = '1234'

end

-- build segment OBX
local function BuidlOBX(inMsg,outMsg)

   -- Change some fields
   outMsg.OBX[2][5][1][1] = '175'
   outMsg.OBX[1][5][1][1] = '75'
   outMsg.OBX[1][8][1] = 'Yeap plenty'
   outMsg.OBX[2][9] = 'Hundo p'
   outMsg.OBX[1][10][1] = 'Very fake'
   outMsg.OBX[2][14] = 'Yesterday'
   outMsg.OBX[1][23][1] = 'My house'
   outMsg.OBX[2][22][1] = 'Very angry'
   outMsg.OBX[1][20][1][1] = 'Your house'
   outMsg.OBX[1][22][1] = 'Very angry'
   outMsg.OBX[1][1] = '123'
   outMsg.OBX[1][9] = 'impoisbler'
   outMsg.OBX[1][17][1][1] = 'My eyes'
   outMsg.OBX[2][20][1][1] = 'My home'
   outMsg.OBX[2][7] = 'zero to a hunned'
   outMsg.OBX[2][8][1] = 'Very abnormal flagh'

end

--main function
local function BuildMsg(InBoundMsg,MsgType)
   local OutBoundMsg = hl7.message{vmd=outVMD,name=MsgType}  --change: the vmd file 

   -- Map entire message
   OutBoundMsg:mapTree(InBoundMsg)

   -- Create one BuildXXX per Segment
   BuidlMSH(InBoundMsg,OutBoundMsg)
   BuidlPID(InBoundMsg,OutBoundMsg)
   BuidlOBX(InBoundMsg,OutBoundMsg)
   -- .
   -- end of build message

   queue.push{data=OutBoundMsg:S()} --< send message to down stream
end

return BuildMsg