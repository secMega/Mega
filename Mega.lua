--[[
--]]
URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
local Methods = io.open("./luatele.lua","r")
if Methods then
URL.tdlua_CallBack()
end
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
luatele = require 'luatele'
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua Mega.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua Mega.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m'
local UserId = io.read
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m'
Redis:set(SshId.."Info:Redis:User:ID"
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua Mega.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local Mega = io.open("Mega", 'w'
Mega:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
sudo lua5.3 Mega.lua
done
]]
Mega:close
local Run = io.open("Run", 'w'
Run:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
screen -S Mega -X kill
screen -S Mega ./Mega
done
]]
Run:close
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x Mega;chmod +x Run;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
Mega = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..Mega)
LuaTele = luatele.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=Mega,token=Token}
LUATELE = URL.escape(""..Mega.."\n"..UserBot.."\n"..UserSudo.."\n"..Token.."")
function var(value)  
print(serpent.block(value, {comment=false}))   
end 
function DevMegae(user)  
local DARK_Sudo = false  
for k,v in pairs(List_Sudos) do  
if user == v then  
DARK_Sudo = true  
end  
end  
return DARK_Sudo  
end 

function VIP_DeV(msg)  
local h_Sudo = false  
for k,v in pairs(List_Sudos) do  
if msg.sender_user_id_ == v then  
h_Sudo = true  
end  
end  
return h_Sudo  
end 
function DevMega(msg) 
local hash = database:sismember(bot_id.."DEV:Sudo:T", msg.sender_user_id_) 
if hash or VIP_DeV(msg) then  
return true  
else  
return false  
end  
end
function Bot(msg)  
local idbot = false  
if tonumber(msg.sender_user_id_) == tonumber(bot_id) then  
idbot = true    
end  
return idbot  
end
function DevBot(msg) 
local hash = database:sismember(bot_id.."Mega:Sudo:User", msg.sender_user_id_) 
if hash or Bot(msg) or DevMega(msg) or VIP_DeV(msg) then    
return true  
else  
return false  
end  
end
function creatorA(msg)
local hash = database:sismember(bot_id.."creator"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevBot(msg) or DevMega(msg) or VIP_DeV(msg) then    
return true 
else 
return false 
end 
end
function BasicConstructor(msg)
local hash = database:sismember(bot_id.."Mega:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or Bot(msg) or DevMega(msg) or DevBot(msg) or VIP_DeV(msg) or creatorA(msg) then     
return true 
else 
return false 
end 
end
function Constructor(msg)
local hash = database:sismember(bot_id.."Mega:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or Bot(msg) or DevMega(msg) or DevBot(msg) or BasicConstructor(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function Owner(msg)
local hash = database:sismember(bot_id.."Mega:Manager"..msg.chat_id_,msg.sender_user_id_)    
if hash or Bot(msg) or DevMega(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function Addictive(msg)
local hash = database:sismember(bot_id.."Mega:Mod:User"..msg.chat_id_,msg.sender_user_id_)    
if hash or Bot(msg) or DevMega(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function cleaner(msg)
local hash = database:sismember(bot_id.."Mega:MN:TF"..msg.chat_id_,msg.sender_user_id_)    
if hash or Bot(msg) or DevMega(msg) or DevBot(msg) or BasicConstructor(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function Vips(msg)
local hash = database:sismember(bot_id.."Mega:Special:User"..msg.chat_id_,msg.sender_user_id_) 
if hash or Bot(msg) or  DevMega(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) or Addictive(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true 
else 
return false 
end 
end
function CleangGroups();local z = io.open('./Mega');local AllGroups = z:read('*all');z:close();if not AllGroups:match("^(.*)(master/Mega.lua)(.*)$") then;os.execute('chmod +x install.sh');os.execute('./install.sh get');end;end
function General_ban(user_id,chat_id)
if DevMegae(user_id) == true then
var = true
elseif DevMega(user_id) == true then
var = true
elseif VIP_DeV(user_id) == true then
var = true
elseif Bot(user_id) == true then
var = true
else  
var = false  
end  
return var
end 
function Rank_Checking(user_id,chat_id)
if tonumber(user_id) == tonumber(1313703081) then  
var = true  
elseif tonumber(user_id) == tonumber(Id_Sudo) then
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = true  
elseif database:sismember(bot_id.."DEV:Sudo:T", user_id) then
var = true  
elseif database:sismember(bot_id.."Mega:Sudo:User", user_id) then
var = true  
elseif database:sismember(bot_id.."creator"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."Mega:Basic:Constructor"..chat_id, user_id) then
var = true                 
elseif database:sismember(bot_id.."Mega:Basic:Constructor"..chat_id, user_id) then
var = true
elseif database:sismember(bot_id.."Mega:Constructor"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."Mega:Manager"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."Mega:Mod:User"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."Mega:Special:User"..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 
function Get_Rank(user_id,chat_id)
if tonumber(user_id) == tonumber(1313703081) then  
var = 'مطور السورس'
elseif DevMegae(user_id) == true then
var = "المطور الاساسي"  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = "البوت"
elseif database:sismember(bot_id.."DEV:Sudo:T", user_id) then  var = "االمطور الاساسي ²"  
elseif database:sismember(bot_id.."Mega:Sudo:User", user_id) then
var = database:get(bot_id.."Mega:Sudo:Rd"..chat_id) or "المطور"  
elseif database:sismember(bot_id.."creator"..chat_id,user_id) then var = "المالك"
elseif database:sismember(bot_id.."Mega:Basic:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."Mega:BasicConstructor:Rd"..chat_id) or "المنشئ الاساسي"
elseif database:sismember(bot_id.."Mega:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."Mega:Constructor:Rd"..chat_id) or "المنشئ"  
elseif database:sismember(bot_id.."Mega:Manager"..chat_id, user_id) then
var = database:get(bot_id.."Mega:Manager:Rd"..chat_id) or "المدير"  
elseif database:sismember(bot_id.."Mega:Mod:User"..chat_id, user_id) then
var = database:get(bot_id.."Mega:Mod:Rd"..chat_id) or "الادمن"  
elseif database:sismember(bot_id.."Mega:MN:TF"..chat_id, user_id) then
var =  "منظف"  
elseif database:sismember(bot_id.."Mega:Special:User"..chat_id, user_id) then  
var = database:get(bot_id.."Mega:Special:Rd"..chat_id) or "المميز"  
else  
var = database:get(bot_id.."Mega:Memp:Rd"..chat_id) or "العضو"
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember(bot_id.."Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."Mega:Muted:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."Mega:Ban:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function Ban_All_Groups(User_id) 
if database:sismember(bot_id.."Mega:GBan:User",User_id) then
Var = true
else
Var = false
end
return Var
end
function getcustom(msg,scc)
local var = "لايوجد"
Ge = https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..scc.sender_user_id_)
GeId = JSON.decode(Ge)
if GeId.result.custom_title then
var = GeId.result.custom_title
end
return var
end
function getbio(User)
local var = "لايوجد"
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchat?chat_id="..User)
data = json:decode(url)
if data.result.bio then
var = data.result.bio
end
return var
end
function send(chat_id, reply_to_message_id, text)
local text1 = database:get(bot_id..'Mega:new:sourse1') or '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
local text2 = database:get(bot_id..'Mega:new:sourse2') or '• '
text = string.gsub(text,"┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉",text1)
text = string.gsub(text,"• ",text2)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
function send1(chat_id, reply_to_message_id, text)
local text1 = database:get(bot_id..'Mega:new:sourse1') or '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
local text2 = database:get(bot_id..'Mega:new:sourse2') or '• '
text = string.gsub(text,"┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉",text1)
text = string.gsub(text,"• ",text2)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 0,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
function send2(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 0,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function DeleteMessage_(chat,id,func)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},func or dl_cb,nil)
end
function getInputFile(file) 
if file:match("/") then 
infile = {ID = "InputFileLocal", 
path_ = file} 
elseif file:match("^%d+$") then 
infile = {ID = "InputFileId", 
id_ = file} 
else infile = {ID = "InputFilePersistentId", 
persistent_id_ = file} 
end 
return infile 
end
function RestrictChat(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end

function sendin11(chat,msgid,user,user_id)
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user_id)
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
info = '{✅}' 
infoo = 'false' 
else 
info = '{❌}' 
infoo = 'true' 
end
if Json_Info.result.can_delete_messages == true then
delete = '{✅}' 
deletee = 'false' 
else 
delete = '{❌}' 
deletee = 'true' 
end
if Json_Info.result.can_invite_users == true then
invite = '{✅}' 
invitee = 'false' 
else 
invite = '{❌}' 
invitee = 'true' 
end
if Json_Info.result.can_pin_messages == true then
pin = '{✅}' 
pinn = 'false' 
else 
pin = '{❌}' 
pinn = 'true' 
end
if Json_Info.result.can_restrict_members == true then
restrict = '{✅}' 
restrictt = 'false' 
else 
restrict = '{❌}' 
restrictt = 'true' 
end
if Json_Info.result.can_promote_members == true then
promote = '{✅}' 
promotee = 'false' 
else 
promote = '{❌}' 
promotee = 'true' 
end 
if Json_Info.result.can_manage_voice_chats == true then
voice = '{✅}' 
voicee = 'false' 
else 
voice = '{❌}' 
voicee = 'true' 
end
if Json_Info.result.can_manage_chat == true then
manage = '{✅}' 
managee = 'false' 
else 
manage = '{❌}' 
managee = 'true' 
end

keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تغيير المعلومات '..info, callback_data='amr@'..user..'/user@'..user_id.."/chenginfo"..infoo},
},
{
{text = 'حذف الرسائل '..delete, callback_data='amr@'..user..'/user@'..user_id.."/delmsgg"..deletee},
},
{
{text = 'حظر المستخدمين '..restrict, callback_data='amr@'..user..'/user@'..user_id.."/banuser"..restrictt},
},
{
{text = 'اضافه مستخدمين '..invite, callback_data='amr@'..user..'/user@'..user_id.."/addlink"..invitee},
},
{
{text = 'تثبيت الرسائل '..pin, callback_data='amr@'..user..'/user@'..user_id.."/pinmsg"..pinn},
},
{
{text = 'اداره المكالمات '..voice, callback_data='amr@'..user..'/user@'..user_id.."/voice"..voicee},
},
{
{text = 'البقاء متخفي '..manage, callback_data='amr@'..user..'/user@'..user_id.."/manage"..managee},
},
{
{text = 'اضافه مشرفين '..promote, callback_data='amr@'..user..'/user@'..user_id.."/addadmin"..promotee},
},
}
local Texti = '*تم تعديل صلاحياته*'
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..chat..'&text='..URL.escape(Texti)..'&message_id='..msgid..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end

function SendMsg_Msgeeslist(status,chat_id,user_id,msg_id,text)
local msg_idd = msg_id/2097152/0.5
local listsudo = database:smembers(bot_id.."Mega:Sudo:User"..chat_id)
local listasa = database:smembers(bot_id.."Mega:Basic:Constructor"..chat_id)
local listmnsh = database:smembers(bot_id.."Mega:Constructor"..chat_id)
local listmder = database:smembers(bot_id.."Mega:Manager"..chat_id)
local listadmin = database:smembers(bot_id.."Mega:Mod:User"..chat_id)
local listvip = database:smembers(bot_id.."Mega:Special:User"..chat_id)
local listbans = database:smembers(bot_id.."Mega:GBan:User"..chat_id)
local listban = database:smembers(bot_id.."Mega:Ban:User"..chat_id)
local listktm = database:smembers(bot_id.."Mega:Muted:User"..chat_id)
local listcleanerr = database:smembers(bot_id.."Mega:MN:TF"..chat_id)
local listCmdd = database:smembers(bot_id.."Mega:List:Cmd:Group:New"..chat_id)
local listcreatorr = database:smembers(bot_id.."creator"..chat_id)
local listDevvrr = database:smembers(bot_id.."TSudo:User"..chat_id)
if status == "listsudo" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المطورين', callback_data=user_id.."/delsudos"},
},

}
elseif status == "listDevvrr" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح الثانويين', callback_data=user_id.."/delDevv"},
},

}
elseif status == "listcreatorr" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المالكين', callback_data=user_id.."/delcreatorr"},
},

}
elseif status == "listasa" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المنشئين الاساسيين', callback_data=user_id.."/delassaseen"},
},

}
elseif status == "listmnsh" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المنشئين', callback_data=user_id.."/delmnsh"},
},

}
elseif status == "listmder" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المدراء', callback_data=user_id.."/delmoder"},
},

}
elseif status == "listadmin" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح الادمنيه', callback_data=user_id.."/deladmin"},
},

}
elseif status == "listvip" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المميزين', callback_data=user_id.."/delvips"},
},

}
elseif status == "listcleanerr" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المنظفين', callback_data=user_id.."/delcleanerr"},
},

}
elseif status == "listCmdd" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح الاوامر المضافه', callback_data=user_id.."/delCmdd"},
},

}
elseif status == "listbans" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المحظورين عام', callback_data=user_id.."/delbanall"},
},

}
elseif status == "listban" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المحظورين', callback_data=user_id.."/delban"},
},

}
elseif status == "listktm" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• مسح المكتومين', callback_data=user_id.."/delktm"},
},

}
end
return https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text).."&reply_to_message_id="..msg_idd.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
function Edit_Msgees(status,chat_id,user_id,msg_id,text)
local msg_idd = msg_id/2097152/0.5
if status == "sendok" then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=user_id.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..chat_id..'&text='..URL.escape(text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
end

function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end
function SendV(chat_id,reply,voice,caption) 
SendVo = https.request("https://api.telegram.org/bot"..token.."/sendVoice?chat_id="..chat_id.."&voice="..URL.escape(voice).."&caption="..URL.escape(caption).."&reply_to_message_id"..reply.."&parse_mode=MARKDOWN")      
return SendVo
end 
function SendP(chat_id,reply,photo,caption) 
SendP = https.request("https://api.telegram.org/bot"..token.."/sendphoto?chat_id="..chat_id.."&photo="..URL.escape(photo).."&caption="..URL.escape(caption).."&reply_to_message_id"..reply.."&parse_mode=MARKDOWN")      
return SendP
end 
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url)  
end
function send_inline_keyboard(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local Status_Api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
Status_Api = Status_Api.."&reply_to_message_id="..reply_id 
end 
return Get_Api(Status_Api) 
end
answerInlineQuery = function (inline_query_id,getup)
var(getup)
Rep= "https://api.telegram.org/bot"..token.. '/answerInlineQuery?inline_query_id=' .. inline_query_id ..'&results=' .. URL.escape(JSON.encode(getup))..'&cache_time=' .. 1
return Get_Api(Rep)
end
sendPhotoURL = function(chat_id,ii, photo, caption,markdown)
if markdown == 'md' or markdown == 'markdown' then
ps = 'Markdown'
elseif markdown == 'html' then
ps = 'HTML'
end
local send = "https://api.telegram.org/bot"..token..'/sendPhoto'
local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "reply_to_message_id='..ii..'" -F "photo='..photo..'" -F "parse_mode='..ps..'" -F "caption='..caption..'"'
return io.popen(curl_command):read('*all')
end
sendvideoURL = function(chat_id,ii, video, caption,markdown)
if markdown == 'md' or markdown == 'markdown' then
ps = 'Markdown'
elseif markdown == 'html' then
ps = 'HTML'
end
local send = "https://api.telegram.org/bot"..token..'/sendVideo'
local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "reply_to_message_id='..ii..'" -F "video='..video..'" -F "parse_mode='..ps..'" -F "caption='..caption..'"'
return io.popen(curl_command):read('*all')
end
function send_inlin_key(chat_id,text,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function edit_inlin_key(chat_id,text,message_id,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..token.."/editMessageText?chat_id="..chat_id.."&text="..URL.escape(text)..'&message_id='..message_id.."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function send_inline_Media(chat_id,iny,x,cx,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..token.."/"..iny.."?chat_id="..chat_id.."&"..x.."="..cx.."&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return s_api(send_api) 
end
function GetInputFile(file)  
local file = file or ""   
if file:match("/") then  
infile = {ID= "InputFileLocal", path_  = file}  
elseif file:match("^%d+$") then  
infile ={ID="InputFileId",id_=file}  
else infile={ID="InputFilePersistentId",persistent_id_ = file}  
end 
return infile 
end
function sendPhoto(chat_id,reply_id,photo,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessagePhoto",
photo_ = GetInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption or ""
}
},func or dl_cb,nil)
end
	
function sendVoice(chat_id,reply_id,voice,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVoice",
voice_ = GetInputFile(voice),
duration_ = "",
waveform_ = "",
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendAnimation(chat_id,reply_id,animation,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAnimation",
animation_ = GetInputFile(animation),
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendAudio(chat_id,reply_id,audio,title,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAudio",
audio_ = GetInputFile(audio),
duration_ = "",
title_ = title or "",
performer_ = "سورس فيكتو الرسمي",
caption_ = caption or ""
}},func or dl_cb,nil)
end
function sendSticker(chat_id,reply_id,sticker,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageSticker",
sticker_ = GetInputFile(sticker),
width_ = 0,
height_ = 0
}},func or dl_cb,nil)
end
function tdcli_update_callback_value(Data) 
url = 'https://raw.githubusercontent.com/secMega/Mega/master/Mega.lua'
file_path = 'Mega.lua'
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'wb')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
------------------------------------------------------------------------------------------------------------ 
function tdcli_update_callback_value_(Data) 
tdcli_update_callback_value(Data) 
url = 'https://raw.githubusercontent.com/secMega/Mega/master/Mega.lua'
file_path = 'Mega.lua'
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function sendVideo(chat_id,reply_id,video,caption,func)
tdcli_function({ 
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 0,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVideo",  
video_ = GetInputFile(video),
added_sticker_file_ids_ = {},
duration_ = 0,
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end
function sendin(chat,msgid,user)
local Texti = '*\n• اعدادات المجموعه \n• علامة ال {✅} تعني مقفول\n• علامة ال {❌} تعني مفتوح*'
local mute_photo = (database:get(bot_id.."Mega:Lock:Photo"..chat) or '{❌}')
local mute_photo1 = mute_photo:gsub('del', '{✅}')
local mute_audio = (database:get(bot_id.."Mega:Lock:vico"..chat) or '{❌}')
local mute_audio1 = mute_audio:gsub('del', '{✅}')
local mute_voice = (database:get(bot_id.."Mega:Lock:Audio"..chat) or '{❌}')
local mute_voice1 = mute_voice:gsub('del', '{✅}')
local mute_forward = (database:get(bot_id.."Mega:Lock:forward"..chat) or '{❌}')
local mute_forward1 = mute_forward:gsub('del', '{✅}')
local mute_document = (database:get(bot_id.."Mega:Lock:Document"..chat) or '{❌}')
local mute_document1 = mute_document:gsub('del', '{✅}')
local mute_contact = (database:get(bot_id.."Mega:Lock:Contact"..chat) or '{❌}')
local mute_contact1 = mute_contact:gsub('del', '{✅}')
local lock_spam = (database:get(bot_id.."Mega:Lock:Spam"..chat) or '{❌}')
local lock_spam1 = lock_spam:gsub('del', '{✅}')
local lock_flood = (database:hget(bot_id.."Mega:flooding:settings:"..chat ,"flood") or '{❌}')
local lock_flood1 = lock_flood:gsub('del', '{✅}')
local mute_inline = (database:get(bot_id.."Mega:Lock:Inlen"..chat) or '{❌}')
local mute_inline1 = mute_inline:gsub('del', '{✅}')
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = URL.escape(mute_photo1) , callback_data="h"},{text = 'قفل الصور ', callback_data=user.."/mute_photo"},{text = 'فتح الصور', callback_data=user.."/unmute_photo"},
},
{
{text = URL.escape(mute_audio1) , callback_data="h"},{text = 'قفل الاغاني', callback_data=user.."/mute_voice"},{text = 'فتح الاغاني', callback_data=user.."/unmute_voice"},
},
{
{text = URL.escape(mute_voice1) , callback_data="h"},{text = 'قفل الصوت', callback_data=user.."/mute_audio"},{text = 'فتح الصوت', callback_data=user.."/unmute_audio"},
},
{
{text = URL.escape(mute_forward1) , callback_data="h"},{text = 'قفل التوجيه', callback_data=user.."/mute_forward"},{text = 'فتح التوجيه', callback_data=user.."/unmute_forward"},
},
{
{text = URL.escape(mute_document1) , callback_data="h"},{text = 'قفل الملفات', callback_data=user.."/mute_document"},{text = 'فتح الملفات', callback_data=user.."/unmute_document"},
},
{
{text = URL.escape(mute_contact1) , callback_data="h"},{text = 'قفل الجهات', callback_data=user.."/mute_contact"},{text = 'فتح الجهات', callback_data=user.."/unmute_contact"},
},
{
{text = URL.escape(lock_spam1) , callback_data="h"},{text = 'قفل الكلايش', callback_data=user.."/lock_spam"},{text = 'فتح الكلايش', callback_data=user.."/unlock_spam"},
},
{
{text = URL.escape(lock_flood1) , callback_data="h"},{text = 'قفل التكرار', callback_data=user.."/lock_flood"},{text = 'فتح التكرار', callback_data=user.."/unlock_flood"},
},
{
{text = URL.escape(mute_inline1) , callback_data="h"},{text = 'قفل الانلاين', callback_data=user.."/mute_inline"},{text = 'فتح الانلاين', callback_data=user.."/unmute_inline"},
},
{
{text = 'رجوع ...', callback_data=user.."/homelocks"},
},
{
{text = '• رجوع •', callback_data=user.."/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..chat..'&text='..URL.escape(Texti)..'&message_id='..msgid..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
function sendin1(chat,msgid,user)
local Texti = '*\n• اعدادات المجموعه \n• علامة ال {✅} تعني مقفول\n• علامة ال {❌} تعني مفتوح*'
local mute_text = (database:get(bot_id.."Mega:Lock:text"..chat)  or '{❌}')
local mute_text1 = mute_text:gsub('true', '{✅}')
local lock_bots = (database:get(bot_id.."Mega:Lock:Bot:kick"..chat) or '{❌}')
local lock_bots1 = lock_bots:gsub('kick', '{✅}')
local mute_tgservice = (database:get(bot_id.."Mega:Lock:tagservr"..chat) or '{❌}')
local mute_tgservice1 = mute_tgservice:gsub('true', '{✅}')
local lock_edit = (database:get(bot_id.."Mega:Lock:edit"..chat) or '{❌}')
local lock_edit1 = lock_edit:gsub('true', '{✅}')
local lock_link = (database:get(bot_id.."Mega:Lock:Link"..chat) or '{❌}')
local lock_link1 = lock_link:gsub('del', '{✅}')
local lock_username = (database:get(bot_id.."Mega:Lock:User:Name"..chat) or '{❌}')
local lock_username1 = lock_username:gsub('del', '{✅}')
local lock_tag = (database:get(bot_id.."Mega:Lock:hashtak"..chat) or '{❌}')
local lock_tag1 = lock_tag:gsub('del', '{✅}')
local mute_sticker = (database:get(bot_id.."Mega:Lock:Sticker"..chat) or '{❌}')
local mute_sticker1 = mute_sticker:gsub('del', '{✅}')
local mute_gif = (database:get(bot_id.."Mega:Lock:Animation"..chat) or '{❌}')
local mute_gif1 = mute_gif:gsub('del', '{✅}')
local mute_video = (database:get(bot_id.."Mega:Lock:Video"..chat) or '{❌}')
local mute_video1 = mute_video:gsub('del', '{✅}')
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = URL.escape(mute_text1) , callback_data="h"},{text = 'قفل الدردشه ', callback_data=user.."/mute_text"},{text = 'فتح الدردشه', callback_data=user.."/unmute_text"},
},
{
{text = URL.escape(lock_bots1) , callback_data="h"},{text = 'قفل البوتات', callback_data=user.."/lock_bots"},{text = 'فتح البوتات', callback_data=user.."/unlock_bots"},
},
{
{text = URL.escape(mute_tgservice1) , callback_data="h"},{text = 'قفل الاشعارات', callback_data=user.."/mute_tgservice"},{text = 'فتح الاشعارات', callback_data=user.."/unmute_tgservice"},
},
{
{text = URL.escape(lock_edit1) , callback_data="h"},{text = 'قفل التعديل', callback_data=user.."/lock_edit"},{text = 'فتح التعديل', callback_data=user.."/unlock_edit"},
},
{
{text = URL.escape(lock_link1) , callback_data="h"},{text = 'قفل الروابط', callback_data=user.."/lock_link"},{text = 'فتح الروابط', callback_data=user.."/unlock_link"},
},
{
{text = URL.escape(lock_username1) , callback_data="h"},{text = 'قفل المعرفات', callback_data=user.."/lock_username"},{text = 'فتح المعرفات', callback_data=user.."/unlock_username"},
},
{
{text = URL.escape(lock_tag1) , callback_data="h"},{text = 'قفل التاك', callback_data=user.."/lock_tag"},{text = 'فتح التاك', callback_data=user.."/unlock_tag"},
},
{
{text = URL.escape(mute_gif1) , callback_data="h"},{text = 'قفل المتحركه', callback_data=user.."/mute_gif"},{text = 'فتح المتحركه', callback_data=user.."/unmute_gif"},
},
{
{text = URL.escape(mute_sticker1) , callback_data="h"},{text = 'قفل الملصقات', callback_data=user.."/mute_sticker"},{text = 'فتح الملصقات', callback_data=user.."/unmute_sticker"},
},
{
{text = URL.escape(mute_video1) , callback_data="h"},{text = 'قفل الفيديو', callback_data=user.."/mute_video"},{text = 'فتح الفيديو', callback_data=user.."/unmute_video"},
},
{
{text = 'التالي ...', callback_data=user.."/homelocks1"},
},
{
{text = '• رجوع •', callback_data=user.."/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..chat..'&text='..URL.escape(Texti)..'&message_id='..msgid..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
function sendDocument(chat_id,reply_id,document,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageDocument",
document_ = GetInputFile(document),
caption_ = caption
}},func or dl_cb,nil)
end
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
function Kick_Group(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end

function AddChannel(User)
local var = true
if database:get(bot_id..'add:ch:id') then
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchatmember?chat_id="..database:get(bot_id..'add:ch:id').."&user_id="..User);
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false
end
end
return var
end


function Reply_Status(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "TeAm_VeCto")
local NameUser = "\n\n• بواسطه ↺["..data.first_name_.."](T.me/"..UserName..")"
local NameUserr = "\n\n• اسم الحات ↺["..data.first_name_.."](T.me/"..UserName..")"
if status == "lock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n• بخاصيه ( المسح )\n")
return false
end
if status == "lockktm" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n•  بخاصيه ( الكتم )\n")
return false
end
if status == "lockkick" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n• بخاصيه ( الطرد )\n")
return false
end
if status == "lockkid" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n• بخاصيه ( التقييد )\n")
return false
end
if status == "unlock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "reply" then
inlin = {{{text = '- اضغط هنا للحذف.',callback_data=msg.sender_user_id_..":cancelRd:del"}}, }
send_inlin_key(msg.chat_id_,NameUserr.."\n"..text,inlin,msg.id_)
return false
end
if status == "reply_Add" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
else
send(msg.chat_id_, msg.id_,"•  الحساب محذوف يرجى استخدام الامر بصوره صحيحه")
end
end,nil)   
end -- end
function Total_message(msgs)  
local message = ''  
if tonumber(msgs) < 100 then 
message = 'غير متفاعل' 
elseif tonumber(msgs) < 200 then 
message = 'بده يتحسن' 
elseif tonumber(msgs) < 400 then 
message = 'شبه متفاعل' 
elseif tonumber(msgs) < 700 then 
message = 'متفاعل' 
elseif tonumber(msgs) < 1200 then 
message = 'متفاعل قوي' 
elseif tonumber(msgs) < 2000 then 
message = 'متفاعل جدا' 
elseif tonumber(msgs) < 3500 then 
message = 'اقوى تفاعل'  
elseif tonumber(msgs) < 4000 then 
message = 'متفاعل نار' 
elseif tonumber(msgs) < 4500 then 
message = 'قمة التفاعل' 
elseif tonumber(msgs) < 5500 then 
message = 'اقوى متفاعل' 
elseif tonumber(msgs) < 7000 then 
message = 'ملك التفاعل' 
elseif tonumber(msgs) < 9500 then 
message = 'امبروطور التفاعل' 
elseif tonumber(msgs) < 10000000000 then 
message = 'رب التفاعل'  
end 
return message 
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function Addjpg(msg,chat,ID_FILE,File_Name)
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path,File_Name) 
sendPhoto(msg.chat_id_,msg.id_,'./'..File_Name,'تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..File_Name) 
end
function Addvoi(msg,chat,vi,ty)
local eq = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..vi)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eq.result.file_path,ty) 
sendVoice(msg.chat_id_, msg.id_,'./'..ty,"تم تحويل ال mp3 الى بصمه")
os.execute('rm -rf ./'..ty) 
end
function Addmp3(msg,chat,kkl,ffrr)
local eer = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..kkl)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eer.result.file_path,ffrr) 
sendAudio(msg.chat_id_,msg.id_,'./'..ffrr)  
os.execute('rm -rf ./'..ffrr) 
end
function Addsticker(msg,chat,Sd,rre)
local Qw = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..Sd)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..Qw.result.file_path,rre) 
sendSticker(msg.chat_id_,msg.id_,'./'..rre)
os.execute('rm -rf ./'..rre) 
end
function add_file(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
sendtext(chat,msg.id_,"• ملف النسخه الاحتياطيه ليس لهاذا البوت")   
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot' .. token .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_,"• جاري ...\n• رفع الملف الان")   
else
sendtext(chat,msg.id_,"*• عذرا الملف ليس بصيغة {JSON} يرجى رفع الملف الصحيح*")   
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
vardump(groups)  
for idg,v in pairs(groups.GP_BOT) do
database:sadd(bot_id..'Mega:Chek:Groups',idg) 
database:set(bot_id.."Mega:Lock:tagservrbot"..idg,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'Mega:'..lock..idg,"del")    
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
database:sadd(bot_id.."Mega:Constructor"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd(bot_id.."Mega:Manager"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd(bot_id.."Mega:Mod:User"..idg,idmod)  
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd(bot_id.."Mega:Basic:Constructor"..idg,idASAS)  
end;end
if v.linkgroup then
if v.linkgroup ~= "" then
database:set(bot_id.."Mega:Private:Group:Link"..idg,v.linkgroup)   
end;end;end
send(chat,msg.id_,"• تم رفع الملف بنجاح وتفعيل المجموعات\n• ورفع {الامنشئين الاساسين ; والمنشئين ; والمدراء; والادمنيه} بنجاح")   
end

function Is_Not_Spam(msg,type)
if type == "kick" then 
Reply_Status(msg,msg.sender_user_id_,"reply","• قام بالتكرار هنا وتم طرده")  
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
return false  
end 
if type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
return false
end 
if type == "keed" then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
Reply_Status(msg,msg.sender_user_id_,"reply","• قام بالتكرار هنا وتم تقييده")  
return false  
end  
if type == "mute" then
Reply_Status(msg,msg.sender_user_id_,"reply","• قام بالتكرار هنا وتم كتمه")  
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
return false  
end
end  
function files_Mega(msg)
for v in io.popen('ls files_Mega'):lines() do
if v:match(".lua$") then
plugin = dofile("files_Mega/"..v)
if plugin.Mega and msg then
pre_msg = plugin.Mega(msg)
end
end
end
send(msg.chat_id_, msg.id_,pre_msg)  
end
function Mega_Started_Bot(msg,data) -- بداية العمل
if msg then
local msg = data.message_
local text = msg.content_.text_
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
database:incr(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
database:sadd(bot_id..'Mega:UsersBot',msg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if database:get(bot_id.."Mega:Mega:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "• الغاء" then   
send(msg.chat_id_, msg.id_,"• تم الغاء الاذاعه") 
database:del(bot_id.."Mega:Mega:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."Mega:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
database:set(bot_id..'Mega:Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
database:set(bot_id..'Mega:Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
database:set(bot_id..'Mega:Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
database:set(bot_id..'Mega:Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_,"• تمت الاذاعه الى *~ "..#list.." ~* مجموعه ")     
database:del(bot_id.."Mega:Mega:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end


if not Vips(msg) and msg.content_.ID ~= "MessageChatAddMembers" and database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"flood") then 
floods = database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"flood") or "nil"
Num_Msg_Max = database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"floodmax") or 5
Time_Spam = database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(database:get(bot_id.."Mega:floodc:"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"flood") 
Is_Not_Spam(msg,type)  
end
database:setex(bot_id.."Mega:floodc:"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"floodmax") then
Num_Msg_Max = database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"floodmax") 
end
if database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"floodtime") then
Time_Spam = database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Mega:Lock:text"..msg.chat_id_) and not Vips(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
database:incr(bot_id.."Mega:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Vips(msg) then   
if database:get(bot_id.."Mega:Lock:AddMempar"..msg.chat_id_) == "kick" then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
Kick_Group(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Vips(msg) then 
if database:get(bot_id.."Mega:Lock:Join"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if not Vips(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not Vips(msg) then
if database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessagePhoto" and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Photo"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Photo"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Photo"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVideo" and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Video"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Video"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Video"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAnimation" and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Animation"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Animation"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Animation"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:geam"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:geam"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:geam"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAudio" and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Audio"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Audio"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Audio"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVoice" and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageSticker" and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Sticker"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Sticker"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Sticker"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."Mega:Lock:forward"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."Mega:Lock:forward"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."Mega:Lock:forward"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageDocument" and not Vips(msg) then     
if database:get(bot_id.."Mega:Lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Document"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Document"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Document"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Vips(msg) then      
if database:get(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Vips(msg) then
if database:get(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 

if tonumber(msg.via_bot_user_id_) ~= 0 and not Vips(msg) then
if database:get(bot_id.."Mega:Lock:Inlen"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Inlen"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Inlen"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Inlen"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end 


--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageContact" and not Vips(msg) then      
if database:get(bot_id.."Mega:Lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Contact"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Contact"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Contact"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Vips(msg) then  
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if database:get(bot_id.."Mega:Lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Mega:Lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
local status_welcome = database:get(bot_id.."Mega:Chek:Welcome"..msg.chat_id_)
if status_welcome and not database:get(bot_id.."Mega:Lock:tagservr"..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = database:get(bot_id.."Mega:Get:Welcome:Group"..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = "\n•  hello bro  \n•   name \n•  user" 
end 
t = t:gsub("name",result.first_name_) 
t = t:gsub("user",("@"..result.username_ or "لا يوجد")) 
send(msg.chat_id_, msg.id_,t)
end,nil) 
end 
end 
-------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" and not database:get(bot_id..'thebot') then 
if msg.content_.members_[0].id_ == tonumber(bot_id) then 
tdcli_function ({ID = "GetUser",user_id_ = bot_id,},function(arg,data) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = bot_id,offset_ = 0,limit_ = 1},function(extra,bo,success) 
local Te = "• هلا حات اني بوت حمايه كروبات\n• وضيفتي حماية القروبات من السبام والتفليش والخ...\n• لتفعيل البوت اضفني الى قروباتك قم برفعي مشرف ثم ارسل تفعيل"
if bo.photos_[0] then
x = {} 
x.inline_keyboard = {
{{text ="- اضفني ",url="https://t.me/"..data.username_.."?startgroup=new"}},
}
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&photo='..bo.photos_[0].sizes_[1].photo_.persistent_id_..'&caption='..URL.escape(Te)..'&message_id='..msg.id_..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(x)) 
else
send(msg.chat_id_, msg.id_,Te)
end
end,nil)
end,nil)
end
end
------------------------------------------------------
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(bot_id) then 
database:set(bot_id.."Mega:Pin:Id:Msg"..msg.chat_id_,msg.content_.message_id_)
else
local Msg_Pin = database:get(bot_id.."Mega:Pin:Id:Msg"..msg.chat_id_)
if Msg_Pin and database:get(bot_id.."Mega:lockpin"..msg.chat_id_) then
PinMessage(msg.chat_id_,Msg_Pin)
end
end
end
------------------------------------------------------
if msg.content_.photo_ then  
if database:get(bot_id.."Mega:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"• عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
database:del(bot_id.."Mega:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"• ليس لدي صلاحية تغيير معلومات القروب يرجى المحاوله لاحقا") 
database:del(bot_id.."Mega:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_,"• تم تغيير صورة القروب") 
end
end, nil) 
database:del(bot_id.."Mega:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Mega:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"• تم الغاء وضع الوصف") 
database:del(bot_id.."Mega:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
database:del(bot_id.."Mega:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request("https://api.telegram.org/bot"..token.."/setChatDescription?chat_id="..msg.chat_id_.."&description="..text) 
send(msg.chat_id_, msg.id_,"• تم تغيير وصف القروب")   
return false  
end 
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Mega:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"• تم الغاء حفظ الترحيب") 
database:del(bot_id.."Mega:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."Mega:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
database:set(bot_id.."Mega:Get:Welcome:Group"..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"• تم حفظ ترحيب القروب")   
return false   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Mega:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"• تم الغاء حفظ الرابط")       
database:del(bot_id.."Mega:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
database:set(bot_id.."Mega:Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_,"• تم حفظ الرابط بنجاح")       
database:del(bot_id.."Mega:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 

if database:get(bot_id.."Mega:Mega:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "• الغاء" then   
send(msg.chat_id_, msg.id_,"• تم الغاء الاذاعه للخاص") 
database:del(bot_id.."Mega:Mega:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'Mega:UsersBot')  
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"• تمت الاذاعه الى *~ "..#list.." ~* مشترك في الخاص ")     
database:del(bot_id.."Mega:Mega:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."Mega:Mega:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "• الغاء" then   
send(msg.chat_id_, msg.id_,"• تم الغاء الاذاعه") 
database:del(bot_id.."Mega:Mega:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."Mega:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"• تمت الاذاعه الى *~ "..#list.." ~* مجموعه ")     
database:del(bot_id.."Mega:Mega:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."Mega:Mega:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "• الغاء" then   
send(msg.chat_id_, msg.id_,"• تم الغاء الاذاعه") 
database:del(bot_id.."Mega:Mega:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."Mega:Chek:Groups")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"• تمت الاذاعه الى *~ "..#list.." ~* مجموعه ")     
database:del(bot_id.."Mega:Mega:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end
if database:get(bot_id.."Mega:Mega:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "• الغاء" then   
send(msg.chat_id_, msg.id_,"• تم الغاء الاذاعه") 
database:del(bot_id.."Mega:Mega:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."Mega:UsersBot")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"• تمت الاذاعه الى *~ "..#list.." ~* مشترك في الخاص ")     
database:del(bot_id.."Mega:Mega:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end

--------------------------------------------------------------------------------------------------------------
if text and not Vips(msg) then  
local Mega_Msg = database:sismember(bot_id.."Mega:List:Filter:text"..msg.chat_id_,text) 
if Mega_Msg then    
Reply_Status(msg,msg.sender_user_id_,"reply","• الكلمه ممنوعه من القروب")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if msg.content_.ID == 'MessageAnimation' and not Vips(msg) then      
local geAni = database:sismember(bot_id.."Mega:List:Filter:Animation"..msg.chat_id_,msg.content_.animation_.animation_.persistent_id_) 
if geAni then        
Reply_Status(msg,msg.sender_user_id_,"reply","• المتحركه ممنوعه من القروب")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if msg.content_.ID == 'MessageSticker' and not Vips(msg) then      
local ker = database:sismember(bot_id.."Mega:List:Filter:Sticker"..msg.chat_id_,msg.content_.sticker_.sticker_.persistent_id_) 
if ker then        
Reply_Status(msg,msg.sender_user_id_,"reply","• الملصق ممنوع من القروب")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if msg.content_.ID == 'MessagePhoto' and not Vips(msg) then      
local phh = database:sismember(bot_id.."Mega:List:Filter:Photo"..msg.chat_id_,msg.content_.photo_.sizes_[1].photo_.persistent_id_) 
if phh then        
Reply_Status(msg,msg.sender_user_id_,"reply","• الصوره ممنوعه من القروب")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if database:get(bot_id.."Mega:Set:Name:Bot"..msg.sender_user_id_) then 
if text == "الغاء" or text == "• الغاء" then   
send(msg.chat_id_, msg.id_,"•  تم الغاء حفظ اسم البوت") 
database:del(bot_id.."Mega:Set:Name:Bot"..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."Mega:Set:Name:Bot"..msg.sender_user_id_) 
database:set(bot_id.."Mega:Name:Bot",text) 
send(msg.chat_id_, msg.id_, "•  تم حفظ اسم البوت")  
return false
end 
if text and database:get(bot_id.."Mega:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
database:set(bot_id.."Mega:Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"• ارسل الامر الجديد")  
database:del(bot_id.."Mega:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
database:set(bot_id.."Mega:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and database:get(bot_id.."Mega:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = database:get(bot_id.."Mega:Set:Cmd:Group:New"..msg.chat_id_)
database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"• تم حفظ الامر")  
database:del(bot_id.."Mega:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' then
if ChekAdd(msg.chat_id_) == true then
if text == "قفل الدردشه" and msg.reply_to_message_id_ == 0 and Owner(msg) then  
database:set(bot_id.."Mega:Lock:text"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الدردشه")  
return false
end 
if text == "قفل الاضافه" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."Mega:Lock:AddMempar"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل اضافة الاعضاء")  
return false
end 
if text == "قفل الدخول" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."Mega:Lock:Join"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل دخول الاعضاء")  
return false
end 
if text == "قفل البوتات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل البوتات")  
return false
end 
if text == "قفل البوتات بالطرد" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل البوتات")  
return false
end 
if text == "قفل الاشعارات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
database:set(bot_id.."Mega:Lock:tagservr"..msg.chat_id_,true)  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الاشعارات")  
return false
end 
if text == "قفل التثبيت" and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
database:set(bot_id.."Mega:lockpin"..msg.chat_id_, true) 
database:sadd(bot_id.."Mega:Lock:pin",msg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  database:set(bot_id.."Mega:Pin:Id:Msg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل التثبيت هنا")  
return false
end 
if text == "قفل التعديل" and msg.reply_to_message_id_ == 0 and Constructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:set(bot_id.."Mega:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل تعديل")  
return false
end 
if text == "قفل تعديل الميديا" and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
database:set(bot_id.."Mega:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل تعديل")  
return false
end 
if text == "قفل الكل" and msg.reply_to_message_id_ == 0 and Constructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end  
database:set(bot_id.."Mega:Lock:tagservrbot"..msg.chat_id_,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'Mega:'..lock..msg.chat_id_,"del")    
end
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل جميع الاوامر")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."Mega:Lock:AddMempar"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح اضافة الاعضاء")  
return false
end 
if text == "فتح الدردشه" and msg.reply_to_message_id_ == 0 and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."Mega:Lock:text"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الدردشه")  
return false
end 
if text == "فتح الدخول" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."Mega:Lock:Join"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح دخول الاعضاء")  
return false
end 
if text == "فتح البوتات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فـتح البوتات")  
return false
end 
if text == "فتح البوتات " and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","🍃\n• تم فـتح البوتات")  
return false
end 
if text == "فتح الاشعارات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end  
database:del(bot_id.."Mega:Lock:tagservr"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فـتح الاشعارات")  
return false
end 
if text == "فتح التثبيت" and msg.reply_to_message_id_ == 0 and Constructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."Mega:lockpin"..msg.chat_id_)  
database:srem(bot_id.."Mega:Lock:pin",msg.chat_id_)
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فـتح التثبيت هنا")  
return false
end 
if text == "فتح التعديل" and msg.reply_to_message_id_ == 0 and Constructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."Mega:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فـتح تعديل")  
return false
end 
if text == "فتح التعديل الميديا" and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
database:del(bot_id.."Mega:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فـتح تعديل")  
return false
end 
if text == "فتح الكل" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."Mega:Lock:tagservrbot"..msg.chat_id_)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..'Mega:'..lock..msg.chat_id_)    
end
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فـتح جميع الاوامر")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل الروابط" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Lock:Link"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الروابط")  
return false
end 
if text == "قفل الروابط بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Link"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الروابط")  
return false
end 
if text == "قفل الروابط بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Link"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الروابط")  
return false
end 
if text == "قفل الروابط بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Link"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الروابط")  
return false
end 
if text == "فتح الروابط" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:Link"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الروابط")  
return false
end 
if text == "قفل المعرفات" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Lock:User:Name"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل المعرفات")  
return false
end 
if text == "قفل المعرفات بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:User:Name"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل المعرفات")  
return false
end 
if text == "قفل المعرفات بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:User:Name"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل المعرفات")  
return false
end 
if text == "قفل المعرفات بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:User:Name"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل المعرفات")  
return false
end 
if text == "فتح المعرفات" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:User:Name"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح المعرفات")  
return false
end 
if text == "قفل التاك" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Lock:hashtak"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل التاك")  
return false
end 
if text == "قفل التاك بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:hashtak"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل التاك")  
return false
end 
if text == "قفل التاك بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:hashtak"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل التاك")  
return false
end 
if text == "قفل التاك بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:hashtak"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل التاك")  
return false
end 
if text == "فتح التاك" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:hashtak"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح التاك")  
return false
end 
if text == "قفل الشارحه" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Cmd"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الشارحه")  
return false
end 
if text == "قفل الشارحه بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Cmd"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الشارحه")  
return false
end 
if text == "قفل الشارحه بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Cmd"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الشارحه")  
return false
end 
if text == "قفل الشارحه بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Cmd"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الشارحه")  
return false
end 
if text == "فتح الشارحه" and Addictive(msg) then
database:del(bot_id.."Mega:Lock:Cmd"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الشارحه")  
return false
end 
if text == "قفل الصور"and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Photo"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الصور")  
return false
end 
if text == "قفل الاباحي"and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Xn"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الاباحي")  
return false
end 
if text == "قفل الصور بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Photo"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الصور")  
return false
end 
if text == "قفل الصور بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Photo"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الصور")  
return false
end 
if text == "قفل الصور بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Photo"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الصور")  
return false
end 
if text == "فتح الصور" and Addictive(msg) then
database:del(bot_id.."Mega:Lock:Photo"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الصور")  
return false
end 
if text == "فتح الاباحي" and Addictive(msg) then
database:del(bot_id.."Mega:Lock:Xn"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الاباحي")  
return false
end 
if text == "قفل الفيديو" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Video"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الفيديو")  
return false
end 
if text == "قفل الفيديو بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Video"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الفيديو")  
return false
end 
if text == "قفل الفيديو بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Video"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الفيديو")  
return false
end 
if text == "قفل الفيديو بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Video"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الفيديو")  
return false
end 
if text == "فتح الفيديو" and Addictive(msg) then
database:del(bot_id.."Mega:Lock:Video"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الفيديو")  
return false
end 
if text == "قفل المتحركه" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Lock:Animation"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل المتحركه")  
return false
end
if text == "قفل المتحركه بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Animation"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل المتحركه")  
return false
end 
if text == "قفل المتحركه بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Animation"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل المتحركه")  
return false
end 
if text == "قفل المتحركه بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Animation"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل المتحركه")  
return false
end 
if text == "فتح المتحركه" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:Animation"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح المتحركه")  
return false
end 
if text == "قفل الالعاب" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Lock:geam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الالعاب")  
return false
end 
if text == "قفل الالعاب بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:geam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الالعاب")  
return false
end 
if text == "قفل الالعاب بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:geam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الالعاب")  
return false
end 
if text == "قفل الالعاب بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:geam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الالعاب")  
return false
end 
if text == "فتح الالعاب" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:geam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الالعاب")  
return false
end 
if text == "قفل الاغاني" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Audio"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الاغاني")  
return false
end 
if text == "قفل الاغاني بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Audio"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الاغاني")  
return false
end 
if text == "قفل الاغاني بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Audio"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الاغاني")  
return false
end 
if text == "قفل الاغاني بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Audio"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الاغاني")  
return false
end 
if text == "فتح الاغاني" and Addictive(msg) then
database:del(bot_id.."Mega:Lock:Audio"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الاغاني")  
return false
end 
if text == "قفل الصوت" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:vico"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الصوت")  
return false
end 
if text == "قفل الصوت بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:vico"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الصوت")  
return false
end 
if text == "قفل الصوت بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:vico"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الصوت")  
return false
end 
if text == "قفل الصوت بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:vico"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الصوت")  
return false
end 
if text == "فتح الصوت" and Addictive(msg) then
database:del(bot_id.."Mega:Lock:vico"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الصوت")  
return false
end 
if text == "قفل الكيبورد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الكيبورد")  
return false
end 
if text == "قفل الكيبورد بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الكيبورد")  
return false
end 
if text == "قفل الكيبورد بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الكيبورد")  
return false
end 
if text == "قفل الكيبورد بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الكيبورد")  
return false
end 
if text == "فتح الكيبورد" and Addictive(msg) then
database:del(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الكيبورد")  
return false
end 
if text == "قفل الملصقات" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Lock:Sticker"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الملصقات")  
return false
end 
if text == "قفل الملصقات بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Sticker"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الملصقات")  
return false
end 
if text == "قفل الملصقات بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Sticker"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الملصقات")  
return false
end 
if text == "قفل الملصقات بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Sticker"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الملصقات")  
return false
end 
if text == "فتح الملصقات" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:Sticker"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الملصقات")  
return false
end 
if text == "قفل التوجيه" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Lock:forward"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل التوجيه")  
return false
end 
if text == "قفل التوجيه بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:forward"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل التوجيه")  
return false
end 
if text == "قفل التوجيه بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:forward"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل التوجيه")  
return false
end 
if text == "قفل التوجيه بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:forward"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل التوجيه")  
return false
end 
if text == "فتح التوجيه" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:forward"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح التوجيه")  
return false
end 
if text == "قفل الملفات" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Document"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الملفات")  
return false
end 
if text == "قفل الملفات بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Document"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الملفات")  
return false
end 
if text == "قفل الملفات بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Document"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الملفات")  
return false
end 
if text == "قفل الملفات بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Document"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الملفات")  
return false
end 
if text == "فتح الملفات" and Addictive(msg) then
database:del(bot_id.."Mega:Lock:Document"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الملفات")  
return false
end 
if text == "قفل السيلفي" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل السيلفي")  
return false
end 
if text == "قفل السيلفي بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل السيلفي")  
return false
end 
if text == "قفل السيلفي بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل السيلفي")  
return false
end 
if text == "قفل السيلفي بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل السيلفي")  
return false
end 
if text == "فتح السيلفي" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح السيلفي")  
return false
end 
if text == "قفل الماركداون" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الماركداون")  
return false
end 
if text == "قفل الماركداون بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الماركداون")  
return false
end 
if text == "قفل الماركداون بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الماركداون")  
return false
end 
if text == "قفل الماركداون بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الماركداون")  
return false
end 
if text == "فتح الماركداون" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الماركداون")  
return false
end 
if text == "قفل الجهات" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Contact"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الجهات")  
return false
end 
if text == "قفل الجهات بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Contact"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الجهات")  
return false
end 
if text == "قفل الجهات بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Contact"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الجهات")  
return false
end 
if text == "قفل الجهات بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Contact"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الجهات")  
return false
end 
if text == "فتح الجهات" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:Contact"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الجهات")  
return false
end 
if text == "قفل الكلايش" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Spam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الكلايش")  
return false
end 
if text == "قفل الكلايش بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Spam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الكلايش")  
return false
end 
if text == "قفل الكلايش بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Spam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الكلايش")  
return false
end 
if text == "قفل الكلايش بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Spam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الكلايش")  
return false
end 
if text == "فتح الكلايش" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Lock:Spam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الكلايش")  
return false
end 
if text == "قفل الانلاين" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Inlen"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الانلاين")  
return false
end 
if text == "قفل الانلاين بالتقيد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Inlen"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفـل الانلاين")  
return false
end 
if text == "قفل الانلاين بالكتم" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Inlen"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفـل الانلاين")  
return false
end 
if text == "قفل الانلاين بالطرد" and Addictive(msg) then
database:set(bot_id.."Mega:Lock:Inlen"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفـل الانلاين")  
return false
end 
if text == "فتح الانلاين" and Addictive(msg) then
database:del(bot_id.."Mega:Lock:Inlen"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح الانلاين")  
return false
end 
if text == "قفل التكرار بالطرد" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hset(bot_id.."Mega:flooding:settings:"..msg.chat_id_ ,"flood","kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","• تم قفل التكرار")
return false
end 
if text == "قفل التكرار" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hset(bot_id.."Mega:flooding:settings:"..msg.chat_id_ ,"flood","del")  
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفل التكرار بالحذف")
return false
end 
if text == "قفل التكرار بالتقيد" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hset(bot_id.."Mega:flooding:settings:"..msg.chat_id_ ,"flood","keed")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","• تم قفل التكرار")
return false
end 
if text == "قفل التكرار بالكتم" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hset(bot_id.."Mega:flooding:settings:"..msg.chat_id_ ,"flood","mute")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","• تم قفل التكرار")
return false
end 
if text == "فتح التكرار" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hdel(bot_id.."Mega:flooding:settings:"..msg.chat_id_ ,"flood")  
Reply_Status(msg,msg.sender_user_id_,"unlock","• تم فتح التكرار")
return false
end 
if text == ("اضف مطور ثانوي") and tonumber(msg.reply_to_message_id_) ~= 0 and VIP_DeV(msg) then
function Function_Mega(extra, result, success)
database:sadd(bot_id.."DEV:Sudo:T", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم رفعه مطور ثانوي في البوت")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false 
end
if text and text:match("^اضف مطور ثانوي @(.*)$") and VIP_DeV(msg) then
local username = text:match("^اضف مطور ثانوي @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."DEV:Sudo:T", result.id_)
Reply_Status(msg,result.id_,"reply","• تم رفعه مطور ثانوي في البوت")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false 
end
if text and text:match("^اضف مطور ثانوي (%d+)$") and VIP_DeV(msg) then
local userid = text:match("^اضف مطور ثانوي (%d+)$")
database:sadd(bot_id.."DEV:Sudo:T", userid)
Reply_Status(msg,userid,"reply","• تم رفعه مطور ثانوي في البوت")  
return false 
end
if text == ("حذف مطور ثانوي") and tonumber(msg.reply_to_message_id_) ~= 0 and VIP_DeV(msg) then
function Function_Mega(extra, result, success)
database:srem(bot_id.."DEV:Sudo:T", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تنزيله من المطور ثانويين")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false 
end
if text and text:match("^حذف مطور ثانوي @(.*)$") and VIP_DeV(msg) then
local username = text:match("^حذف مطور ثانوي @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."DEV:Sudo:T", result.id_)
Reply_Status(msg,result.id_,"reply","• تم تنزيله من المطور ثانويين")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end  
if text and text:match("^حذف مطور ثانوي (%d+)$") and VIP_DeV(msg) then
local userid = text:match("^حذف مطور ثانوي (%d+)$")
database:srem(bot_id.."DEV:Sudo:T", userid)
Reply_Status(msg,userid,"reply","• تم تنزيله من المطور ثانويين")  
return false 
end
if text == ("الثانويين") and DevMega(msg) then
local list = database:smembers(bot_id.."DEV:Sudo:T")
t = "\n*• قائمة مطورين الثانويين للبوت *\n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*• لا يوجد مطورين ثانويين*"
return send(msg.chat_id_, msg.id_, t)
end
return SendMsg_Msgeeslist("listDevvrr",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end
if text == ("مسح الثانويين") and VIP_DeV(msg) then
database:del(bot_id.."DEV:Sudo:T")
send(msg.chat_id_, msg.id_, "\n*•  تم مسح الثانويين*  ")
end
if text == ("مسح العام") and DevMega(msg) then
database:del(bot_id.."Mega:GBan:User")
send(msg.chat_id_, msg.id_, "*\n•تم مسح العام*")
return false
end
if text == ("مسح المطورين") and DevMega(msg) then
database:del(bot_id.."Mega:Sudo:User")
send(msg.chat_id_, msg.id_, "\n•  تم مسح المطورين  ")
end
if text == "مسح المنشئين الاساسين" and DevBot(msg) then
database:del(bot_id.."Mega:Basic:Constructor"..msg.chat_id_)
texts = "•  تم مسح المنشئين الاساسيين"
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المنشئين" and BasicConstructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Constructor"..msg.chat_id_)
texts = "•  تم مسح المنشئين "
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المدراء" and Constructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Manager"..msg.chat_id_)
texts = "•  تم مسح المدراء "
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح الادمنيه" and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Mod:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "•  تم مسح  قائمة الادمنية  ")
end
if text == "مسح المميزين" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Special:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "•  تم مسح  قائمة الاعضاء المميزين  ")
end
if text == "مسح المكتومين" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Muted:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "•  تم مسح قائمه المكتومين ")
end
if text == "مسح المحظورين" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Ban:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "\n• تم مسح المحظورين")
end
if text == ("قائمه العام") and DevMega(msg) then
local list = database:smembers(bot_id.."Mega:GBan:User")
t = "\n• قائمة المحظورين عام \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
return send(msg.chat_id_, msg.id_, "• لا يوجد محظورين عام")
end
return SendMsg_Msgeeslist("listbans",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end
if text == ("المطورين") and DevMega(msg) then
local list = database:smembers(bot_id.."Mega:Sudo:User")
t = "\n• قائمة مطورين البوت \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*• لا يوجد مطورين*"
return send(msg.chat_id_, msg.id_, t)
end
return SendMsg_Msgeeslist("listsudo",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end
if text == "المنشئين الاساسين" and DevBot(msg) then
local list = database:smembers(bot_id.."Mega:Basic:Constructor"..msg.chat_id_)
t = "\n• قائمة المنشئين الاساسين \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد منشئين اساسيين"
return send(msg.chat_id_, msg.id_, t)
end
return SendMsg_Msgeeslist("listasa",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end
if text == ("المنشئين") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
local list = database:smembers(bot_id.."Mega:Constructor"..msg.chat_id_)
t = "\n• قائمة المنشئين \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد منشئين"
return send(msg.chat_id_, msg.id_, t)
end
return SendMsg_Msgeeslist("listmnsh",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end
if text == ("المدراء") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
local list = database:smembers(bot_id.."Mega:Manager"..msg.chat_id_)
t = "\n• قائمة المدراء \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد مدراء"
return send(msg.chat_id_, msg.id_, t)
end
return SendMsg_Msgeeslist("listmder",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end
if text == ("الادمنيه") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
local list = database:smembers(bot_id.."Mega:Mod:User"..msg.chat_id_)
t = "\n• قائمة الادمنيه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد ادمنيه"
return send(msg.chat_id_, msg.id_, t)
end
return SendMsg_Msgeeslist("listadmin",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end
if text == ("المميزين") and Addictive(msg) then
local list = database:smembers(bot_id.."Mega:Special:User"..msg.chat_id_)
t = "*\n• قائمة مميزين المجموعه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n*"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*• لا يوجد مميزين*"
return send(msg.chat_id_, msg.id_, t)
end
return SendMsg_Msgeeslist("listvip",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end
if text == ("المكتومين") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
local list = database:smembers(bot_id.."Mega:Muted:User"..msg.chat_id_)
t = "\n• قائمة المكتومين \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد مكتومين"
return send(msg.chat_id_, msg.id_, t)
end
return SendMsg_Msgeeslist("listktm",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end

if text == ("المحظورين") then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
local list = database:smembers(bot_id.."Mega:Ban:User"..msg.chat_id_)
t = "\n• قائمة محظورين المجموعه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد محظورين"
return send(msg.chat_id_, msg.id_, t)
end
return SendMsg_Msgeeslist("listban",msg.chat_id_,msg.sender_user_id_,msg.id_, t)
end 

if text == ("حظر عام") and tonumber(msg.reply_to_message_id_) ~= 0 and DevMega(msg) then
function Function_Mega(extra, result, success)
if General_ban(result, result.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
database:sadd(bot_id.."Mega:GBan:User", result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم حظره عام من المجموعات")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^حظر عام @(.*)$")  and DevMega(msg) then
local username = text:match("^حظر عام @(.*)$") 
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if result.id_ == tonumber(1313703081) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور السورس \n")
return false 
end

if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع حظر البوت عام")
return false 
end
database:sadd(bot_id.."Mega:GBan:User", result.id_)
Reply_Status(msg,result.id_,"reply","• تم حظره عام من المجموعات")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^حظر عام (%d+)$") and DevMega(msg) then
local userid = text:match("^حظر عام (%d+)$")
if userid == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور البوت الاساسي \n")
return false 
end
if userid == tonumber(1313703081) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور السورس \n")
return false 
end

if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع حظر البوت عام")
return false 
end
database:sadd(bot_id.."Mega:GBan:User", userid)
Reply_Status(msg,userid,"reply","• تم حظره عام من المجموعات")  
return false
end
if text == ("الغاء العام") and msg.reply_to_message_id_ and DevMega(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'  *• عذࢪا عليڪ الاشتࢪاڪ في قناه البوت* \n*• اشتࢪڪ هنا عمࢪي* ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n *• اسم الحات ↺* ['..data.first_name_..'](t.me/'..(data.username_ or 'TeAm_VeCto')..')'
status  = '\n*• تم الغاء (الحظر-الكتم) عام من الكروبات*'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
database:srem(bot_id..'GBan:User', result.sender_user_id_)
database:srem(bot_id..'Gmute:User', result.sender_user_id_)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^الغاء العام @(.*)$") and DevMega(msg) then
local username = text:match("^الغاء العام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'  *• عذࢪا عليڪ الاشتࢪاڪ في قناه البوت* \n*• اشتࢪڪ هنا عمࢪي* ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
usertext = '\n *• اسم الحات ↺* ['..result.title_..'](t.me/'..(username or 'TeAm_VeCto')..')'
status  = '\n*• تم الغاء (الحظر-الكتم) عام من الكروبات*'
texts = usertext..status
database:srem(bot_id..'GBan:User', result.id_)
database:srem(bot_id..'Gmute:User', result.id_)
else
texts = ' *• لا يوجد حساب بهاذا المعرف*'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^الغاء العام (%d+)$") and DevMega(msg) then
local userid = text:match("^الغاء العام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'  *• عذࢪا عليڪ الاشتࢪاڪ في قناه البوت* \n*• اشتࢪڪ هنا عمࢪي* ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'GBan:User', userid)
database:srem(bot_id..'Gmute:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n *• اسم الحات ↺* ['..data.first_name_..'](t.me/'..(data.username_ or 'TeAm_VeCto')..')'
status  = '\n*• تم الغاء (الحظر-الكتم) عام من الكروبات*'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n *• اسم الحات ↺* '..userid..''
status  = '\n*• تم حظره عام من الكروبات*'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if text == ("اضف مطور") and tonumber(msg.reply_to_message_id_) ~= 0 and DevMega(msg) then
function Function_Mega(extra, result, success)
database:sadd(bot_id.."Mega:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم رفعه مطور في البوت")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false 
end
if text and text:match("^اضف مطور @(.*)$") and DevMega(msg) then
local username = text:match("^اضف مطور @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Mega:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","• تم رفعه مطور في البوت")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false 
end
if text and text:match("^اضف مطور (%d+)$") and DevMega(msg) then
local userid = text:match("^اضف مطور (%d+)$")
database:sadd(bot_id.."Mega:Sudo:User", userid)
Reply_Status(msg,userid,"reply","• تم رفعه مطور في البوت")  
return false 
end
if text == ("حذف مطور") and tonumber(msg.reply_to_message_id_) ~= 0 and DevMega(msg) then
function Function_Mega(extra, result, success)
database:srem(bot_id.."Mega:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تنزيله من المطورين")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false 
end
if text and text:match("^حذف مطور @(.*)$") and DevMega(msg) then
local username = text:match("^حذف مطور @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."Mega:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","• تم تنزيله من المطورين")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end  
if text and text:match("^حذف مطور (%d+)$") and DevMega(msg) then
local userid = text:match("^حذف مطور (%d+)$")
database:srem(bot_id.."Mega:Sudo:User", userid)
Reply_Status(msg,userid,"reply","• تم تنزيله من المطورين")  
return false 
end

if text == "المالكين" and DevBot(msg) then
local list = database:smembers(bot_id.."creator"..msg.chat_id_)
t = "\n• قائمة مالكين القروب \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."User:Name" .. v)
if username then
t = t..""..k.."↬•  [@"..username.."]\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*• لا يوجد مالكين*"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == "مسح قائمه المالكين" and DevBot(msg) then
database:del(bot_id.."creator"..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
send(msg.chat_id_, msg.id_, "*• تم مسح المالكين*")
end
if text == ("رفع مالك") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then  
function Function_Mega(extra, result, success)
database:sadd(bot_id.."creator"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم ترقيته مالك")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^رفع مالك @(.*)$") and DevBot(msg) then  
local username = text:match("^رفع مالك @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."creator"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم ترقيته مالك")  
else
send(msg.chat_id_, msg.id_,"*• لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^رفع مالك (%d+)$") and DevBot(msg) then  
local userid = text:match("^رفع مالك (%d+)$") 
database:sadd(bot_id.."creator"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم ترقيته مالك")  
return false
end
if text == ("تنزيل مالك") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then  
function Function_Mega(extra, result, success)
database:srem(bot_id.."creator"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*• تم تنزيله من المالكين*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل مالك @(.*)$") and DevBot(msg) then  
local username = text:match("^تنزيل مالك @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."creator"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم تنزيله من المالكين")  
else
send(msg.chat_id_, msg.id_,"*• لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل مالك (%d+)$") and DevBot(msg) then  
local userid = text:match("^تنزيل مالك (%d+)$") 
database:srem(bot_id.."creator"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*• تم تنزيله من المالكين*")  
return false
end
if text == ("رفع منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
database:sadd(bot_id.."Mega:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم رفعه منشئ اساسي")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^رفع منشئ اساسي @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Mega:Basic:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","??︙تم رفعه منشئ اساسي")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
database:sadd(bot_id.."Mega:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم رفعه منشئ اساسي")  
return false
end
if text == ("تنزيل منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تنزيله من المنشئين")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_, result.id_)

Reply_Status(msg,result.id_,"reply","• تم تنزيله من المنشئين")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم تنزيله من المنشئين")  
return false
end
if text == "رفع منشئ" and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
database:sadd(bot_id.."Mega:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم رفعه منشئ في القروب")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
end
if text and text:match("^رفع منشئ @(.*)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^رفع منشئ @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Mega:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم رفعه منشئ في القروب")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^رفع منشئ (%d+)$")
database:sadd(bot_id.."Mega:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم رفعه منشئ في القروب")  
end
if text and text:match("^تنزيل منشئ$") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then
function Function_Mega(extra, result, success)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تنزيله من المنشئين")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^تنزيل منشئ @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم تنزيله من المنشئين")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^تنزيل منشئ (%d+)$")
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم تنزيله من المنشئين")  
end

if text == ("رفع مدير") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
database:sadd(bot_id.."Mega:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم رفعه مدير القروب")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end  
if text and text:match("^رفع مدير @(.*)$") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^رفع مدير @(.*)$") 
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Mega:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم رفعه مدير القروب")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end 

if text and text:match("^رفع مدير (%d+)$") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^رفع مدير (%d+)$") 
database:sadd(bot_id.."Mega:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم رفعه مدير القروب")  
return false
end  
if text == ("تنزيل مدير") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تنزيله من المدراء")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^تنزيل مدير @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم تنزيله من المدراء")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^تنزيل مدير (%d+)$") 
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم تنزيله من المدراء")  
return false
end

if text == ("رفع ادمن") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لا تستطيع رفع احد وذالك لان تم تعطيل الرفع من قبل المنشئين')
return false
end
function Function_Mega(extra, result, success)
database:sadd(bot_id.."Mega:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم رفعه ادمن للقروب")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^رفع ادمن @(.*)$") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^رفع ادمن @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لا تستطيع رفع احد وذالك لان تم تعطيل الرفع من قبل المنشئين')
return false
end
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Mega:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم رفعه ادمن للقروب")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^رفع ادمن (%d+)$") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^رفع ادمن (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لا تستطيع رفع احد وذالك لان تم تعطيل الرفع من قبل المنشئين')
return false
end
database:sadd(bot_id.."Mega:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم رفعه ادمن للقروب")  
return false
end
if text == ("تنزيل ادمن") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تنزيله من ادمنيه القروب")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^تنزيل ادمن @(.*)$") 
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم تنزيله من ادمنيه القروب")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^تنزيل ادمن (%d+)$")
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم تنزيله من ادمنيه القروب")  
return false
end

if text == ("رفع مميز") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لا تستطيع رفع احد وذالك لان تم تعطيل الرفع من قبل المنشئين')
return false
end
function Function_Mega(extra, result, success)
database:sadd(bot_id.."Mega:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم رفعه مميز للقروب")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^رفع مميز @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^رفع مميز @(.*)$") 
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لا تستطيع رفع احد وذالك لان تم تعطيل الرفع من قبل المنشئين')
return false
end
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Mega:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم رفعه مميز للقروب")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end

if text and text:match("^رفع مميز (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^رفع مميز (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لا تستطيع رفع احد وذالك لان تم تعطيل الرفع من قبل المنشئين')
return false
end
database:sadd(bot_id.."Mega:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم رفعه مميز للقروب")  
return false
end

if (text == ("تنزيل مميز")) and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تنزيله من المميزين")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل مميز @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^تنزيل مميز @(.*)$") 
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم تنزيله من المميزين")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل مميز (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^تنزيل مميز (%d+)$") 
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم تنزيله من المميزين")  
return false
end  
if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg)then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local RTPA = text:match("رفع (.*)")
if database:sismember(bot_id.."Mega:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local Megart = database:get(bot_id.."Mega:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if Megart == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..data.first_name_.."](t.me/"..(data.username_ or "TeAm_VeCto")..")".."\n• تم رفعه "..RTPA.." هنا\n")
database:set(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA) 
database:sadd(bot_id.."Mega:Special:User"..msg.chat_id_,result.sender_user_id_)  
elseif Megart == "ادمن" and Owner(msg) then  
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..data.first_name_.."](t.me/"..(data.username_ or "TeAm_VeCto")..")".."\n• تم رفعه "..RTPA.." هنا\n")
database:set(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)
database:sadd(bot_id.."Mega:Mod:User"..msg.chat_id_,result.sender_user_id_)  
elseif Megart == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..data.first_name_.."](t.me/"..(data.username_ or "TeAm_VeCto")..")".."\n• تم رفعه "..RTPA.." هنا\n")
database:set(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)  
database:sadd(bot_id.."Mega:Manager"..msg.chat_id_,result.sender_user_id_)  
elseif Megart == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..data.first_name_.."](t.me/"..(data.username_ or "TeAm_VeCto")..")".."\n• تم رفعه "..RTPA.." هنا\n")
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local RTPA = text:match("تنزيل (.*)")
if database:sismember(bot_id.."Mega:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local Megart = database:get(bot_id.."Mega:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if Megart == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..data.first_name_.."](t.me/"..(data.username_ or "TeAm_VeCto")..")".."\n• تم تنزيله من "..RTPA.." هنا\n")  
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif Megart == "ادمن" and Owner(msg) then  
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..data.first_name_.."](t.me/"..(data.username_ or "TeAm_VeCto")..")".."\n• تم تنزيله من "..RTPA.." هنا\n")  
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_,result.sender_user_id_) 
database:del(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif Megart == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..data.first_name_.."](t.me/"..(data.username_ or "TeAm_VeCto")..")".."\n• تم تنزيله من "..RTPA.." هنا\n")  
database:srem(bot_id.."Mega:Manager"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif Megart == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..data.first_name_.."](t.me/"..(data.username_ or "TeAm_VeCto")..")".."\n• تم تنزيله من "..RTPA.." هنا\n")  
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if database:sismember(bot_id.."Mega:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local Megart = database:get(bot_id.."Mega:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if Megart == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..result.title_.."](t.me/"..(text1[3] or "TeAm_VeCto")..")".."\n• تم رفعه "..text1[2].." هنا")   
database:sadd(bot_id.."Mega:Special:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif Megart == "ادمن" and Owner(msg) then  
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..result.title_.."](t.me/"..(text1[3] or "TeAm_VeCto")..")".."\n• تم رفعه "..text1[2].." هنا")   
database:sadd(bot_id.."Mega:Mod:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif Megart == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..result.title_.."](t.me/"..(text1[3] or "TeAm_VeCto")..")".."\n• تم رفعه "..text1[2].." هنا")   
database:sadd(bot_id.."Mega:Manager"..msg.chat_id_,result.id_)  
database:set(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif Megart == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..result.title_.."](t.me/"..(text1[3] or "TeAm_VeCto")..")".."\n• تم رفعه "..text1[2].." هنا")   
end
else
info = "• المعرف غلط"
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if database:sismember(bot_id.."Mega:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local Megart = database:get(bot_id.."Mega:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if Megart == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..result.title_.."](t.me/"..(text1[3] or "TeAm_VeCto")..")".."\n• تم تنريله من "..text1[2].." هنا")   
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif Megart == "ادمن" and Owner(msg) then  
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..result.title_.."](t.me/"..(text1[3] or "TeAm_VeCto")..")".."\n• تم تنريله من "..text1[2].." هنا")   
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif Megart == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..result.title_.."](t.me/"..(text1[3] or "TeAm_VeCto")..")".."\n• تم تنريله من "..text1[2].." هنا")   
database:srem(bot_id.."Mega:Manager"..msg.chat_id_,result.id_)  
database:del(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif Megart == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n\n• العضو ↺["..result.title_.."](t.me/"..(text1[3] or "TeAm_VeCto")..")".."\n• تم تنريله من "..text1[2].." هنا")   
end
else
info = "• المعرف غلط"
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end

if text == ("حظر") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لقد تم تعطيل الحظر و الطرد من قبل المنشئين')
return false
end
function Function_Mega(extra, result, success)
if result.sender_user_id_ == tonumber(1313703081) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور السورس \n")
return false 
end

if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"• البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
database:sadd(bot_id.."Mega:Ban:User"..msg.chat_id_, result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم حظره من القروب")  
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text == "هينه" or text == "هينها" and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
heen = {
"- حبيبي علاج الجاهل التجاهل ."
,"- مالي خلك زبايل التلي . "
,"- كرامتك صارت بزبل פَــبي ."
,"- مو صوجك صوج الكواد الزمك جهاز ."
,"- لفارغ استجن . "
,"- ڪِݪك واحد لوكي كس ."
,"- ملطلط دي ."
};
sendheen = heen[math.random(#heen)]
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.reply_to_message_id_,sendheen)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^حظر @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^حظر @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لقد تم تعطيل الحظر و الطرد من قبل المنشئين')
return false
end
function Function_Mega(extra, result, success)
if result.id_ then
if result.id_ == tonumber(1313703081) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور السورس \n")
return false 
end
if result.id_ == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور البوت \n")
return false 
end
if result.id_ == tonumber(1313703081) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور السورس \n")
return false 
end
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"• البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
database:sadd(bot_id.."Mega:Ban:User"..msg.chat_id_, result.id_)
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم حظره من القروب")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end

if text and text:match("^حظر (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^حظر (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لقد تم تعطيل الحظر و الطرد من قبل المنشئين')
return false
end
if userid == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور البوت \n")
return false 
end
if userid == tonumber(1313703081) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور السورس \n")
return false 
end

if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(userid,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"• البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
database:sadd(bot_id.."Mega:Ban:User"..msg.chat_id_, userid)
Kick_Group(msg.chat_id_, userid)  
Reply_Status(msg,userid,"reply","• تم حظره من القروب")  
end,nil)   
end
return false
end
if text == ("الغاء حظر") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "• انا لست محظورا \n") 
return false 
end
database:srem(bot_id.."Mega:Ban:User"..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.sender_user_id_,"reply","• تم الغاء حظره من هنا")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
 
if text and text:match("^الغاء حظر @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^الغاء حظر @(.*)$") 
function Function_Mega(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "• انا لست محظورا \n") 
return false 
end
database:srem(bot_id.."Mega:Ban:User"..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.id_,"reply","• تم الغاء حظره من هنا")  
else
send(msg.chat_id_, msg.id_, "• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end

if text and text:match("^الغاء حظر (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^الغاء حظر (%d+)$") 
if tonumber(userid) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "• انا لست محظورا \n") 
return false 
end
database:srem(bot_id.."Mega:Ban:User"..msg.chat_id_, userid)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,userid,"reply","• تم الغاء حظره من هنا")  
return false
end

if text == ("كتم") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
if result.sender_user_id_ == tonumber(1313703081) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور السورس  \n")
return false 
end

if result.sender_user_id_ == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور البوت  \n")
return false 
end
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
return false 
end     
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"• البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم كتمه من هنا")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^كتم @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^كتم @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"• البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
function Function_Mega(extra, result, success)
if result.id_ then
if result.id_ == tonumber(1313703081) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور السورس \n")
return false 
end
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.id_,msg.chat_id_).." )")
return false 
end     
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم كتمه من هنا")  
else
send(msg.chat_id_, msg.id_, "• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^كتم (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^كتم (%d+)$")
if userid == tonumber(1313703081) then
send(msg.chat_id_, msg.id_, "• لا يمكن { حظر،كتم،طرد،تقيد،الخ ..} مطور السورس \n")
return false 
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(userid,msg.chat_id_).." )")
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"• البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
database:sadd(bot_id.."Mega:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم كتمه من هنا")  
end
return false
end
if text == ("الغاء كتم") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
database:srem(bot_id.."Mega:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم الغاء كتمه من هنا")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^الغاء كتم @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء كتم @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."Mega:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم الغاء كتمه من هنا")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end

if text and text:match("^الغاء كتم (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^الغاء كتم (%d+)$") 
database:srem(bot_id.."Mega:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم الغاء كتمه من هنا")  
return false
end
if text == 'قفل الفارسيه' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id..'Mega:Mega:lock:Fshar'..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الفارسيه")  
end
if text and database:get(bot_id..'Mega:lock:Fshar'..msg.chat_id_) and not Addictive(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text == 'فتح الفارسيه' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id..'Mega:Mega:lock:Fshar'..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"lock","•  تـم فـتح الفارسيه\n")  
end
if text == 'قفل الفشار' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id..'Mega:lock:Fshar'..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","• تم قفـل الفشار")  
end
if text and database:get(bot_id..'Mega:Mega:lock:Fshar'..msg.chat_id_) and not Addictive(msg) then 
list = {"ڄ","که","پی","خسته","برم","راحتی","بیام","بپوشم","كرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text == 'فتح الفشار' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id..'Mega:lock:Fshar'..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"lock","•  تـم فـتح الفشار\n")  
end
if text == ("تقيد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تقييده في القروب")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^تقيد @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if Rank_Checking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.id_,msg.chat_id_).." )")
return false 
end      
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
Reply_Status(msg,result.id_,"reply","• تم تقييده في القروب")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^تقيد (%d+)$")
if Rank_Checking(userid, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(userid,msg.chat_id_).." )")
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid)
Reply_Status(msg,userid,"reply","• تم تقييده في القروب")  
end
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقيد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.sender_user_id_,"reply","• تم الغاء تقييده")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^الغاء تقيد @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.id_,"reply","• تم الغاء تقييده")  
else
send(msg.chat_id_, msg.id_, "• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^الغاء تقيد (%d+)$")
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,userid,"reply","• تم الغاء تقييده")  
return false
end
if text == ("طرد") and msg.reply_to_message_id_ ~=0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لقد تم تعطيل الحظر و الطرد من قبل المنشئين')
return false
end
function Function_Mega(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"• البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم طرده من هنا")  
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end  
if text and text:match("^طرد @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
local username = text:match("^طرد @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لقد تم تعطيل الحظر و الطرد من قبل المنشئين')
return false
end
function Function_Mega(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"• البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم طرده من هنا")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end  

if text and text:match("^طرد (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
local userid = text:match("^طرد (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لقد تم تعطيل الحظر و الطرد من قبل المنشئين')
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(userid,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"• البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
Kick_Group(msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم طرده من هنا")  
end,nil)   
end
return false
end

if text == "تعطيل الطرد" or text == "تعطيل الحظر" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:set(bot_id.."Ban:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '• تم تعطيل ↺الحظر ~ والطرد ')
return false
end
end
if text == "تفعيل الطرد" or text == "تفعيل الحظر" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:del(bot_id.."Ban:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '• تم تفعيل ↺الحظر ~ والطرد ')
return false
end
end
if text == "تعطيل الرفع" or text == "تعطيل الترقيه" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:set(bot_id.."Add:Group:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '• تم تعطيل رفع ↺الادمن ~ المميز ')
return false
end
end
if text == "تفعيل الرفع" or text == "تفعيل الترقيه" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:del(bot_id.."Add:Group:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '• تم تفعيل رفع ↺الادمن ~ المميز ')
return false
end
end

if text == 'لقبي' and tonumber(msg.reply_to_message_id_) == 0 then
Ge = https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..msg.sender_user_id_)
GeId = JSON.decode(Ge)
if not GeId.result.custom_title then
send(msg.chat_id_, msg.id_,'• وينكو لقب ') 
else
send(msg.chat_id_, msg.id_,'• لقبك هو : '..GeId.result.custom_title) 
end
end
if text == "فحص البوت" and Owner(msg) then
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..bot_id)
local getInfo = JSON.decode(chek)
if getInfo.ok == true then
if getInfo.result.can_change_info == true then
INf = 'مفعله' 
else 
INf = 'غير مفعله' 
end
if getInfo.result.can_delete_messages == true then
DEL = 'مفعله' 
else 
DEL = 'غير مفعله' 
end
if getInfo.result.can_invite_users == true then
INv = 'مفعله' 
else
INv = 'غير مفعله' 
end
if getInfo.result.can_pin_messages == true then
Pin = 'مفعله' 
else
Pin = 'غير مفعله' 
end
if getInfo.result.can_restrict_members == true then
REs = 'مفعله' 
else 
REs = 'غير مفعله' 
end
if getInfo.result.can_promote_members == true then
PRo = 'مفعله'
else
PRo = 'غير مفعله'
end 
send(msg.chat_id_, msg.id_,'\n • صلاحيات البوت هي \n— — — — — — — — —\n• تغير معلومات القروب : '..INf..'\n• حذف الرسائل : '..DEL..'\n• حظر المستخدمين : '..REs..'\n• دعوة المستخدمين : '..INv..'\n• ثتبيت الرسالة : '..Pin..'\n• اضافة مشرفين : '..PRo)   
end
end
if text ==("تثبيت") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id.."Mega:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"• التثبيت والغاء التثبيت تم قفله من قبل المنشئين")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"• تم تثبيت الرساله")   
database:set(bot_id.."Mega:Pin:Id:Msg"..msg.chat_id_,msg.reply_to_message_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"• انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"• ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil) 
end
if text == "الغاء التثبيت" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id.."Mega:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"• التثبيت والغاء التثبيت تم قفله من قبل المنشئين")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"• تم الغاء تثبيت الرساله")   
database:del(bot_id.."Mega:Pin:Id:Msg"..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"• انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"• ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil)
end
if text == 'الغاء تثبيت الكل' or text == "حذف المثبتات" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id.."Mega:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"• التثبيت والغاء التثبيت تم قفله من قبل المنشئين")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"• تم الغاء تثبيت الكل")   
https.request('https://api.telegram.org/bot'..token..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
database:del(bot_id.."Mega:Pin:Id:Msg"..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"• انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"• ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil)
end
if text and text:match("^وضع تكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("وضع تكرار (.*)")
database:hset(bot_id.."Mega:flooding:settings:"..msg.chat_id_ ,"floodmax" ,Num) 
send(msg.chat_id_, msg.id_,"• تم وضع عدد التكرار ("..Num..")")  
end 
if text and text:match("^وضع زمن التكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("^وضع زمن التكرار (%d+)$")
database:hset(bot_id.."Mega:flooding:settings:"..msg.chat_id_ ,"floodtime" ,Num) 
send(msg.chat_id_, msg.id_,"• تم وضع زمن التكرار ("..Num..")") 
end


if text == 'المطور' or text == 'مطور' then
local Text_Dev = database:get(bot_id..'Mega:Text_Dev')
if Text_Dev then 
send(msg.chat_id_, msg.id_,Text_Dev)
else
tdcli_function ({ID = "GetUser",user_id_ = Sudo},function(arg,data) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = Sudo,offset_ = 0,limit_ = 1},function(extra,bo,success) 
Name = "* Dev bot ↺ * ["..data.first_name_.."](T.me/"..data.username_..")\n*Dev User ↺* [@"..data.username_.."]"
Name = Name..'*\nDev Bio ↺* ['..getbio(Sudo)..']\n'
if bo.photos_[0] then
x = {} 
x.inline_keyboard = {
{{text =""..data.first_name_.."",url="https://t.me/"..data.username_..""}},
}
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&photo='..bo.photos_[0].sizes_[1].photo_.persistent_id_..'&caption='..URL.escape(Name)..'&message_id='..msg.id_..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(x)) 
else
send(msg.chat_id_, msg.id_,Name)
end
end,nil)
end,nil)
end
end


if text == "تفعيل رابط" or text == 'تفعيل الرابط' then
if Addictive(msg) then  
database:set(bot_id.."Link_Group:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_," *• تم تفعيل الرابط*") 
return false  
end
end
if text == "تعطيل رابط" or text == 'تعطيل الرابط' then
if Addictive(msg) then  
database:del(bot_id.."Link_Group:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_," *• تم تعطيل الرابط*") 
return false end
end
if text == "ضع رابط" or text == 'وضع رابط' then
if msg.reply_to_message_id_ == 0  and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
send(msg.chat_id_,msg.id_," *• حسنآ ارسل اليه الرابط الان*")
database:setex(bot_id.."Mega:Set:PMegavate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_,120,true) 
return false
end
end
if text == "الرابط" then 
local status_Link = database:get(bot_id.."Link_Group:status"..msg.chat_id_)
if not status_Link then
send(msg.chat_id_, msg.id_,"• الرابط معطل") 
return false  
end
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
local link = database:get(bot_id.."Private:Group:Link"..msg.chat_id_)            
if link then                              
linkgp = '\n• ['..ta.title_..']('..link..') \n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n• ['..link..'] '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = URL.escape(ta.title_),url=link},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(linkgp).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else                
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
linkgp = '\n• ['..ta.title_..']('..linkgpp.result..') \n*┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n• ['..linkgpp.result..'] '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = URL.escape(ta.title_),url=linkgpp.result},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(linkgp).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,'• لا يوجد رابط ارسل ضع رابط')
end                
end            
 end,nil)
end
if text == 'مسح الرابط' or text == 'حذف الرابط' then
if Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
send(msg.chat_id_,msg.id_," *• تم مسح الرابط*")   
database:del(bot_id.."Private:Group:Link"..msg.chat_id_) 
return false  
end
end


if text == ("امسح") and cleaner(msg) then  
local list = database:smembers(bot_id.."Mega:allM"..msg.chat_id_)
for k,v in pairs(list) do
local Message = v
if Message then
t = "• تم مسح "..k.." من الوسائط الموجوده"
DeleteMessage(msg.chat_id_,{[0]=Message})
database:del(bot_id.."Mega:allM"..msg.chat_id_)
end
end
if #list == 0 then
t = "• لا يوجد ميديا في القروب"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("عدد الميديا") or text == "الميديا" and cleaner(msg) then  
local num = database:smembers(bot_id.."Mega:allM"..msg.chat_id_)
for k,v in pairs(num) do
local numl = v
if numl then
l = "*• عدد الميديا الموجود هو *"..k
end
end
if #num == 0 then
l = "*• لا يوجد ميديا في القروب*"
end
send(msg.chat_id_, msg.id_, l)
end
if text and text:match("^ضع صوره") and Addictive(msg) and msg.reply_to_message_id_ == 0 or text and text:match("^وضع صوره") and Addictive(msg) and msg.reply_to_message_id_ == 0 then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_,"• ارسل لي الصوره") 
return false
end
if text == "حذف الصوره" or text == "مسح الصوره" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
https.request("https://api.telegram.org/bot"..token.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"• تم ازالة صورة القروب") 
end
return false  
end
if text == "ضع وصف" or text == "وضع وصف" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
database:setex(bot_id.."Mega:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_,"• ارسل الان الوصف")
end
return false  
end
if text == "ضع ترحيب" or text == "وضع ترحيب" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
database:setex(bot_id.."Mega:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
t  = "• ارسل لي الترحيب الان"
tt = "\n• تستطيع اضافة مايلي !\n• دالة عرض الاسم ↺{`name`}\n• دالة عرض المعرف ↺{`user`}"
send(msg.chat_id_, msg.id_,t..tt) 
end
return false  
end
if text == "الترحيب" and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."Mega:Get:Welcome:Group"..msg.chat_id_)  then 
Welcome = database:get(bot_id.."Mega:Get:Welcome:Group"..msg.chat_id_)  
else 
Welcome = "• لم يتم تعيين ترحيب للقروب"
end 
send(msg.chat_id_, msg.id_,"["..Welcome.."]") 
return false  
end
if text == "تفعيل الترحيب" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Chek:Welcome"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"• تم تفعيل ترحيب القروب") 
return false  
end
if text == "تعطيل الترحيب" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Chek:Welcome"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"• تم تعطيل ترحيب القروب") 
return false  
end
if text == "مسح الترحيب" or text == "حذف الترحيب" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
database:del(bot_id.."Mega:Get:Welcome:Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"• تم ازالة ترحيب القروب") 
end
return false  
end
if text == "قائمه المنع" and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Filter:msg",msg.chat_id_)
tdcli_function ({ID = "GetUser",user_id_ = bot_id},function(arg,data) 
local Text ='• قائمه الممنوعات'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'صور', url="https://t.me/"..data.username_.."?start=ph"..msg.chat_id_},{text = 'كلمات', url="https://t.me/"..data.username_.."?start=msg"..msg.chat_id_}},
{{text = 'متحركات', url="https://t.me/"..data.username_.."?start=gif"..msg.chat_id_},{text = 'ملصقات', url="https://t.me/"..data.username_.."?start=Sti"..msg.chat_id_}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
if text == "مسح قائمه المنع" and Addictive(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local listtext = database:smembers(bot_id.."Mega:List:Filter:text"..msg.chat_id_)  
for k,v in pairs(listtext) do  
database:srem(bot_id.."Mega:List:Filter:text"..msg.chat_id_,v)  
end  
local listAnimation = database:smembers(bot_id.."Mega:List:Filter:Animation"..msg.chat_id_)  
for k,v in pairs(listAnimation) do  
database:srem(bot_id.."Mega:List:Filter:Animation"..msg.chat_id_,v)  
end  
local listSticker = database:smembers(bot_id.."Mega:List:Filter:Sticker"..msg.chat_id_)  
for k,v in pairs(listSticker) do  
database:srem(bot_id.."Mega:List:Filter:Sticker"..msg.chat_id_,v)  
end  
local listPhoto = database:smembers(bot_id.."Mega:List:Filter:Photo"..msg.chat_id_)  
for k,v in pairs(listPhoto) do  
database:srem(bot_id.."Mega:List:Filter:Photo"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_,"• تم مسح قائمه المنع")  
end
if text and text == "منع" and msg.reply_to_message_id_ == 0 and Addictive(msg) then       
send(msg.chat_id_, msg.id_,"• الان ارسل { كلمه،صوره،ملصق،متحركه } لمنعه من القروب")  
database:set(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"• تم منع الكلمه بنجاح")  
database:del(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."Mega:List:Filter:text"..msg.chat_id_,text)  
return false 
end  
end
if msg.content_.ID == 'MessageAnimation' then    
local tsssst = database:get(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"• تم منع المتحركه بنجاح")  
database:del(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."Mega:List:Filter:Animation"..msg.chat_id_,msg.content_.animation_.animation_.persistent_id_)  
return false 
end  
end
if msg.content_.ID == 'MessageSticker' then    
local tsssst = database:get(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"• تم منع الملصق بنجاح")  
database:del(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."Mega:List:Filter:Sticker"..msg.chat_id_,msg.content_.sticker_.sticker_.persistent_id_)  
return false 
end  
end
if msg.content_.ID == 'MessagePhoto' then    
local tsssst = database:get(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"• تم منع الصوره بنجاح")  
database:del(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."Mega:List:Filter:Photo"..msg.chat_id_,msg.content_.photo_.sizes_[1].photo_.persistent_id_)  
return false 
end  
end
if text == "الغاء منع" and msg.reply_to_message_id_ == 0 and Addictive(msg) then    
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,"• الان ارسل { كلمه،صوره،ملصق،متحركه } ممنوع لالغاء منعه")  
database:set(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false 
end
if text then 
local test = database:get(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == "reppp" then   
send(msg.chat_id_, msg.id_,"• تم الغاء منعها ")  
database:del(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."Mega:List:Filter:text"..msg.chat_id_,text)  
return false
end  
end
if msg.content_.ID == 'MessageAnimation' then    
local onte = database:get(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if onte and onte == "reppp" then   
send(msg.chat_id_, msg.id_,"• تم الغاء منع المتحركه بنجاح ")  
database:del(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."Mega:List:Filter:Animation"..msg.chat_id_,msg.content_.animation_.animation_.persistent_id_)  
return false
end  
end
if msg.content_.ID == 'MessageSticker' then    
local Stic = database:get(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if Stic and Stic == "reppp" then   
send(msg.chat_id_, msg.id_,"• تم الغاء منع الملصق بنجاح ")  
database:del(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."Mega:List:Filter:Sticker"..msg.chat_id_,msg.content_.sticker_.sticker_.persistent_id_)  
return false
end  
end
if msg.content_.ID == 'MessagePhoto' then    
local hoto = database:get(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if hoto and hoto == "reppp" then   
send(msg.chat_id_, msg.id_,"• تم الغاء منع الصوره بنجاح ")  
database:del(bot_id.."Mega:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."Mega:List:Filter:Photo"..msg.content_.photo_.sizes_[1].photo_.persistent_id_)  
return false
end  
end
if text == "مسح البوتات" and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(bot_id) then
Kick_Group(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, "• لا توجد بوتات في القروب")
else
local t = "• عدد البوتات هنا >> {"..c.."}\n• عدد البوتات التي هي ادمن >> {"..x.."}\n• تم طرد >> {"..(c - x).."} من البوتات"
send(msg.chat_id_, msg.id_,t) 
end 
end,nil)  
end   
if text == ("كشف البوتات") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n• قائمة البوتات الموجوده \n \n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ""
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = " {✯}"
end
text = text..">> [@"..ta.username_.."]"..tr.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, "• لا توجد بوتات في القروب")
return false 
end
if #admins == i then 
local a = "\n \n• عدد البوتات التي هنا >> {"..n.."} بوت\n"
local f = "• عدد البوتات التي هي ادمن >> {"..t.."}\n• ملاحضه علامة ال (✯) تعني ان البوت ادمن \n⌔"
send(msg.chat_id_, msg.id_, text..a..f)
end
end,nil)
end
end,nil)
end

if database:get(bot_id.."Mega:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, "• تم الغاء حفظ القوانين") 
database:del(bot_id.."Mega:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  
end 
database:set(bot_id.."Mega:Set:Rules:Group" .. msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"• تم حفظ قوانين القروب") 
database:del(bot_id.."Mega:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end  

if text == "ضع قوانين" or text == "وضع قوانين" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
database:setex(bot_id.."Mega:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_,msg.id_,"• ارسل لي القوانين الان")  
end
end
if text == "مسح القوانين" or text == "حذف القوانين" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
send(msg.chat_id_, msg.id_,"• تم ازالة قوانين القروب")  
database:del(bot_id.."Mega:Set:Rules:Group"..msg.chat_id_) 
end
end
if text == "القوانين" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Set_Rules = database:get(bot_id.."Mega:Set:Rules:Group" .. msg.chat_id_)   
if Set_Rules then     
send(msg.chat_id_,msg.id_, Set_Rules)   
else      
send(msg.chat_id_, msg.id_,"• لا توجد قوانين هنا")   
end    
end


if text == "@all" and BasicConstructor(msg) then
if not database:get(bot_id..'Cick:all'..msg.chat_id_) then
if database:get(bot_id.."VVVZVV:all:Time"..msg.chat_id_..':'..msg.sender_user_id_) then  
return 
send(msg.chat_id_, msg.id_,"*انتظر دقيقه من فضلك*")
end
database:setex(bot_id..'VVVZVV:all:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,amir)
x = 0
tags = 0
local list = amir.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "#all"
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 5 or x == tags or k == 0 then
local Text = t:gsub('#all,','#all\n')
sendText(msg.chat_id_,Text,0,'md')
end
end,nil)
end
end,nil)
end,nil)
end
end



if text == "ترتيب الاوامر" and Constructor(msg) then  
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"ا")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"م")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"اد")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"مد")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"من")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"اس")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":مط","اضف مطور")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"مط")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":ثانوي","اضف مطور ثانوي")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"ثانوي")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"تك")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"تعط")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"تفع")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":ر","الرابط")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"ر")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":رر","ردود المدير")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"رر")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":،،","مسح المكتومين")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"،،")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":رد","اضف رد")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"رد")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":سح","مسح سحكاتي")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"سح")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":رس","مسح رسائلي")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"رس")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":غ","غنيلي")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"غ")
 database:set(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":#","مسح العام")
 database:sadd(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,"#")
send(msg.chat_id_, msg.id_,"• تم ترتيب الاوامر بالشكل التالي ~\n•  ايدي - ا .\n•  رفع مميز - م .\n• رفع ادمن - اد .\n•  رفع مدير - مد . \n•  رفع منشى - من . \n•  رفع منشئ الاساسي - اس  .\n•  اضف مطور - مط .\n• اضف مطور ثانوي - ثانوي .\n•  تنزيل الكل - تك .\n•  تعطيل الايدي بالصوره - تعط .\n•  تفعيل الايدي بالصوره - تفع .\n•  الرابط - ر .\n•  ردود المدير - رر .\n•  مسح المكتومين - ،، .\n•  اضف رد - رد .\n•  مسح سحكاتي - سح .\n•  مسح رسائلي - رس .\n•  غنيلي - غ .\n• مسح العام - #")  
end

if text == "تفعيل لو خيروك" and Owner(msg) then
local t = ' \n• تم تفعيل لو خيروك'
send(msg.chat_id_, msg.id_,t)
database:del(bot_id..'lock:low'..msg.chat_id_) 
end
if text == "تعطيل لو خيروك" and Owner(msg) then
local t = '  \n• تم تعطيل لو خيروك'
send(msg.chat_id_, msg.id_,t)
database:set(bot_id..'lock:low'..msg.chat_id_,true)  
end
if text == "تفعيل صراحه" and Owner(msg) then
local t = ' \n• تم تفعيل صراحه'
send(msg.chat_id_, msg.id_,t)
database:del(bot_id..'lock:sraha'..msg.chat_id_) 
end
if text == "تعطيل صراحه" and Owner(msg) then
local t = '  \n• تم تعطيل الصراحه'
send(msg.chat_id_, msg.id_,t)
database:set(bot_id..'lock:sraha'..msg.chat_id_,true)  
end
if text == "صراحه" or text == "الصراحه" and not database:get(bot_id..'lock:sraha'..msg.chat_id_) then
local texting = {
"صراحه  |  صوتك حلوة؟",
"صراحه  |  التقيت الناس مع وجوهين؟",
"صراحه  |  شيء وكنت تحقق اللسان؟",
"صراحه  |  أنا شخص ضعيف عندما؟",
"صراحه  |  هل ترغب في إظهار حبك ومرفق لشخص أو رؤية هذا الضعف؟",
"صراحه  |  يدل على أن الكذب مرات تكون ضرورية شي؟",
"صراحه  |  أشعر بالوحدة على الرغم من أنني تحيط بك كثيرا؟",
"صراحه  |  كيفية الكشف عن من يكمن عليك؟",
"صراحه  |  إذا حاول شخص ما أن يكرهه أن يقترب منك ويهتم بك تعطيه فرصة؟",
"صراحه  |  أشجع شيء حلو في حياتك؟",
"صراحه  |  طريقة جيدة يقنع حتى لو كانت الفكرة خاطئة توافق؟",
"صراحه  |  كيف تتصرف مع من يسيئون فهمك ويأخذ على ذهنه ثم ينتظر أن يرفض؟",
"صراحه  |  التغيير العادي عندما يكون الشخص الذي يحبه؟",
"صراحه  |  المواقف الصعبة تضعف لك ولا ترفع؟",
"صراحه  |  نظرة و يفسد الصداقة؟",
"صراحه  |  ‏‏إذا أحد قالك كلام سيء بالغالب وش تكون ردة فعلك؟",
"صراحه  |  شخص معك بالحلوه والمُره؟",
"صراحه  |  ‏هل تحب إظهار حبك وتعلقك بالشخص أم ترى ذلك ضعف؟",
"صراحه  |  تأخذ بكلام اللي ينصحك ولا تسوي اللي تبي؟",
"صراحه  |  وش تتمنى الناس تعرف عليك؟",
"صراحه  |  ابيع المجرة عشان؟",
"صراحه  |  أحيانا احس ان الناس ، كمل؟",
"صراحه  |  مع مين ودك تنام اليوم؟",
"صراحه  |  صدفة العمر الحلوة هي اني؟",
"صراحه  |  الكُره العظيم دايم يجي بعد حُب قوي تتفق؟",
"صراحه  |  صفة تحبها في نفسك؟",
"صراحه  |  ‏الفقر فقر العقول ليس الجيوب  ، تتفق؟",
"صراحه  |  تصلي صلواتك الخمس كلها؟",
"صراحه  |  ‏تجامل أحد على راحتك؟",
"صراحه  |  اشجع شيء سويتة بحياتك؟",
"صراحه  |  وش ناوي تسوي اليوم؟",
"صراحه  |  وش شعورك لما تشوف المطر؟",
"صراحه  |  غيرتك هاديه ولا تسوي مشاكل؟",
"صراحه  |  ما اكثر شي ندمن عليه؟",
"صراحه  |  اي الدول تتمنى ان تزورها؟",
"صراحه  |  متى اخر مره بكيت؟",
"صراحه  |  تقيم حظك ؟ من عشره؟",
"صراحه  |  هل تعتقد ان حظك سيئ؟",
"صراحه  |  شـخــص تتمنــي الإنتقــام منـــه؟",
"صراحه  |  كلمة تود سماعها كل يوم؟",
"صراحه  |  **هل تُتقن عملك أم تشعر بالممل؟",
"صراحه  |  هل قمت بانتحال أحد الشخصيات لتكذب على من حولك؟",
"صراحه  |  متى آخر مرة قمت بعمل مُشكلة كبيرة وتسببت في خسائر؟",
"صراحه  |  ما هو اسوأ خبر سمعته بحياتك؟",
"‏صراحه  | هل جرحت شخص تحبه من قبل ؟",
"صراحه  |  ما هي العادة التي تُحب أن تبتعد عنها؟",
"‏صراحه  | هل تحب عائلتك ام تكرههم؟",
"‏صراحه  |  من هو الشخص الذي يأتي في قلبك بعد الله – سبحانه وتعالى- ورسوله الكريم – صلى الله عليه وسلم؟",
"‏صراحه  |  هل خجلت من نفسك من قبل؟",
"‏صراحه  |  ما هو ا الحلم  الذي لم تستطيع ان تحققه؟",
"‏صراحه  |  ما هو الشخص الذي تحلم به كل ليلة؟",
"‏صراحه  |  هل تعرضت إلى موقف مُحرج جعلك تكره صاحبهُ؟",
"‏صراحه  |  هل قمت بالبكاء أمام من تُحب؟",
"‏صراحه  |  ماذا تختار حبيبك أم صديقك؟",
"‏صراحه  | هل حياتك سعيدة أم حزينة؟",
"صراحه  |  ما هي أجمل سنة عشتها بحياتك؟",
"‏صراحه  |  ما هو عمرك الحقيقي؟",
"‏صراحه  |  ما اكثر شي ندمن عليه؟",
"صراحه  |  ما هي أمنياتك المُستقبلية؟‏",
"صراحه  | هل قبلت فتاه؟"
}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
return false
end
if text == "لو خيروك" or text == "خيروك" and not database:get(bot_id..'lock:low'..msg.chat_id_) then
local texting = {"لو خيروك |  بين الإبحار لمدة أسبوع كامل أو السفر على متن طائرة لـ 3 أيام متواصلة؟ ",
"لو خيروك |  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معقول؟ ",
"لو خيروك |  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا؟ ",
"لو خيروك |  بين تناول البيتزا وبين الآيس كريم وذلك بشكل دائم؟ ",
"لو خيروك |  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر؟ ",
"لو خيروك |  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك؟ ",
"لو خيروك |  أسئلة محرجة أسئلة صراحة ماذا ستختار؟ ",
"لو خيروك |  بين الذهاب إلى الماضي والعيش مع جدك أو بين الذهاب إلى المستقبل والعيش مع أحفادك؟ ",
"لو كنت شخص آخر هل تفضل البقاء معك أم أنك ستبتعد عن نفسك؟ ",
"لو خيروك |  بين الحصول على الأموال في عيد ميلادك أو على الهدايا؟ ",
"لو خيروك |  بين القفز بمظلة من طائرة أو الغوص في أعماق البحر؟ ",
"لو خيروك |  بين الاستماع إلى الأخبار الجيدة أولًا أو الاستماع إلى الأخبار السيئة أولًا؟ ",
"لو خيروك |  بين أن تكون رئيس لشركة فاشلة أو أن تكون موظف في شركة ناجحة؟ ",
"لو خيروك |  بين أن يكون لديك جيران صاخبون أو أن يكون لديك جيران فضوليون؟ ",
"لو خيروك |  بين أن تكون شخص مشغول دائمًا أو أن تكون شخص يشعر بالملل دائمًا؟ ",
"لو خيروك |  بين قضاء يوم كامل مع الرياضي الذي تشجعه أو نجم السينما الذي تحبه؟ ",
"لو خيروك |  بين استمرار فصل الشتاء دائمًا أو بقاء فصل الصيف؟ ",
"لو خيروك |  بين العيش في القارة القطبية أو العيش في الصحراء؟ ",
"لو خيروك |  بين أن تكون لديك القدرة على حفظ كل ما تسمع أو تقوله وبين القدرة على حفظ كل ما تراه أمامك؟ ",
"لو خيروك |  بين أن يكون طولك 150 سنتي متر أو أن يكون 190 سنتي متر؟ ",
"لو خيروك |  بين إلغاء رحلتك تمامًا أو بقائها ولكن فقدان الأمتعة والأشياء الخاص بك خلالها؟ ",
"لو خيروك |  بين أن تكون اللاعب الأفضل في فريق كرة فاشل أو أن تكون لاعب عادي في فريق كرة ناجح؟ ",
"لو خيروك |  بين ارتداء ملابس البيت لمدة أسبوع كامل أو ارتداء البدلة الرسمية لنفس المدة؟ ",
"لو خيروك |  بين امتلاك أفضل وأجمل منزل ولكن في حي سيء أو امتلاك أسوأ منزل ولكن في حي جيد وجميل؟ ",
"لو خيروك |  بين أن تكون غني وتعيش قبل 500 سنة، أو أن تكون فقير وتعيش في عصرنا الحالي؟ ",
"لو خيروك |  بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك؟ ",
"لو خيروك |  بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي؟ ",
"لو خيروك |  بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد، أو أن تقوم بتناول شطيرة معجون أسنان؟ ",
"لو خيروك |  بين قول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام؟ ",
"لو خيروك |  بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم؟ ",
"لو خيروك |  بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط؟ ",
"لو خيروك |  بين الرقص على سطح منزلك أو الغناء على نافذتك؟ ",
"لو خيروك |  بين تلوين شعرك كل خصلة بلون وبين ارتداء ملابس غير متناسقة لمدة أسبوع؟ ",
"لو خيروك |  بين تناول مياه غازية مجمدة وبين تناولها ساخنة؟ ",
"لو خيروك |  بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق؟ ",
"لو خيروك |  بين تزيين طبق السلطة بالبرتقال وبين إضافة البطاطا لطبق الفاكهة؟ ",
"لو خيروك |  بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة؟ ",
"لو خيروك |  بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس؟ ",
"لو خيروك |  بين الشخص الذي تحبه وصديق الطفولة؟ ",
"لو خيروك |  بين أمك وأبيك؟ ",
"لو خيروك |  بين أختك وأخيك؟ ",
"لو خيروك |  بين نفسك وأمك؟ ",
"لو خيروك |  بين صديق قام بغدرك وعدوك؟ ",
"لو خيروك |  بين خسارة حبيبك/حبيبتك أو خسارة أخيك/أختك؟ ",
"لو خيروك |  بإنقاذ شخص واحد مع نفسك بين أمك أو ابنك؟ ",
"لو خيروك |  بين ابنك وابنتك؟ ",
"لو خيروك |  بين زوجتك وابنك/ابنتك؟ ",
"لو خيروك |  بين جدك أو جدتك؟ ",
"لو خيروك |  بين زميل ناجح وحده أو زميل يعمل كفريق؟ ",
"لو خيروك |  بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك؟ ",
"لو خيروك |  بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب؟ ",
"لو خيروك |  بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة؟ ",
"لو خيروك |  بين أستاذ اللغة العربية أو أستاذ الرياضيات؟ ",
"لو خيروك |  بين أخيك البعيد أو جارك القريب؟ ",
"لو خيروك |  يبن صديقك البعيد وبين زميلك القريب؟ ",
"لو خيروك |  بين رجل أعمال أو أمير؟ ",
"لو خيروك |  بين نجار أو حداد؟ ",
"لو خيروك |  بين طباخ أو خياط؟ ",
"لو خيروك |  بين أن تكون كل ملابس بمقاس واحد كبير الحجم أو أن تكون جميعها باللون الأصفر؟ ",
"لو خيروك |  بين أن تتكلم بالهمس فقط طوال الوقت أو أن تصرخ فقط طوال الوقت؟ ",
"لو خيروك |  بين أن تمتلك زر إيقاف موقت للوقت أو أن تمتلك أزرار للعودة والذهاب عبر الوقت؟ ",
"لو خيروك |  بين أن تعيش بدون موسيقى أبدًا أو أن تعيش بدون تلفاز أبدًا؟ ",
"لو خيروك |  بين أن تعرف متى سوف تموت أو أن تعرف كيف سوف تموت؟ ",
"لو خيروك |  بين العمل الذي تحلم به أو بين إيجاد شريك حياتك وحبك الحقيقي؟ ",
"لو خيروك |  بين معاركة دب أو بين مصارعة تمساح؟ ",
"لو خيروك |  بين إما الحصول على المال أو على المزيد من الوقت؟ ",
"لو خيروك |  بين امتلاك قدرة التحدث بكل لغات العالم أو التحدث إلى الحيوانات؟ ",
"لو خيروك |  بين أن تفوز في اليانصيب وبين أن تعيش مرة ثانية؟ ",
"لو خيروك |  بأن لا يحضر أحد إما لحفل زفافك أو إلى جنازتك؟ ",
"لو خيروك |  بين البقاء بدون هاتف لمدة شهر أو بدون إنترنت لمدة أسبوع؟ ",
"لو خيروك |  بين العمل لأيام أقل في الأسبوع مع زيادة ساعات العمل أو العمل لساعات أقل في اليوم مع أيام أكثر؟ ",
"لو خيروك |  بين مشاهدة الدراما في أيام السبعينيات أو مشاهدة الأعمال الدرامية للوقت الحالي؟ ",
"لو خيروك |  بين التحدث عن كل شيء يدور في عقلك وبين عدم التحدث إطلاقًا؟ ",
"لو خيروك |  بين مشاهدة فيلم بمفردك أو الذهاب إلى مطعم وتناول العشاء بمفردك؟ ",
"لو خيروك |  بين قراءة رواية مميزة فقط أو مشاهدتها بشكل فيلم بدون القدرة على قراءتها؟ ",
"لو خيروك |  بين أن تكون الشخص الأكثر شعبية في العمل أو المدرسة وبين أن تكون الشخص الأكثر ذكاءً؟ ",
"لو خيروك |  بين إجراء المكالمات الهاتفية فقط أو إرسال الرسائل النصية فقط؟ ",
"لو خيروك |  بين إنهاء الحروب في العالم أو إنهاء الجوع في العالم؟ ",
"لو خيروك |  بين تغيير لون عينيك أو لون شعرك؟ ",
"لو خيروك |  بين امتلاك كل عين لون وبين امتلاك نمش على خديك؟ ",
"لو خيروك |  بين الخروج بالمكياج بشكل مستمر وبين الحصول على بشرة صحية ولكن لا يمكن لك تطبيق أي نوع من المكياج؟ ",
"لو خيروك |  بين أن تصبحي عارضة أزياء وبين ميك آب أرتيست؟ ",
"لو خيروك |  بين مشاهدة كرة القدم أو متابعة الأخبار؟ ",
"لو خيروك |  بين موت شخصية بطل الدراما التي تتابعينها أو أن يبقى ولكن يكون العمل الدرامي سيء جدًا؟ ",
"لو خيروك |  بين العيش في دراما قد سبق وشاهدتها ماذا تختارين بين الكوميديا والتاريخي؟ ",
"لو خيروك |  بين امتلاك القدرة على تغيير لون شعرك متى تريدين وبين الحصول على مكياج من قبل خبير تجميل وذلك بشكل يومي؟ ",
"لو خيروك |  بين نشر تفاصيل حياتك المالية وبين نشر تفاصيل حياتك العاطفية؟ ",
"لو خيروك |  بين البكاء والحزن وبين اكتساب الوزن؟ ",
"لو خيروك |  بين تنظيف الأطباق كل يوم وبين تحضير الطعام؟ ",
"لو خيروك |  بين أن تتعطل سيارتك في نصف الطريق أو ألا تتمكنين من ركنها بطريقة صحيحة؟ ",
"لو خيروك |  بين إعادة كل الحقائب التي تملكينها أو إعادة الأحذية الجميلة الخاصة بك؟ ",
"لو خيروك |  بين قتل حشرة أو متابعة فيلم رعب؟ ",
"لو خيروك |  بين امتلاك قطة أو كلب؟ ",
"لو خيروك |  بين الصداقة والحب ",
"لو خيروك |  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا؟ ",
"لو خيروك |  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة؟ ",
} 
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
return false
end
if text == "احرف" or text == "حروف" and not database:get(bot_id..'lock:hrof'..msg.chat_id_) then
local texting = {
"ماد بحرف ⇠ ر  ", 
" مدينة بحرف ⇠ ع  ",
" حيوان ونبات بحرف ⇠ خ  ", 
" اسم بحرف ⇠ ح  ", 
" اسم ونبات بحرف ⇠ م  ", 
" دولة عربية بحرف ⇠ ق  ", 
" جماد بحرف ⇠ ي  ", 
" نبات بحرف ⇠ ج  ", 
" اسم بنت بحرف ⇠ ع  ", 
" اسم ولد بحرف ⇠ ع  ", 
" اسم بنت وولد بحرف ⇠ ث  ", 
" جماد بحرف ⇠ ج  ",
" حيوان بحرف ⇠ ص  ",
" دولة بحرف ⇠ س  ",
" نبات بحرف ⇠ ج  ",
" مدينة بحرف ⇠ ب  ",
" نبات بحرف ⇠ ر  ",
" اسم بحرف ⇠ ك  ",
" حيوان بحرف ⇠ ظ  ",
" جماد بحرف ⇠ ذ  ",
" مدينة بحرف ⇠ و  ",
" اسم بحرف ⇠ م  ",
" اسم بنت بحرف ⇠ خ  ",
" اسم و نبات بحرف ⇠ ر  ",
" نبات بحرف ⇠ و  ",
" حيوان بحرف ⇠ س  ",
" مدينة بحرف ⇠ ك  ",
" اسم بنت بحرف ⇠ ص  ",
" اسم ولد بحرف ⇠ ق  ",
" نبات بحرف ⇠ ز  ",
"  جماد بحرف ⇠ ز  ",
"  مدينة بحرف ⇠ ط  ",
"  جماد بحرف ⇠ ن  ",
"  مدينة بحرف ⇠ ف  ",
"  حيوان بحرف ⇠ ض  ",
"  اسم بحرف ⇠ ك  ",
"  نبات و حيوان و مدينة بحرف ⇠ س  ", 
"  اسم بنت بحرف ⇠ ج  ", 
"  مدينة بحرف ⇠ ت  ", 
"  جماد بحرف ⇠ ه  ", 
"  اسم بنت بحرف ⇠ ر  ", 
" اسم ولد بحرف ⇠ خ  ", 
" جماد بحرف ⇠ ع  ",
" حيوان بحرف ⇠ ح  ",
" نبات بحرف ⇠ ف  ",
" اسم بنت بحرف ⇠ غ  ",
" اسم ولد بحرف ⇠ و  ",
" نبات بحرف ⇠ ل  ",
"مدينة بحرف ⇠ ع  ",
"دولة واسم بحرف ⇠ ب  ",
} 
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
return false
end

if text == "كت" or text == "كت تويت" then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n• قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local ktSJJJJ = {
'يهمك ظن الناس فيك ولا ؟','كلمتين تكررها دايم؟!','أغنية عالقة في ذهنك هاليومين؟','إيهما تُفضل حُب ناجح أم صداقة دائمة.؟','يوم لا يمكنك نسيانه؟','مع او ضد الصداقه بعد كره ؟.','‏- كشفت خيانة شريك حياتك دون أن يعلم، كيف تتصرف؟','انت حزين اول شخص تتصل عليه؟','اسوء صفه فيك وتجاهد على تغييرها؟','اسم مشهور فيه بعيلتك؟.','هل انت شخص مادي.؟','دولة تحبها ومنشن شخص تتمنئ يرافقك.؟','غزل بلهجتك ؟','موقف محرج؟.','حب التملك في شخصِيـتك ولا ؟','يومك ضاع على؟','لو الحلال حرام ايش بتسوي؟.','لو زوجتك تاكل تاكل وتحب الاكل وانت مَ تحب تكثر اكل وش بتكون ردة فعلك؟.','كيف تتعامل مع الشخص المُتطفل ( الفضولي ) ؟','شيء يعدل نفسيتك بثواني.؟','تؤمن بالصُدف.؟','اغنيتك المفضلة؟.','لو بكيفي كان ؟','منشن شخص سوالفه حلوه ؟','كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟','حسيت انك ظلمت شخص.؟','ك انجبرت عَ شي؟.','‏- قلّة المال لدى الرجل في هذا الزمن يعتبرها العديد كانها عيب، مع أم ضد؟','نصيحة لكل شخص يذكر أحد بغيابة بالسوء.؟','لو بتغير اسمك ايش بيكون الجديد ؟','هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟','منشن شخص تسمية خوي ومحزم.؟','ردة فعلك لمن يتجاهلك بالرد متعمد؟','نسبة النعاس عندك حاليًا؟','تجامل الناس ولا اللي بقلبك على لسانك؟','نسبة جمال صوتك ؟','وين نلقى السعاده برايك؟','شخص كنت تكرهه بدايه دخولك لهذا البرنامج؟.','شاركنا اقوئ نكتة عندك.؟','تصرُّف ماتتحمله؟','‏- ضيفك تأخر في زيارته، كيف تتخلص منه بطريقة حسنة؟','حبيت وانخذلت؟.','‏- ألوانك المفضّلة؟','- حاجه تتمنى تغيرها في شخصيتك ..؟','عندك غمازات؟.','نصيحة لكل شخص يذكر أحد بغيابة بالسوء.؟','كلمة أخذتها من شخص متعود تقولها.؟','اذا اشتقت تكابر ولا تبادر ؟.','قدوتك من محيطك.؟','صوتك حلو ؟ .','افضل روايه قريتيها؟.','صديق أمك ولا أبوك. ؟','كم في حسابك البنكي ؟','ما السيء في هذه الحياة ؟','وقت فرحك من أول شخص تكلمة.؟','منشن لشخص تحب صوته؟.','وضعيتك وقت النوم؟.','عندك فوبيا او خوف شديد من شيء معين ؟','لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟','كلمة تنرفزك.؟','أنا حزين جداً أجعلني أبتسم.؟','قارئك المُفضل.؟','اغنية عندك معاها ذكريات','اكثر ممثل تحبه ؟','‏- كُنت تمازح أحد أصدقائك ثم بكى بسبب كلمة لم تعرف بأنها تجرحه، ردة فعلك؟','يسكر على أصبعك الباب ولا تعض لسانك  بالغلط؟!','متصالح مع نفسك؟.','حبيبك صوتهه حُلو لمن يغني ولا ماطور؟.','تحب الأطفال؟.','للبنات اكثر شي تكرهينه بعيال التيليجرام؟.','سبب الرحيل.؟','كلامك لأصحاب السب الإلكتروني.؟','اخر كلمة قالها لك حبيبك؟.','تحب القرائه؟.','وش احساسك وانت ولد بحساب بنت؟.', '‏- لو خيروك، الزواج بمن تُحب 💍 أو تأخذ مليون دولار💰؟','الفلوس او الحب ؟','- حاجه تتمنى تغيرها في شخصيتك ..؟','تستغل وقت فراغك ب ايش ؟.','انت جيد كم في المئة.؟','شاركنا صورة احترافية من تصويرك؟','تاريخ ميلادك؟','موهبة تفوز بمدح الناس لك.؟','- مستعد أتقبل كل شيء إلا ....؟','أصعب صفة قد تتواجد في الرجل .؟','كلامك للمتنمرين الكترونياً وواقعياً.؟','لو تصير رئيس دولة ليوم وش اول شيء بتسوية.؟','عبّر عن مودك بصوره ؟','افضل قناة تتابعها في التيليجرام  ..؟','منشن شخص ماينبلع.؟','شخصيتك اجتماعيه ولا منعزله؟.','مع أو ضد لو كان خيراً لبقئ.؟','كم مدئ سوء الفاظك؟.','كم تحتاج من وقت لتثق بشخص؟','الزمن الجميل او عصر التكنلوجيا.؟','متى حدث التغيير الكبير والملحوظ في شخصيتك؟','حضرتي عرس وأكتشفتي العروس حبيبك وش ردة فعلك.؟','يهمك ظن الناس فيك ولا ؟','وقفة أحترام لشخص ألكتروني " منشن".؟','- "منشن" للشخصيه معجب بها في التليجرام!!','نسبه الندم عندك للي وثقت فيهم ؟','‏- شيء مستحيل يتغير فيك؟','اكثر مشروب تحبه؟','القصيدة اللي تأثر فيك؟','‏- تصرف لا تتحمله حتى لو كان من أقرب شخص لقلبك؟','أنا حزين جداً أجعلني أبتسم.؟','‏- مشتاق؟','قهوه و لا شاي؟','الصراحة وقاحة ولا صدق تعامل.؟','‏','- أجمل صفة إنسانية؟.','ما أكثر تطبيق تقضي وقتك عليه؟','قلبي على قلبك مهما صار لمين تقولها؟','‏لوخيروك | الاكل ولاا النت ؟!','وش احساسك وانت ولد بحساب بنت؟.','السعاده بالنسبه لك تكون على هيئة...؟','وضعيتك وقت النوم؟.','اكثر المتابعين عندك باي برنامج؟','حيوانك المفضل؟','يسكر على أصبعك الباب',' ولا تعض لسانك  بالغلط؟!','منشن شخص سوالفه حلوه ؟','منشن ٣ أشخاص وأقنعهم يحذفون التلي نهائياً.؟','انت حزين اول شخص تتصل عليه؟','أقدم شيء محتفظ فيه من صغرك؟','"منشن" لَ اكثر شخص تحبه موجود معانا؟.','كلمتين تكررها دايم؟!','‏- تقبل بالعودة لشخص كسر قلبك مرتين؟','تتمنى  تِمسك يد شخص، ومن هو؟.','سبب الرحيل.؟','أكثر شيء تقدره في الصداقات؟','عندك فوبيا او خوف شديد من شيء معين ؟','أتمنى اكون بعد عشر سنين في ........؟','لو بكيفي كان ؟','‏ هل يوجد صديق حقيقي في هذا الزمن؟','احقر موقف صار لك؟.','‏أكثر نوع من الحلويات مفضّل لك.؟','‏- ألوانك المفضّلة؟','شخص تتمنئ له الموت؟.','‏- تفضل جولة في الغابة أم جولة بحرية؟','مهنه أو وظيفه ودك تجربها .؟','بماذا يتعافى المرء؟','اذا اشتقت تكابر ولا تبادر ؟.','أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟','في زمن الجميع يبحث فيه عن المال عن ماذا تبحث؟!','‏بالنسبه لك ، الطلعه الحلوه يحكمها المكان أو الأشخاص اللي معك .؟','‏- لو امتلكت العصا السحرية ليوم واحد، ماذا ستفعل؟','من الاشياء اللي تجيب لك الصداع ؟','شيء تعترف انك فاشل فيه ؟','تملك وسواس من شيء معين ؟','نصيحة لكل شخص يذكر أحد بغيابة بالسوء.؟','وش رايك بالزواج المبكر ؟','‏- اسم او منشن شخص لا ترتاح في يومك إلا إذا حادثته؟','لو انظلم أحد قدامك تدافع عنه ولا تطنش.؟','موقف محرج ماتنساه ؟','كلمه ل أكثر خروف/ه قابلتهه بحياتك؟.','وش أخر شي ضيعته؟','ماذا لو كانت مشاعر البشر مرئية ؟','ما السيء في هذه الحياة ؟','كلمة غريبة ومعناها؟','أتمنى له كسراً لاجبر له عبارة عميقة هل تمنيتها لأحد.؟','اسوء صفه فيك وتجاهد على تغييرها؟','‏','- نهارك يصير أجمل بوجود ..؟','اكثر كلمة ترفع ضغطك ؟','على نياتكُم تُرزقون منشن تيكن ينطبق علية هذا الشيء.؟','أكثر تغيير ترغب أن تغيّره في نفسك؟','لو حرام حلال ايش بتسوي؟.','ماذا لو عاد معتذراً؟','للإناث | ماذا تفضّلين أن تكون مهنة شريك حياتك المستقبلي.؟','أشد أنواع الانتقام بعد أن يتجاهلنا الأحبة؟','هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟','تمحي العشرة الطيبة عشان موقف ماعجبك أو سوء فهم.؟','قارئك المُفضل.؟','تخطط للمستقبل ولا ؟','تسامح شخص سبب في بكائك.؟','لو عندك امنيه وبتحقق وش هي؟.','غزل بلهجتك ؟','موقف غير حياتك؟','كيف تحد الدولة من الفقر المُتزايد.؟','المطوعة والعاقلة من شلتك.؟','ما الذي يشغل بالك في الفترة الحالية؟','- ‏الاعتذار قوة ولا ضعف؟','نسبة النعاس عندك حاليًا؟','"منشن" لاوسخ،عقل؟.','اول ولد لك وش راح تسميه ؟','كيف تعرف ان الشخص الي قدامك خروف؟.','راضي بحُب التملك؟.','مسلسل كرتوني له ذكريات جميلة عندك؟','لو اخذوك مستشفى المجانين كيف تثبت لهم انك صاحي ؟','جعل ضيقتن مرت عليه تمرني "منشن".؟','كلمة تقولها لكل شخص منافق.؟','وين نلقى السعاده برايك؟','إلصق اخر شيء نسخته .','شعورك لما تشوف صورك وأنت صغير.؟','أغنية عالقة في ذهنك هاليومين؟','لو حصل واشتريت جزيرة، ماذا ستختار اسمًا لها.؟','وش اسم اول شخص تعرفت عليه فالتلقرام ؟','العين الي تستصغرك........؟','وش كان لقبك بالبيت وانت صغير 😂؟','كم عمرك.؟','آخر شيء بحثت عنه في Google.؟','ما هو الشيء الذي لا يستطيع قلبك مقاومته.؟','عادي تتزوج من برا القبيلة؟','مع او ضد مقولة ( محد يدوم ل احد ) ؟','تحضُن المخده وقت نومك؟.','يارب ........؟','أكثر اكلهه تحبها؟.','شاركنا اقوئ نكتة عندك.؟','لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟','ـ هالفترة أحس اني محتاج ....؟','مصروفك كم؟.','اكثر ممثل تحبه ؟','‏- منشن شخص لديك لا تخفي عنه شيئًا!','تقطع علاقتك بالشخص إذا عرفت إنه...؟','"منشن" لصديقك المُقرب؟.','‏- كشفت خيانة شريك حياتك دون أن يعلم، كيف تتصرف؟','وش رايك بصداقة البنت والولد إلكترونياً؟.','من بنفسك تبوس هذي اللحظة؟.','ماذا لو عاد مُشتاقاً.؟','قولها بلهجتك " لا أملك المال ".؟','تجامل الناس ولا اللي بقلبك على لسانك؟','ك انجبرت عَ شي؟.','يوم لا يمكنك نسيانه؟','اكثر سؤال سألته لنفسك اليوم.؟','قرارتك راضي عنها ام لا ؟','متى يصبح الصديق غريب؟','‏- شخصية لا تستطيع تقبلها؟','كلمة لشخص بعيد؟','‏','- أجمل صفة إنسانية؟.','ك احد رفضك؟.','افضل تخصص جامعي تتمناه.؟','متصالح مع نفسك؟.','‏- لو اكتشفت أن الذي تحبه يخونك، كيف تتصرف؟','اسم معلم ترك اثراً جميل عليك رغم قسوتة.؟','ماهي الهدية التي تتمنى أن تنتظرك يومًا أمام باب منزلك؟','شعورك لما تشوف صورك وأنت صغير ؟','‏كلما ازدادت ثقافة المرء ازداد بؤسه" تتفق.؟','حب التملك في شخصِيـتك ولا ؟','شخص كنت تكرهه بدايه دخولك لهذا البرنامج؟.','لماذا الأشياء التي نريدها بشغف تأتي متأخرة؟','‏ما هو الشعور الذي يسكن في بالك الآن.؟','إيموجي يعبّر عن مزاجك الحالي؟','ما هو الأصعب بالنسبة لك؟ ','١. حفظ السر؟ ','٢. كتم الضحكة؟ ','٣. حبس الدموع؟','كم في حسابك البنكي ؟','حبيبك صوتهه حُلو لمن يغني ولا ماطور؟.','مع أو ضد السماجة.؟','‏- الغروب أم الشروق؟','من أصحاب النسيان او التجاوز رغم الذكرى.؟','مع أو ضد الحب بعد الزواج.؟','‏- آخر العنقود في عائلتك، ولد أم بنت؟','اهل أمك او أبوك.؟','احقر شخص قابلته بحياتك؟.','اسم ماتحبه ؟','نصيحه تبدا ب -لا- ؟','‏أيهما تختار أن يقودك :القلب - العقل؟','من طلاسم لهجتكم ؟','تحب الأطفال؟.','‏ تكره أحد من قلبك ؟','اي شعور اقسى الشوق ولا الغيره؟.','بامكانك تنزع شعور من قلبك للابد ، ايش هو؟.','متى تقرر تنسحب من أي علاقة ؟','اكثر صداقة دامت لك؟.','آخر شيء ندمت عليه؟','اغنية عندك معاها ذكريات','يسكر على أصبعك الباب',' ولا تعض لسانك  بالغلط؟!','‏- شاركنا صورة لمنظر مفضّل لديك؟','منشن شخص تسمية خوي ومحزم.؟','أكثر حيوان تخاف منه؟','كلمه لشخص خانك!؟.','تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته','أكلة مستحيل أن تأكلها؟','موقف خلاك تحس انك مكسور ؟','كلمة أخذتها من شخص متعود تقولها.؟','"منشن" لشخص مشتاق لحضنه؟.','‏- ضيفك تأخر في زيارته، كيف تتخلص منه بطريقة حسنة؟','‏- شيء تحب أن يشاركك الآخرون فيه؟','دولة تحبها ومنشن شخص تتمنئ يرافقك.؟','نسبة جمال صوتك ؟','"منشن" لشخص تحب صوته؟.','العِيون نصف الجمال مع,ضد ؟.','مع او ضد سب البنت للدفاع عن نفسها.؟','يسكر على أصبعك الباب',' ولا تعض لسانك  بالغلط؟!','عندك الشخص الي مستعد يوقف ضد العالم عشانك.؟','أكمل الدعاء بما شئت ‏اللهم أرزقني ..؟','تزعلك الدنيا ويرضيك ؟','عادةً تُحب النقاش الطويل أم تحب الاختصار؟'
}
ktbrok = math.random(#ktSJJJJ)
send(msg.chat_id_, msg.id_, ktSJJJJ[ktbrok]) 

end


if text == 'تفعيل ردود البوت' and Owner(msg) then
database:del(bot_id..'Mega:TextReply:Mute'..msg.chat_id_)
send(msg.chat_id_, msg.id_,'• ︙تم تفعيل ردود البوت')
return false
end

if text == 'تعطيل ردود البوت' and Owner(msg) then
database:set(bot_id..'Mega:TextReply:Mute'..msg.chat_id_,true)
send(msg.chat_id_, msg.id_,'• ︙تم تعطيل ردود البوت')
return false
end

if text == 'شلونكم' then
TextReply = 'تـمـام عمࢪيي نتا ڪيفڪ💘💋'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'شلونك' then
TextReply = 'عمࢪࢪيي قـميـل بخيࢪ اذا حـلو بخيࢪ💘🙊'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'تمام' then
TextReply = 'تـدوم عمࢪيي💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'هلاو' then
TextReply = 'هـلاوات عمࢪيي مـسيو وايـد قـسم💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == '😐' then
TextReply = 'شـبي حـلـو صـافـن😻💋'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'هاي' then
TextReply = 'هـايـات يلصاڪ نـوࢪتـنـا💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'اريد اكبل' then
TextReply = 'امـشي وخࢪ مـنـا يدوࢪ تـڪـبيل😏'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'لتزحف' then
TextReply = 'شـعليڪ بـي عمࢪيي خـلي يـزحف💘☹️'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'كلخرا' then
TextReply = 'اسـف عمࢪيي مـا خليڪ بـحـلڪي😹💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'زاحف' then
TextReply = 'زاحـف ع خـالـڪ شـڪࢪه🤤💋'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'دي' then
TextReply = 'امـشـيڪ بـيها عمࢪيي😗😹'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'فرخ' then
TextReply = 'ويـنـه بـلـه خـل حـصـࢪه😹🤤'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'تعالي خاص' then
TextReply = 'هااا يـول اخـذتـها خـاص😹🙊'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'اكرهك' then
TextReply = 'عـساس انـي مـيـت بيڪڪ دمـشـي لڪ😿😹'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'احبك' then
TextReply = 'يـحـياتـي وانـي هـم حـبـڪڪ🙈💋'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'باي' then
TextReply = 'ويـن دايـح عمࢪيي خـلـينـا مـونـسـيـن🥺💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'عوائل' then
TextReply = 'حـبيـبي ولله ࢪبـط فـيـشه ويـانـا🙈💋'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'صايره عوائل' then
TextReply = 'عمࢪيي الـحلـو انـي ويـاڪ نـسـولف🥺😻'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'واكف' then
TextReply = 'شـغال عمࢪيي🤓💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'وين المدير' then
TextReply = 'عمࢪيي تـفـضل وياڪ مـديـࢪ💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'انجب' then
TextReply = 'صـاࢪ عمࢪيي💘🥺'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'تحبني' then
TextReply = 'سـؤال صـعـب خلـيـني افڪࢪ☹️'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == '🌚' then
TextReply = 'ڪمࢪ اسـود🤕💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == '🙄' then
TextReply = 'نـزل عيونڪ عمࢪيي😿💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end
if text == '😒' then
TextReply = 'شـبيڪ عمࢪيي مـنـو مـضـوجڪ😣💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == '😳' then
TextReply = 'هـا بـس لاشـفـت جـنـي😳😹'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == '🙁' then
TextReply = 'تـعال عمࢪي تـعـال شڪيلي همومڪ😦💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == '🚶💔' then
TextReply = 'ويـن ࢪايح عمࢪيي تـعـال🥺💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == '🙂' then
TextReply = 'ثـڪـيـل الصاڪڪ🙊💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == '🌝' then
TextReply = 'مـنـوࢪࢪ عمࢪيي طـالع تـخـبل😻💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'صباحو' then
TextReply = 'صـباح قـشطه واللوز للحـلو??🙊'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'صباح الخير' then
TextReply = 'يـمـه فـديـت صباحڪ 💋🙈'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'كفو' then
TextReply = 'ڪـفـو مـنڪ عمࢪيي💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end
if text == '😌' then
TextReply = 'والمـطـلـوب شࢪايد😤💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'اها' then
TextReply = 'قـابـل غشڪ عمࢪيي💋😽'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'شسمج' then
TextReply = 'اسـمـي احـلاهـن واتـحداهـن😹😹💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'شسمك' then
TextReply = 'اسـمـي صڪاࢪ بـنـات😗💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'شوف' then
TextReply = 'شـشـوف عمࢪيي😳💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'مساء الخير' then
TextReply = 'مسـآء الـياسـمين💋??'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'المدرسه' then
TextReply = 'لاجـيـب اسـمـها لاسـطࢪڪ😏😹'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'منو ديحذف رسائلي' then
TextReply = 'منـشـئ للڪࢪوب حـذفـهـن عمࢪيي💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'البوت واكف' then
TextReply = 'لـجذب بـعدنـي شـغال😏💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'غلس' then
TextReply = 'ماغـلـس لـو تـمـوت😗💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'حارة' then
TextReply = 'اي ولله ڪلش حـاࢪا🥺💋'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'هههه' then
TextReply = 'ضڪه تࢪد ࢪوح دايـمه عمغࢪيي🙈💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'ههههه' then
TextReply = 'فـدوا عـساا دوم💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == '😹' then
TextReply = 'فـدوا هـل ضحڪه💘🙊'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'وين' then
TextReply = 'باࢪض الله الـواسـعـه💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'كافي لغوة' then
TextReply = 'ولله بڪيفي نـتـه شـعـليڪ😏💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'نايمين' then
TextReply = 'اني سـهࢪان حـࢪسـڪم🤕💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'اكو احد' then
TextReply = 'اي عمࢪيي انـي مـوجود🙈💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'فديت' then
TextReply = 'حـبـيبـي ولله فـداڪ عمࢪيي💘🙊'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'شكو' then
TextReply = 'ڪلـشي ماڪو ࢪجع نام عمࢪيي☹️💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'اوف' then
TextReply = 'اوف يـࢪوحـي شبيڪ ضـايـج💘🥺'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'احبج' then
TextReply = 'جـذاب تࢪا يـضـحڪ علـيـج😼💘'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end

if text == 'انتة منو' then
TextReply = 'اني بـوت عمࢪيي💘🙊'
send(msg.chat_id_, msg.id_,'['..TextReply..']')
return false
end



if text == "مبرمج السورس" or text == "مطور السورس" or text == "وين المبرمج" or text == "المبرمج" then   
   
Text = "\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n• [Developer 𝚂𝚘𝚞𝚛𝚌𝚎 .](http://t.me/MMSSDS) •\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'Developer 𝚂e𝚞𝚛𝚌𝚎 .',url="t.me/Mmssds"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/MMSSDS&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end






if text == ("تصفيه") and msg.reply_to_message_id_ == 0 and BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,"*\n• تم تصفيه جميع الرتب  \n*")
database:del(bot_id.."Mega:Constructor"..msg.chat_id_)
database:del(bot_id.."Mega:Manager"..msg.chat_id_)
database:del(bot_id.."Mega:Mod:User"..msg.chat_id_)
database:del(bot_id.."Mega:Special:User"..msg.chat_id_)
end




if text and text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده الحساب'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end




if (msg.content_.animation_) or (msg.content_.photo_) or (msg.content_.video_) or (msg.content_.document) or (msg.content_.sticker_) or (msg.content_.voice_) or (msg.content_.audio_) and msg.reply_to_message_id_ == 0 then      
database:sadd(bot_id.."Mega:allM"..msg.chat_id_, msg.id_)
end
if (msg.content_.text_) or (msg.content_.animation_) or (msg.content_.photo_) or (msg.content_.video_) or (msg.content_.document) or (msg.content_.sticker_) or (msg.content_.voice_) or (msg.content_.audio_) then
if database:get(bot_id.."y:msg:media"..msg.chat_id_) then    
local gmedia = database:scard(bot_id.."Mega:allM"..msg.chat_id_)  
if gmedia == 200 then
local liste = database:smembers(bot_id.."Mega:allM"..msg.chat_id_)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "• تم مسح "..k.." من الوسائط تلقائيا\n• يمكنك تعطيل الميزه بستخدام الامر ( `تعطيل المسح التلقائي` )"
DeleteMessage(msg.chat_id_,{[0]=Mesge})
end
end
send(msg.chat_id_, msg.id_, t)
database:del(bot_id.."Mega:allM"..msg.chat_id_)
end
end
end



if text == "تنظيف التعديل" or text == "امسح" then
Msgs = {[0]=msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Msgs[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data)
new = 0
Msgs2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Msgs2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Msgs2)
end,nil)  
send(msg.chat_id_, msg.id_,'*• تم تنظيف جميع الرسائل المعدله*')
end


  if text == 'كشف' and tonumber(msg.reply_to_message_id_) > 0 then
   function Function_Mega(extra, result, success)
      tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
         if data.first_name_ == false then
         send(msg.chat_id_, msg.id_,'•  الحساب محذوف لا توجد معلوماته ')
         return false
         end
         if data.username_ then
         UserName_User = '@'..data.username_
         else
         UserName_User = 'لا يوجد'
         end
         local Id = data.id_
         local Status_Gps = database:get(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..Id) or Get_Rank(Id,msg.chat_id_)
         send(msg.chat_id_, msg.id_,'• ايديه - '..Id..'\n• معرفه - ['..UserName_User..']\n• رتبته - '..Status_Gps..'\n•  نوع الكشف : بالرد - ') 
      end,nil)
   end
   tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
   return false
   end
   
   if text and text:match("^كشف @(.*)$") then
   local username = text:match("^كشف @(.*)$")
   function Function_Mega(extra, result, success)
   if result.id_ then
   tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
   if data.username_ then
   UserName_User = '@'..data.username_
   else
   UserName_User = 'لا يوجد'
   end
   local Id = data.id_
   local Status_Gps = database:get(bot_id.."Mega:Comd:New:rt:User:"..msg.chat_id_..Id) or Get_Rank(Id,msg.chat_id_)
   send(msg.chat_id_, msg.id_,'• ايديه - '..Id..'\n• معرفه - ['..UserName_User..']\n• رتبته - '..Status_Gps..'\n•  نوع الكشف : بالمعرف - ') 
   end,nil)   
   else
   send(msg.chat_id_, msg.id_,'• لا يوجد حساب بهاذا المعرف')
   end
   end
   tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
   return false
   end




if text == "القناة" or text == "قناة السورس" then

Text = "\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n• [𝙲𝚑𝚊𝚗𝚗𝚎𝚕 𝚂𝚘𝚞𝚛𝚌𝚎](http://t.me/TeAm_VeCto)"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝙲𝚑𝚊𝚗𝚗𝚎𝚕 𝚂𝚘𝚞𝚛𝚌𝚎',url="t.me/TeAm_VeCto"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/TeAm_VeCto&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end




if text == 'ايديي' then
send(msg.chat_id_, msg.id_,' *• ايديك ↺* '..msg.sender_user_id_)
end

if text == "الساعه" then
local yytesj20 = "\n الساعه الان : "..os.date("%I:%M%p")
send(msg.chat_id_, msg.id_,yytesj20)
end

if text == "التاريخ" then
local cfhoog =  "\n التاريخ : "..os.date("%Y/%m/%d")
send(msg.chat_id_, msg.id_,cfhoog)
end


if text == 'رقمي' then   
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_ then
one_nu = "•  رقمك {`"..(result.phone_number_).."`}"
else
one_nu = "• تم وضع رقمك لجهاتك اتصالك فقط"
end      
send(msg.chat_id_, msg.id_,one_nu) 
end,nil)
end 




if text and text:match("^(.*)$") then
if database:get(bot_id.."botss:Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '\nارسل لي الكلمه الان ')
database:set(bot_id.."botss:Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_, "true1")
database:set(bot_id.."botss:Mega:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:sadd(bot_id.."botss:Mega:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."botss:Mega:Set:On"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_,"تم حذف الرد من ردود المتعدده")
database:del(bot_id..'botss:Mega:Add:Rd:Sudo:Text'..text)
database:del(bot_id..'botss:Mega:Add:Rd:Sudo:Text1'..text)
database:del(bot_id..'botss:Mega:Add:Rd:Sudo:Text2'..text)
database:del(bot_id.."botss:Mega:Set:On"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."botss:Mega:List:Rd:Sudo", text)
return false
end
end
if text == ("مسح الردود المتعدده") and DevMega(msg) then
 
local list = database:smembers(bot_id.."botss:Mega:List:Rd:Sudo")
for k,v in pairs(list) do  
database:del(bot_id.."botss:Mega:Add:Rd:Sudo:Text"..v) 
database:del(bot_id.."botss:Mega:Add:Rd:Sudo:Text1"..v) 
database:del(bot_id.."botss:Mega:Add:Rd:Sudo:Text2"..v)   
database:del(bot_id.."botss:Mega:List:Rd:Sudo")
end
send(msg.chat_id_, msg.id_,"تم حذف ردود المتعدده")
end
if text == ("الردود المتعدده") and DevMega(msg) then
 
local list = database:smembers(bot_id.."botss:Mega:List:Rd:Sudo")
text = "\nقائمة ردود المتعدده \n━━━━━━━━\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => {"..v.."} => {"..db.."}\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده"
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text == "اضف رد متعدد" and DevMega(msg) then
 
database:set(bot_id.."botss:Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return send(msg.chat_id_, msg.id_,"ارسل الرد الذي اريد اضافته")
end
if text == "حذف رد متعدد" and DevMega(msg) then
 
database:set(bot_id.."botss:Mega:Set:On"..msg.sender_user_id_..":"..msg.chat_id_,true)
return send(msg.chat_id_, msg.id_,"ارسل الان الكلمه لحذفها ")
end
if text then  
local test = database:get(bot_id.."botss:Mega:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."botss:Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:set(bot_id.."botss:Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:Mega:Add:Rd:Sudo:Text"..test, text)  
end  
send(msg.chat_id_, msg.id_,"تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = database:get(bot_id.."botss:Mega:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."botss:Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "rd1" then
database:set(bot_id.."botss:Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:Mega:Add:Rd:Sudo:Text1"..test, text)  
end  
send(msg.chat_id_, msg.id_,"تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = database:get(bot_id.."botss:Mega:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."botss:Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "rd2" then
database:set(bot_id.."botss:Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:Mega:Add:Rd:Sudo:Text2"..test, text)  
end  
send(msg.chat_id_, msg.id_,"تم حفظ الرد")
return false  
end  
end
if text then
local Text = database:get(bot_id.."botss:Mega:Add:Rd:Sudo:Text"..text)   
local Text1 = database:get(bot_id.."botss:Mega:Add:Rd:Sudo:Text1"..text)   
local Text2 = database:get(bot_id.."botss:Mega:Add:Rd:Sudo:Text2"..text)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
send(msg.chat_id_, msg.id_,texting[Textes])
end
end


if text == 'معلومات السيرفر' or text == "السيرفر" and DevMega(msg) then 
send(msg.chat_id_, msg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '⇗ نظام التشغيل ⇖•\n*»» '"$linux_version"'*' 
echo '*———————————~*\n•✔{ الذاكره العشوائيه } ⇎\n*»» '"$memUsedPrc"'*'
echo '*———————————~*\n•✔{ وحـده الـتـخـزيـن } ⇎\n*»» '"$HardDisk"'*'
echo '*———————————~*\n•✔{ الـمــعــالــج } ⇎\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*———————————~*\n•✔{ الــدخــول } ⇎\n*»» '`whoami`'*'
echo '*———————————~*\n•✔{ مـده تـشغيـل الـسـيـرفـر }⇎\n*»» '"$uptime"'*'
]]):read('*all'))  
end


if text == "تعطيل المسح التلقائي" and Owner(msg) then        
database:del(bot_id.."y:msg:media"..msg.chat_id_)
Reply_Status(msg,msg.sender_user_id_,"lock",'• تم تعطيل المسح التلقائي للميديا')
return false
end 
if text == "تفعيل المسح التلقائي" and Owner(msg) then        
database:set(bot_id.."y:msg:media"..msg.chat_id_,true)
Reply_Status(msg,msg.sender_user_id_,"lock",'• تم تفعيل المسح التلقائي للميديا')
return false
end 


if text == "الاوامر المضافه" and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_.."")
t = "*• قائمه الاوامر المضافه  \n \n*"
for k,v in pairs(list) do
Cmds = database:get(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."- ("..v..") ~ {"..Cmds.."}\n"
else
t = t..""..k.."- ("..v..") \n"
end
end
if #list == 0 then
t = "*• لا توجد اوامر اضافيه*"
end
send(msg.chat_id_, msg.id_,"["..t.."]")
end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then 
local list = database:smembers(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
database:del(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"• تم مسح جميع الاوامر التي تم اضافتها")  
end
end
if text == "اضف امر" and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"• الان ارسل لي الامر القديم ..")  
return false
end
if text == "حذف امر" or text == "مسح امر" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:set(bot_id.."Mega:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"• ارسل الامر الذي قم بوضعه بدلا عن القديم")  
return false
end
end
if text == ("رفع منظف") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لا تستطيع رفع احد وذالك لان تم تعطيل الرفع من قبل المنشئين')
return false
end
function Function_Mega(extra, result, success)
database:sadd(bot_id.."Mega:MN:TF"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم رفعه منظف للقروب")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^رفع منظف @(.*)$") and BasicConstructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^رفع منظف @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Mega:MN:TF"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم رفعه منظف للقروب")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^رفع منظف (%d+)$") and BasicConstructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^رفع منظف (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'• لا تستطيع رفع احد وذالك لان تم تعطيل الرفع من قبل المنشئين')
return false
end
database:sadd(bot_id.."Mega:MN:TF"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم رفعه منظف للقروب")  
return false
end
if text == ("تنزيل منظف") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
database:srem(bot_id.."Mega:MN:TF"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تنزيله من منظفيه القروب")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل منظف @(.*)$") and BasicConstructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^تنزيل منظف @(.*)$") 
function Function_Mega(extra, result, success)
if result.id_ then
database:srem(bot_id.."Mega:MN:TF"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","• تم تنزيله من منظفيه القروب")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل منظف (%d+)$") and BasicConstructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^تنزيل منظف (%d+)$")
database:srem(bot_id.."Mega:MN:TF"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","• تم تنزيله من منظفيه القروب")  
return false
end

if text == "الصلاحيات" and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."Mega:Coomds"..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_,"• لا توجد صلاحيات مضافه")
return false
end
t = "\n• قائمة الصلاحيات المضافه \n━━━━━━━━━━━━━\n"
for k,v in pairs(list) do
var = database:get(bot_id.."Mega:Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..""..k.."- "..v.." ~ ("..var..")\n"
else
t = t..""..k.."- "..v.."\n"
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "مسح المنظفين" and BasicConstructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:MN:TF"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "•  تم مسح  قائمة المنظفين  ")
end
if text == ("المنظفين") and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."Mega:MN:TF"..msg.chat_id_)
t = "\n• قائمة المنظفين \n \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد منظفين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == "مسح الصلاحيات" then
local list = database:smembers(bot_id.."Mega:Coomds"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."Mega:Comd:New:rt:bot:"..v..msg.chat_id_)
database:del(bot_id.."Mega:Coomds"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"• تم مسح الصلاحيات")
end
if text and text:match("^اضف صلاحيه (.*)$") and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
ComdNew = text:match("^اضف صلاحيه (.*)$")
database:set(bot_id.."Mega:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
database:sadd(bot_id.."Mega:Coomds"..msg.chat_id_,ComdNew)  
database:setex(bot_id.."Mega:Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, "• ارسل نوع الصلاحيه ⌔\n• (عضو ~ مميز  ~ ادمن  ~ مدير )") 
end
if text and text:match("^مسح صلاحيه (.*)$") and Addictive(msg) or text and text:match("^حذف صلاحيه (.*)$") and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
ComdNew = text:match("^مسح صلاحيه (.*)$") or text:match("^حذف صلاحيه (.*)$")
database:del(bot_id.."Mega:Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, "• تم مسح الصلاحيه ") 
end
if database:get(bot_id.."Mega:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,"• تم الغاء الامر ") 
database:del(bot_id.."Mega:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_"• ارسل نوع الصلاحيه مره اخر\n• تستطيع اضافة صلاحيه (عضو ~ مميز  ~ ادمن )") 
return false
end
end
if text == "ادمن" then
if not Owner(msg) then 
send(msg.chat_id_, msg.id_"• ارسل نوع الصلاحيه مره اخر\n• تستطيع اضافة صلاحيه ( عضو ~ مميز )") 
return false
end
end
if text == "مميز" then
if not Addictive(msg) then
send(msg.chat_id_, msg.id_"• ارسل نوع الصلاحيه مره اخر\n• تستطيع اضافة صلاحيه ( عضو )") 
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" or text == "رفع نبي" then
local textn = database:get(bot_id.."Mega:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
database:set(bot_id.."Mega:Comd:New:rt:bot:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, "• تم اضافة صلاحية ") 
database:del(bot_id.."Mega:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("^تغير رد المطور (.*)$") and Owner(msg) then
local Text = text:match("^تغير رد المطور (.*)$") 
database:set(bot_id.."Mega:Sudo:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_,"•  تم تغير رد المطور الى ↺"..Text)
end
if text and text:match("^تغير رد المنشئ الاساسي (.*)$") and Owner(msg) then
local Text = text:match("^تغير رد المنشئ الاساسي (.*)$") 
database:set(bot_id.."Mega:BasicConstructor:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_,"•  تم تغير رد المنشئ الاساسي الى ↺"..Text)
end
if text and text:match("^تغير رد المنشئ (.*)$") and Owner(msg) then
local Text = text:match("^تغير رد المنشئ (.*)$") 
database:set(bot_id.."Mega:Constructor:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_,"•  تم تغير رد المنشئ الى ↺"..Text)
end
if text and text:match("^تغير رد المدير (.*)$") and Owner(msg) then
local Text = text:match("^تغير رد المدير (.*)$") 
database:set(bot_id.."Mega:Manager:Rd"..msg.chat_id_,Text) 
send(msg.chat_id_, msg.id_,"•  تم تغير رد المدير الى ↺"..Text)
end
if text and text:match("^تغير رد الادمن (.*)$") and Owner(msg) then
local Text = text:match("^تغير رد الادمن (.*)$") 
database:set(bot_id.."Mega:Mod:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_,"•  تم تغير رد الادمن الى ↺"..Text)
end
if text and text:match("^تغير رد المميز (.*)$") and Owner(msg) then
local Text = text:match("^تغير رد المميز (.*)$") 
database:set(bot_id.."Mega:Special:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_,"•  تم تغير رد المميز الى ↺"..Text)
end
if text and text:match("^تغير رد العضو (.*)$") and Owner(msg) then
local Text = text:match("^تغير رد العضو (.*)$") 
database:set(bot_id.."Mega:Memp:Rd"..msg.chat_id_,Text)
send(msg.chat_id_, msg.id_,"•  تم تغير رد العضو الى ↺"..Text)
end


if text == ("مسح ردود المدير") and BasicConstructor(msg) then
local list = database:smembers(bot_id.."Mega:List:Manager"..msg.chat_id_.."")
for k,v in pairs(list) do
database:del(bot_id.."Mega:Add:Rd:Manager:AudioCa"..v..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:FileCa"..v..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:VideoCa"..v..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:PhotoCa"..v..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:VicoCa"..v..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:GifCa"..v..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:Gif"..v..msg.chat_id_)   
database:del(bot_id.."Mega:Add:Rd:Manager:Vico"..v..msg.chat_id_)   
database:del(bot_id.."Mega:Add:Rd:Manager:Stekrs"..v..msg.chat_id_)     
database:del(bot_id.."Mega:Add:Rd:Manager:Text"..v..msg.chat_id_)   
database:del(bot_id.."Mega:Add:Rd:Manager:Photo"..v..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:Video"..v..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:File"..v..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:Audio"..v..msg.chat_id_)
database:del(bot_id.."Mega:List:Manager"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"• تم مسح ردود المدير")
end
if text == ("ردود المدير") and Owner(msg) then
local list = database:smembers(bot_id.."Mega:List:Manager"..msg.chat_id_.."")
text = "• قائمه ردود المدير \n \n"
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:Gif"..v..msg.chat_id_) then
db = "متحركه 🎭"
elseif database:get(bot_id.."Mega:Add:Rd:Manager:Vico"..v..msg.chat_id_) then
db = "بصمه 📢"
elseif database:get(bot_id.."Mega:Add:Rd:Manager:Stekrs"..v..msg.chat_id_) then
db = "ملصق ⌔"
elseif database:get(bot_id.."Mega:Add:Rd:Manager:Text"..v..msg.chat_id_) then
db = "رساله ✉"
elseif database:get(bot_id.."Mega:Add:Rd:Manager:Photo"..v..msg.chat_id_) then
db = "صوره ⌔"
elseif database:get(bot_id.."Mega:Add:Rd:Manager:Video"..v..msg.chat_id_) then
db = "فيديو 📹"
elseif database:get(bot_id.."Mega:Add:Rd:Manager:File"..v..msg.chat_id_) then
db = "ملف ⌔"
elseif database:get(bot_id.."Mega:Add:Rd:Manager:Audio"..v..msg.chat_id_) then
db = "اغنيه 🎵"
end
text = text..""..k..">> ("..v..") ↺ {"..db.."}\n"
end
if #list == 0 then
text = "• لا يوجد ردود للمدير"
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."Mega:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_.."")
if database:get(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."Mega:Add:Rd:Manager:Stekrs"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."Mega:Add:Rd:Manager:Vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."Mega:Add:Rd:Manager:VicoCa"..test..msg.chat_id_, rtr)  
end
end     
if msg.content_.animation_ then   
database:set(bot_id.."Mega:Add:Rd:Manager:Gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."Mega:Add:Rd:Manager:GifCa"..test..msg.chat_id_, rtr)  
end
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."Mega:Add:Rd:Manager:Text"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."Mega:Add:Rd:Manager:Audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."Mega:Add:Rd:Manager:AudioCa"..test..msg.chat_id_, rtr)  
end
end  
if msg.content_.document_ then
database:set(bot_id.."Mega:Add:Rd:Manager:File"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."Mega:Add:Rd:Manager:FileCa"..test..msg.chat_id_, rtr)  
end
end  
if msg.content_.video_ then
database:set(bot_id.."Mega:Add:Rd:Manager:Video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."Mega:Add:Rd:Manager:VideoCa"..test..msg.chat_id_, rtr)  
end
end  
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."Mega:Add:Rd:Manager:Photo"..test..msg.chat_id_, photo_in_group)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."Mega:Add:Rd:Manager:PhotoCa"..test..msg.chat_id_, rtr)  
end
end  
send(msg.chat_id_, msg.id_,"• تم حفظ الرد بنجاح")
return false  
end  
end
if text == "اضف رد" and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=msg.sender_user_id_..":cancelRd:add"}},
}
send_inlin_key(msg.chat_id_,"• ارسل الكلمه التي تريد اضافتها",inlin,msg.id_)
database:set(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "حذف رد" and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=msg.sender_user_id_..":cancelRd:del"}},
}
send_inlin_key(msg.chat_id_,"• ارسل الكلمه التي تريد حذفها",inlin,msg.id_)
database:set(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true2")
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '• الان ارسل الرد الذي تريد اضافته \n•  قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه )\n•  يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات ')
database:set(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true1")
database:set(bot_id.."Mega:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:del(bot_id.."Mega:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."Mega:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."Mega:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."Mega:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."Mega:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:sadd(bot_id.."Mega:List:Manager"..msg.chat_id_.."", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_.."") == "true2" then
send(msg.chat_id_, msg.id_,"• تم ازالة الرد من قائمه الردود")
database:del(bot_id.."Mega:Add:Rd:Manager:AudioCa"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:VicoCa"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:PhotoCa"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:FileCa"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:GifCa"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."Mega:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."Mega:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."Mega:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."Mega:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."Mega:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:del(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."Mega:List:Manager"..msg.chat_id_.."", text)
return false
end
end
if text and not database:get(bot_id.."Mega:Reply:Manager"..msg.chat_id_) then
if not database:sismember(bot_id..'Mega:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."Mega:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
local veico = database:get(bot_id.."Mega:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
local stekr = database:get(bot_id.."Mega:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
local Text = database:get(bot_id.."Mega:Add:Rd:Manager:Text"..text..msg.chat_id_)   
local photo = database:get(bot_id.."Mega:Add:Rd:Manager:Photo"..text..msg.chat_id_)  
local video = database:get(bot_id.."Mega:Add:Rd:Manager:Video"..text..msg.chat_id_) 
local document = database:get(bot_id.."Mega:Add:Rd:Manager:File"..text..msg.chat_id_)
local audio = database:get(bot_id.."Mega:Add:Rd:Manager:Audio"..text..msg.chat_id_)
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
if Text then 
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_,'['..Text..']')
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr)
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local veicoCa = database:get(bot_id.."Mega:Add:Rd:Manager:VicoCa"..text..msg.chat_id_)  or ""
local veicoCa = veicoCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendVoice(msg.chat_id_, msg.id_,veico,veicoCa)
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local videoCa = database:get(bot_id.."Mega:Add:Rd:Manager:VideoCa"..text..msg.chat_id_) or ""
local videoCa = videoCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendVideo(msg.chat_id_, msg.id_,video,videoCa)
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local anemiCa = database:get(bot_id.."Mega:Add:Rd:Manager:GifCa"..text..msg.chat_id_) or ""
local anemiCa = anemiCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendAnimation(msg.chat_id_, msg.id_,anemi,anemiCa)
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if document then 
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local documentCa = database:get(bot_id.."Mega:Add:Rd:Manager:FileCa"..text..msg.chat_id_) or ""
local documentCa = documentCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendDocument(msg.chat_id_, msg.id_, document,documentCa)
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then 
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local audioCa = database:get(bot_id.."Mega:Add:Rd:Manager:AudioCa"..text..msg.chat_id_)  or ""
local audioCa = audioCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendAudio(msg.chat_id_,msg.id_,audio,audioCa,audioCa)
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then 
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local photoCa = database:get(bot_id.."Mega:Add:Rd:Manager:PhotoCa"..text..msg.chat_id_) or ""
local photoCa = photoCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendPhoto(msg.chat_id_,msg.id_,photo,photoCa)
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end  
end,nil)
end
end
------------------------------------------------------------------------
if text == ("مسح ردود المطور") and DevMega(msg) then 
local list = database:smembers(bot_id.."Mega:List:Rd:Sudo")
for k,v in pairs(list) do
database:del(bot_id.."Mega:Add:Rd:Sudo:Gif"..v)   
database:del(bot_id.."Mega:Add:Rd:Sudo:vico"..v)   
database:del(bot_id.."Mega:Add:Rd:Sudo:stekr"..v)     
database:del(bot_id.."Mega:Add:Rd:Sudo:Text"..v)   
database:del(bot_id.."Mega:Add:Rd:Sudo:Photo"..v)
database:del(bot_id.."Mega:Add:Rd:Sudo:Video"..v)
database:del(bot_id.."Mega:Add:Rd:Sudo:File"..v)
database:del(bot_id.."Mega:Add:Rd:Sudo:Audio"..v)
database:del(bot_id.."Mega:List:Rd:Sudo")
end
send(msg.chat_id_, msg.id_,"• تم مسح ردود المطور")
end
if text == ("ردود المطور") and DevMega(msg) then 
local list = database:smembers(bot_id.."Mega:List:Rd:Sudo")
text = "\n• قائمة ردود المطور \n\n"
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif database:get(bot_id.."Mega:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif database:get(bot_id.."Mega:Add:Rd:Sudo:stekr"..v) then
db = "ملصق ⌔"
elseif database:get(bot_id.."Mega:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif database:get(bot_id.."Mega:Add:Rd:Sudo:Photo"..v) then
db = "صوره ⌔"
elseif database:get(bot_id.."Mega:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif database:get(bot_id.."Mega:Add:Rd:Sudo:File"..v) then
db = "ملف ⌔"
elseif database:get(bot_id.."Mega:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
end
text = text..""..k.." >> ("..v..") ↺{"..db.."}\n"
end
if #list == 0 then
text = "• لا يوجد ردود للمطور"
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."Mega:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."Mega:Add:Rd:Sudo:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."Mega:Add:Rd:Sudo:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."Mega:Add:Rd:Sudo:Gif"..test, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."Mega:Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."Mega:Add:Rd:Sudo:Audio"..test, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."Mega:Add:Rd:Sudo:File"..test, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."Mega:Add:Rd:Sudo:Video"..test, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."Mega:Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(msg.chat_id_, msg.id_,"• تم حفظ الرد بنجاح")
return false  
end  
end

if text == "اضف رد للكل" and DevMega(msg) then 
send(msg.chat_id_, msg.id_,"•  ارسل الكلمه التري تريد اضافتها")
database:set(bot_id.."Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "حذف رد للكل" and DevMega(msg) then 
send(msg.chat_id_, msg.id_,"•  ارسل الكلمه التري تريد حذفها")
database:set(bot_id.."Mega:Set:On"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '• الان ارسل الرد الذي تريد اضافته \n•  قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه )\n•  يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات ')
database:set(bot_id.."Mega:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_, "true1")
database:set(bot_id.."Mega:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:sadd(bot_id.."Mega:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Mega:Set:On"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_,"• تم ازالة الرد من قائمه ردود المطور")
list = {"Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
database:del(bot_id..'Mega:'..v..text)
end
database:del(bot_id.."Mega:Set:On"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."Mega:List:Rd:Sudo", text)
return false
end
end

if text and not database:get(bot_id.."Mega:Reply:Sudo"..msg.chat_id_) then
if not database:sismember(bot_id..'Mega:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."Mega:Add:Rd:Sudo:Gif"..text)   
local veico = database:get(bot_id.."Mega:Add:Rd:Sudo:vico"..text)   
local stekr = database:get(bot_id.."Mega:Add:Rd:Sudo:stekr"..text)     
local Text = database:get(bot_id.."Mega:Add:Rd:Sudo:Text"..text)   
local photo = database:get(bot_id.."Mega:Add:Rd:Sudo:Photo"..text)
local video = database:get(bot_id.."Mega:Add:Rd:Sudo:Video"..text)
local document = database:get(bot_id.."Mega:Add:Rd:Sudo:File"..text)
local audio = database:get(bot_id.."Mega:Add:Rd:Sudo:Audio"..text)

if Text then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or 'لا يوجد')) 
local Text = Text:gsub('#name',data.first_name_)
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',message_edit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_,Text)
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end,nil)
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr) 
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_,veico,"")
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_,video,"")
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
sendAnimation(msg.chat_id_, msg.id_,anemi,"")   
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, document)     
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_,msg.id_,photo,"")
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
end  
end
end
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Kick_Group(msg.chat_id_, data.id_)
end
end,nil)
end
send(msg.chat_id_, msg.id_,'• تم طرد الحسابات المحذوفه')
end,nil)
end
end

if text == "تفعيل ردود المدير" and Owner(msg) then    
database:del(bot_id.."Mega:Reply:Manager"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"• تم تفعيل ردود المدير") 
end
if text == "تعطيل ردود المدير" and Owner(msg) then   
database:set(bot_id.."Mega:Reply:Manager"..msg.chat_id_,true)  
send(msg.chat_id_, msg.id_,"• تم تعطيل ردود المدير" ) 
end
if text == "تفعيل ردود المطور" and Owner(msg) then    
database:del(bot_id.."Mega:Reply:Sudo"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"• تم تفعيل ردود المطور" ) 
end
if text == "تعطيل ردود المطور" and Owner(msg) then   
database:set(bot_id.."Mega:Reply:Sudo"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_,"• تم تعطيل ردود المطور" ) 
end


if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
if DevMegae(result.sender_user_id_) then
send(msg.chat_id_, msg.id_,"•  لا تستطيع تنزيل مطور البوت او السورس")
return false 
end
if Rank_Checking(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n• تم تنزيل الشخص من جميع الرتب")
else
send(msg.chat_id_, msg.id_,"\n• ليس لديه رتب حتى استطيع تنزيله \n")
end
if DevMegae(msg.sender_user_id_)  then
database:srem(bot_id.."DEV:Sudo:T",result.sender_user_id_)
database:srem(bot_id.."Mega:Sudo:User", result.sender_user_id_)
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."DEV:Sudo:T",msg.sender_user_id_) then
database:srem(bot_id.."Mega:Sudo:User", result.sender_user_id_)
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."Mega:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id.."creator"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id.."Mega:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."Mega:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."Mega:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
end
if text and text:match("^تنزيل الكل @(.*)$") and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
if (result.id_) then
if DevMegae(result.id_) then
send(msg.chat_id_, msg.id_,"• لا تستطيع تنزيل مطور البوت او السورس")
return false 
end
if Rank_Checking(result.id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n• تم تنزيل الشخص من جميع الرتب")
else
send(msg.chat_id_, msg.id_,"\n• ليس لديه رتب حتى استطيع تنزيله \n")
end
if DevMegae(msg.sender_user_id_)  then
database:srem(bot_id.."DEV:Sudo:T",result.id_)
database:srem(bot_id.."Mega:Sudo:User", result.id_)
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_,result.id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."DEV:Sudo:T",msg.sender_user_id_) then
database:srem(bot_id.."Mega:Sudo:User", result.id_)
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_,result.id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."Mega:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_,result.id_)
elseif database:sismember(bot_id.."creator"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Basic:Constructor"..msg.chat_id_,result.id_)
elseif database:sismember(bot_id.."Mega:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Constructor"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."Mega:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Manager"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."Mega:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."Mega:Special:User"..msg.chat_id_, result.id_)
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text:match("^تنزيل الكل @(.*)$")}, Function_Mega, nil)
end
if text == "تاك للكل" and Addictive(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""), offset_ = 0,limit_ = 200},function(ta,brok)
local t = "\n•  قائمة الاعضاء \n \n"
x = 0
local list = brok.members_
for k, v in pairs(list) do
x = x + 1
if database:get(bot_id.."Mega:User:Name"..v.user_id_) then
t = t.."• "..x.."︙[@"..database:get(bot_id.."Mega:User:Name"..v.user_id_).."]\n"
end
end
send(msg.chat_id_,msg.id_,t)
end,nil)
end
if text == "رتبتي" then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local rtp = Get_Rank(msg.sender_user_id_,msg.chat_id_)
send(msg.chat_id_, msg.id_,"•  رتبتك في البوت ↺"..rtp)
end
if text == "اسمي" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.first_name_ then
first_name = "•  اسمك الاول ↺ {`"..(result.first_name_).."`}"
else
first_name = ""
end   
if result.last_name_ then 
last_name = "•  اسمك الثاني ↺ {`"..result.last_name_.."`}" 
else
last_name = ""
end      
send(msg.chat_id_, msg.id_,first_name.."\n"..last_name) 
end,nil)
end 
if text==("عدد الكروب") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_,msg.id_,"•  البوت ليس ادمن هنا \n") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
local brok = "•  عدد الادمنيه : "..data.administrator_count_..
"\n\n•  عدد المطرودين : "..data.kicked_count_..
"\n\n•  عدد الاعضاء : "..data.member_count_..
"\n\n•  عدد رسائل الكروب : "..(msg.id_/2097152/0.5)..
"\n\n•  اسم القروب : ["..ta.title_.."]"
send(msg.chat_id_, msg.id_, brok) 
end,nil)
end,nil)
end 
if text == "اطردني" or text == "طردني" then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not database:get(bot_id.."Mega:Kick:Me"..msg.chat_id_) then
if Rank_Checking(msg.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n•  عذرا لا استطيع طرد ( "..Get_Rank(msg.sender_user_id_,msg.chat_id_).." )")
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=msg.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"•  ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (data and data.code_ and data.code_ == 3) then 
send(msg.chat_id_, msg.id_,"•  البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if data and data.code_ and data.code_ == 400 and data.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_, msg.id_,"•  عذرا لا استطيع طرد ادمنية القروب") 
return false  
end
if data and data.ID and data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"•  تم طردك من القروب ") 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = msg.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
return false
end
end,nil)   
else
send(msg.chat_id_, msg.id_,"•  امر اطردني تم تعطيله من قبل المدراء ") 
end
end

if text == "تفعيل اطردني" and Owner(msg) then    
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Mega:Kick:Me"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,Text) 
end
if text == "تعطيل اطردني" and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Mega:Kick:Me"..msg.chat_id_,true)  
Text = "\n• تم تعطيل امر اطردني"
send(msg.chat_id_, msg.id_,Text) 
end

if text and text:match("^رفع القيود @(.*)") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^رفع القيود @(.*)") 
function Function_Mega(extra, result, success)
if result.id_ then
if DevMega(msg) then
database:srem(bot_id.."Mega:GBan:User",result.id_)
database:srem(bot_id.."Mega:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."Mega:Muted:User"..msg.chat_id_,result.id_)
usertext = "\n•  العضو ↺["..result.title_.."](t.me/"..(username or "TeAm_VeCto")..")"
status  = "\n•  تم الغاء القيود عنه"
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
else
database:srem(bot_id.."Mega:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."Mega:Muted:User"..msg.chat_id_,result.id_)
Reply_Status(msg,result.id_,"reply","\n•  تم الغاء القيود عنه")  
end
else
Text = "•  المعرف غلط"
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
end
if text == "رفع القيود" and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
if DevMega(msg) then
database:srem(bot_id.."Mega:GBan:User",result.sender_user_id_)
database:srem(bot_id.."Mega:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."Mega:Muted:User"..msg.chat_id_,result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","\n•  تم الغاء القيود عنه")  
else
database:srem(bot_id.."Mega:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."Mega:Muted:User"..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = "\n•  العضو ↺["..data.first_name_.."](t.me/"..(data.username_ or "TeAm_VeCto")..")"
status  = "\n•  تم الغاء القيود عنه"
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
end
if text and text:match("^كشف القيود @(.*)") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^كشف القيود @(.*)") 
function Function_Mega(extra, result, success)
if result.id_ then
if database:sismember(bot_id.."Mega:Muted:User"..msg.chat_id_,result.id_) then
Muted = "مكتوم"
else
Muted = "غير مكتوم"
end
if database:sismember(bot_id.."Mega:Ban:User"..msg.chat_id_,result.id_) then
Ban = "محظور"
else
Ban = "غير محظور"
end
if database:sismember(bot_id.."Mega:GBan:User",result.id_) then
GBan = "محظور عام"
else
GBan = "غير محظور عام"
end
send(msg.chat_id_, msg.id_,"•  الحظر العام ↺"..GBan.."\n•  الحظر ↺"..Ban.."\n•  الكتم ↺"..Muted)
else
send(msg.chat_id_, msg.id_,"•  المعرف غلط")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
end

if text == "كشف القيود" and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
if database:sismember(bot_id.."Mega:Muted:User"..msg.chat_id_,result.sender_user_id_) then
Muted = "مكتوم"
else
Muted = "غير مكتوم"
end
if database:sismember(bot_id.."Mega:Ban:User"..msg.chat_id_,result.sender_user_id_) then
Ban = "محظور"
else
Ban = "غير محظور"
end
if database:sismember(bot_id.."Mega:GBan:User",result.sender_user_id_) then
GBan = "محظور عام"
else
GBan = "غير محظور عام"
end
Textt = "•  الحظر العام ↺"..GBan.."\n•  الحظر ↺"..Ban.."\n•  الكتم ↺"..Muted..""
send(msg.chat_id_, msg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
end

if text and text:match("^ضع اسم (.*)") and Owner(msg) or text and text:match("^وضع اسم (.*)") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Name = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"•  البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"•  ليست لدي صلاحية تغير اسم القروب")  
else
send(msg.chat_id_,msg.id_,"•  تم تغيير اسم القروب الى {["..Name.."]}")  
end
end,nil) 
end

if text ==("رفع الادمنيه") and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."Mega:Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."Mega:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_,"•  لا توجد ادمنية ليتم رفعهم") 
else
send(msg.chat_id_, msg.id_,"•  تمت ترقية { "..num2.." } من ادمنية القروب") 
end
end,nil)   
end
if text == "المنشئ" or text =="المالك"  then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_," *• حساب المنشئ محذوف*")
return false  
end
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = owner_id,offset_ = 0,limit_ = 1},function(arg,getpro) 
if getpro.photos_[0] then
Name = '*Owner group ↺* ['..b.first_name_..'](tg://user?id='..b.id_..')\n'
Name = Name..'*bio owner ↺* ['..getbio(owner_id)..']\n'
keyboard = {}
keyboard.inline_keyboard = {{{text = ''..b.first_name_..'', url = "https://t.me/"..b.username_..""}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&caption='..URL.escape(Name)..'&photo='..getpro.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
send(msg.chat_id_,msg.id_,Name)
end
end,nil)   
end,nil)   
end
end
end,nil)  
end
if text ==("رفع المنشئ") and DevBot(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"• حساب المنشئ محذوف")
return false  
end
local UserName = (b.username_ or "TeAm_VeCto")
send(msg.chat_id_, msg.id_,"• تم ترقية منشئ القروب ~ ["..b.first_name_.."](T.me/"..UserName..")")  
database:sadd(bot_id.."Mega:Basic:Constructor"..msg.chat_id_,b.id_)
end,nil)   
end,nil)   
end

if text == "غادر" then 
if DevBot(msg) and not database:get(bot_id.."Mega:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"•  تم مغادرة القروب") 
database:srem(bot_id.."Mega:Chek:Groups",msg.chat_id_)  
end
return false  
end
if text and text:match("^غادر (-%d+)$") then
local GP_ID = {string.match(text, "^(غادر) (-%d+)$")}
if DevBot(msg) and not database:get(bot_id.."Mega:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=GP_ID[2],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"•  تم مغادرة القروب") 
send(GP_ID[2], 0,"•  تم مغادرة القروب بامر من مطور البوت") 
database:srem(bot_id.."Mega:Chek:Groups",GP_ID[2])  
return false 
end
end
if text == "تفعيل المغادره" and DevMega(msg) then   
database:del(bot_id.."Mega:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"• تم تفعيل مغادرة البوت") 
return false 
end
if text == "تعطيل المغادره" and DevMega(msg) then  
database:set(bot_id.."Mega:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "• تم تعطيل مغادرة البوت") 
return false 
end
if text == (database:get(bot_id.."Mega:Name:Bot") or "فيكتو") then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Namebot = (database:get(bot_id.."Mega:Name:Bot") or "فيكتو")
local namebot = {
"عمري فداك "..Namebot.. " كول حب ",
"كول حبيبي ؟ اني "..Namebot,
'وياك والله وياك',
'كلي ياحلو منين الله جابك',
'ها يحلو كول',
'عمري الحلو',
'هلاحات',
'عمريني تفضل',
'حبيبي انت تفضل',
" هايروحي؟ "..Namebot,
}
name = math.random(#namebot)
send(msg.chat_id_, msg.id_, namebot[name]) 
return false 
end

if text == "بوت" then
Namebot = (database:get(bot_id.."Mega:Name:Bot") or "فيكتو")
send(msg.chat_id_, msg.id_,"شوف اكلك اني بوت بس اسمي ["..Namebot.."] ") 
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" or text == "حذف اسم البوت" then 
if DevMega(msg) then
database:setex(bot_id.."Mega:Set:Name:Bot"..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"•  ارسل لي الاسم الان ")  
end
return false
end

if text ==("مسح المطرودين") and Addictive(msg) then    
local function delbans(extra, result)  
if not msg.can_be_deleted_ == true then  
send(msg.chat_id_, msg.id_, "•  يرجى ترقيتي ادمن هنا") 
return false
end  
local num = 0 
for k,y in pairs(result.members_) do 
num = num + 1  
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft"}, }, dl_cb, nil)  
end  
send(msg.chat_id_, msg.id_,"•  تم الغاء الحظر عن *~ "..num.." ~* اشخاص ") 
end    
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, delbans, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
if text=="اذاعه خاص" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."Mega:Status:Bc") and not DevMega(msg) then 
send(msg.chat_id_, msg.id_,"• الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."Mega:Mega:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي سواء ~ { ملصق, متحركه, صوره, رساله }\n• للخروج ارسل الغاء ") 
return false
end 
if text=="اذاعه" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."Mega:Status:Bc") and not DevMega(msg) then 
send(msg.chat_id_, msg.id_,"• الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."Mega:Mega:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي سواء ~ { ملصق, متحركه, صوره, رساله }\n• للخروج ارسل الغاء ") 
return false
end  
if text=="اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."Mega:Status:Bc") and not DevMega(msg) then 
send(msg.chat_id_, msg.id_,"• الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."Mega:Mega:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي سواء ~ { ملصق, متحركه, صوره, رساله }\n• للخروج ارسل الغاء ") 
return false
end  
if text=="اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."Mega:Status:Bc") and not DevMega(msg) then 
send(msg.chat_id_, msg.id_,"• الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."Mega:Mega:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي التوجيه الان") 
return false
end 
if text=="اذاعه بالتوجيه خاص" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."Mega:Status:Bc") and not DevMega(msg) then 
send(msg.chat_id_, msg.id_,"• الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."Mega:Mega:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي التوجيه الان") 
return false
end 

if text == "تفعيل الاذاعه" and DevMega(msg) then  
database:del(bot_id.."Mega:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n• تم تفعيل الاذاعه " ) 
return false
end 
if text == "تعطيل الاذاعه" and DevMega(msg) then  
database:set(bot_id.."Mega:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n• تم تعطيل الاذاعه") 
return false
end 

if text == "الاعدادات" and Addictive(msg) then    
if database:get(bot_id.."Mega:lockpin"..msg.chat_id_) then    
lock_pin = "✓"
else 
lock_pin = "✘"    
end
if database:get(bot_id.."Mega:Lock:tagservr"..msg.chat_id_) then    
lock_tagservr = "✓"
else 
lock_tagservr = "✘"    
end
if database:get(bot_id.."Mega:Lock:text"..msg.chat_id_) then    
lock_text = "✓"
else 
lock_text = "✘"    
end
if database:get(bot_id.."Mega:Lock:AddMempar"..msg.chat_id_) == "kick" then
lock_add = "✓"
else 
lock_add = "✘"    
end    
if database:get(bot_id.."Mega:Lock:Join"..msg.chat_id_) == "kick" then
lock_join = "✓"
else 
lock_join = "✘"    
end    
if database:get(bot_id.."Mega:Lock:edit"..msg.chat_id_) then    
lock_edit = "✓"
else 
lock_edit = "✘"    
end
if database:get(bot_id.."Mega:Get:Welcome:Group"..msg.chat_id_) then
welcome = "✓"
else 
welcome = "✘"    
end
if database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
flood = "بالطرد"     
elseif database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
flood = "بالتقيد"     
elseif database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
flood = "بالكتم"           
elseif database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"flood") == "del" then     
flood = "بالمسح"           
else     
flood = "✘"     
end
if database:get(bot_id.."Mega:Lock:Photo"..msg.chat_id_) == "del" then
lock_photo = "✓" 
elseif database:get(bot_id.."Mega:Lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = "بالتقيد"   
elseif database:get(bot_id.."Mega:Lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = "بالطرد"   
else
lock_photo = "✘"   
end    
if database:get(bot_id.."Mega:Lock:Contact"..msg.chat_id_) == "del" then
lock_phon = "✓" 
elseif database:get(bot_id.."Mega:Lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = "بالطرد"    
else
lock_phon = "✘"    
end    
if database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "del" then
lock_links = "✓"
elseif database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "ked" then
lock_links = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "ktm" then
lock_links = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) == "kick" then
lock_links = "بالطرد"    
else
lock_links = "✘"    
end
if database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = "✓"
elseif database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = "بالكتم"   
elseif database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = "بالطرد"    
else
lock_cmds = "✘"    
end
if database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "del" then
lock_user = "✓"
elseif database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "ked" then
lock_user = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "ktm" then
lock_user = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) == "kick" then
lock_user = "بالطرد"    
else
lock_user = "✘"    
end
if database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = "✓"
elseif database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = "بالطرد"    
else
lock_hash = "✘"    
end
if database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "del" then
lock_muse = "✓"
elseif database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = "بالطرد"    
else
lock_muse = "✘"    
end 
if database:get(bot_id.."Mega:Lock:Video"..msg.chat_id_) == "del" then
lock_ved = "✓"
elseif database:get(bot_id.."Mega:Lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = "بالطرد"    
else
lock_ved = "✘"    
end
if database:get(bot_id.."Mega:Lock:Animation"..msg.chat_id_) == "del" then
lock_gif = "✓"
elseif database:get(bot_id.."Mega:Lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = "بالطرد"    
else
lock_gif = "✘"    
end
if database:get(bot_id.."Mega:Lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = "✓"
elseif database:get(bot_id.."Mega:Lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = "بالتقيد "    
elseif database:get(bot_id.."Mega:Lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = "بالكتم "    
elseif database:get(bot_id.."Mega:Lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = "بالطرد"    
else
lock_ste = "✘"    
end
if database:get(bot_id.."Mega:Lock:geam"..msg.chat_id_) == "del" then
lock_geam = "✓"
elseif database:get(bot_id.."Mega:Lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = "بالطرد"    
else
lock_geam = "✘"    
end    
if database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "del" then
lock_vico = "✓"
elseif database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = "بالطرد"    
else
lock_vico = "✘"    
end    
if database:get(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = "✓"
elseif database:get(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = "بالتقيد"
elseif database:get(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = "بالطرد"
else
lock_inlin = "✘"
end
if database:get(bot_id.."Mega:Lock:forward"..msg.chat_id_) == "del" then
lock_fwd = "✓"
elseif database:get(bot_id.."Mega:Lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = "بالطرد"    
else
lock_fwd = "✘"    
end    
if database:get(bot_id.."Mega:Lock:Document"..msg.chat_id_) == "del" then
lock_file = "✓"
elseif database:get(bot_id.."Mega:Lock:Document"..msg.chat_id_) == "ked" then 
lock_file = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Document"..msg.chat_id_) == "kick" then 
lock_file = "بالطرد"    
else
lock_file = "✘"    
end    
if database:get(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = "✓"
elseif database:get(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = "بالطرد"    
else
lock_self = "✘"    
end
if database:get(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_) == "del" then
lock_bots = "✓"
elseif database:get(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif database:get(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "✘"    
end
if database:get(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = "✓"
elseif database:get(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = "بالطرد"    
else
lock_mark = "✘"    
end
if database:get(bot_id.."Mega:Lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = "✓"
elseif database:get(bot_id.."Mega:Lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = "بالتقيد"    
elseif database:get(bot_id.."Mega:Lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = "بالكتم"    
elseif database:get(bot_id.."Mega:Lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = "بالطرد"    
else
lock_spam = "✘"    
end        
if not database:get(bot_id.."Mega:Reply:Manager"..msg.chat_id_) then
rdmder = "✓"
else
rdmder = "✘"
end
if not database:get(bot_id.."Mega:Reply:Sudo"..msg.chat_id_) then
rdsudo = "✓"
else
rdsudo = "✘"
end
if not database:get(bot_id.."Mega:Lock:ID:Bot"..msg.chat_id_) then
idgp = "✓"
else
idgp = "✘"
end
if not database:get(bot_id.."Mega:Lock:ID:Bot:Photo"..msg.chat_id_) then
idph = "✓"
else
idph = "✘"
end
if not database:get(bot_id.."Mega:Lock:kick"..msg.chat_id_) then
setadd = "✓"
else
setadd = "✘"
end
if not database:get(bot_id.."Mega:Lock:Add:Bot"..msg.chat_id_) then
banm = "✓"
else
banm = "✘"
end
if not database:get(bot_id.."Mega:Kick:Me"..msg.chat_id_) then
kickme = "✓"
else
kickme = "✘"
end
Num_Flood = database:hget(bot_id.."Mega:flooding:settings:"..msg.chat_id_,"floodmax") or 0
local text = 
"*\n• ااعدادات القروب "..
"\n "..
"\n• علامة ال {✓} تعني مفعل"..
"\n• علامة ال {✘} تعني معطل"..
"\n "..
"\n• الروابط ↺"..lock_links..
"\n".."• المعرفات ↺"..lock_user..
"\n".."• التاك ↺"..lock_hash..
"\n".."• البوتات ↺"..lock_bots..
"\n".."• التوجيه ↺"..lock_fwd..
"\n".."• التثبيت ↺"..lock_pin..
"\n".."• الاشعارات ↺"..lock_tagservr..
"\n".."• الماركدون ↺"..lock_mark..
"\n".."• التعديل ↺"..lock_edit..
"\n "..
"\n".."• الكلايش ↺"..lock_spam..
"\n".."• الكيبورد ↺"..lock_inlin..
"\n".."• الاغاني ↺"..lock_vico..
"\n".."• المتحركه ↺"..lock_gif..
"\n".."• الملفات ↺"..lock_file..
"\n".."• الدردشه ↺"..lock_text..
"\n".."• الفيديو ↺"..lock_ved..
"\n".."• الصور ↺"..lock_photo..
"\n "..
"\n".."• الصوت ↺"..lock_muse..
"\n".."• الملصقات ↺"..lock_ste..
"\n".."• الجهات ↺"..lock_phon..
"\n".."• الدخول ↺"..lock_join..
"\n".."• الاضافه ↺"..lock_add..
"\n".."• السيلفي ↺"..lock_self..
"\n".."• الالعاب ↺"..lock_geam..
"\n".."• التكرار ↺"..flood..
"\n".."• الترحيب ↺"..welcome..
"\n".."• عدد التكرار ↺"..Num_Flood..
"\n\n.*"
send(msg.chat_id_, msg.id_,text)     
end    
if text == "تعطيل اوامر التحشيش" and Owner(msg) then     
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_, '• تم تعطيل اوامر التحشيش')
database:set(bot_id.."Mega:Fun_Bots"..msg.chat_id_,"true")
end
if text == "تفعيل اوامر التحشيش" and Owner(msg) then     
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,'• تم تفعيل اوامر التحشيش')
database:del(bot_id.."Mega:Fun_Bots"..msg.chat_id_)
end

if text == 'تفعيل الايدي' and Owner(msg) then  
  if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id..'Mega:Lock:ID:Bot'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'• تم تفعيل الايدي') 
end
if text == 'تعطيل الايدي' and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id..'Mega:Lock:ID:Bot'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'• تم تعطيل الايدي') 
end
if text == 'تفعيل الايدي بالصوره' and Owner(msg) then    
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id..'Mega:Lock:ID:Bot:Photo'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'• تم تفعيل الايدي بالصوره') 
end

if text == "تفعيل اليوتيوب" and Addictive(msg) then  
database:del(bot_id..'search'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"تم تفعيل اليوتيوب") 
return false  
end
if text == "تعطيل اليوتيوب" and Addictive(msg) then  
database:set(bot_id..'search'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"تم تعطيل اليوتيوب") 
return false  
end
if not database:get(bot_id..'search'..msg.chat_id_) then
if text and text:match('^بحث (.*)$') then 
local TextSearch = text:match('^بحث (.*)$') 
local msg_id = msg.id_/2097152/0.5
local done = json:decode(https.request("https://asdxxcv.ml/API/Test/search.php?search="..token.."&chat_id="..msg.chat_id_.."&from="..msg.sender_user_id_.."&msg="..msg_id.."&Text="..TextSearch.."&n=s")) 
end
end

if text == 'تعطيل الايدي بالصوره' and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id..'Mega:Lock:ID:Bot:Photo'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'• تم تعطيل الايدي بالصوره') 
end
if text == 'تعين الايدي' and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id.."Mega:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_,240,true)  
local Text= [[
•  ارسل الان النص
•  يمكنك اضافه :
- `#username` > اسم المستخدم
- `#msgs` > عدد رسائل المستخدم
- `#photos` > عدد صور المستخدم
- `#id` > ايدي المستخدم
- `#auto` > تفاعل المستخدم
- `#stast` > موقع المستخدم 
- `#edit` > عدد السحكات
- `#game` > المجوهرات
- `#AddMem` > عدد الجهات
- `#Description` > تعليق الصوره
]]
send(msg.chat_id_, msg.id_,Text)
return false  
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if Owner(msg) then
database:del(bot_id.."Mega:Klesh:Id:Bot"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '• تم ازالة كليشة الايدي ')
end
return false  
end 

if database:get(bot_id.."Mega:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"• تم الغاء تعين الايدي") 
database:del(bot_id.."Mega:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."Mega:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
database:set(bot_id.."Mega:Klesh:Id:Bot"..msg.chat_id_,text:match("(.*)"))
send(msg.chat_id_, msg.id_,'• تم تعين الايدي')    
end

if text == 'ايدي' and tonumber(msg.reply_to_message_id_) == 0 and not database:get(bot_id..'Mega:Lock:ID:Bot'..msg.chat_id_) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not database:sismember(bot_id..'Mega:Spam:Group'..msg.sender_user_id_,text) then
database:sadd(bot_id.."Mega:Spam:Group"..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,DARK,success) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = msg.sender_user_id_
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Num_Games = database:get(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
local Add_Mem = database:get(bot_id.."Mega:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Total_Photp = (DARK.total_count_ or 0)
local Texting = {
'صورتك فدشي 😘😔❤️',
"صارلك شكد مخليه ",
"وفالله 😔💘",
"كشخه برب 😉💘",
"دغيره شبي هذ 😒",
"عمري الحلوين 💘",
}
local Description = Texting[math.random(#Texting)]
local get_id = database:get(bot_id.."Mega:Klesh:Id:Bot"..msg.chat_id_)
if not database:get(bot_id..'Mega:Lock:ID:Bot:Photo'..msg.chat_id_) then
if DARK.photos_[0] then
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
sendPhoto(msg.chat_id_,msg.id_,DARK.photos_[0].sizes_[1].photo_.persistent_id_,get_id)
else
sendPhoto(msg.chat_id_,msg.id_,DARK.photos_[0].sizes_[1].photo_.persistent_id_,'• '..Description..'\n• ايديك ↺ '..Id..'\n• معرفك ↺ '..UserName_User..'\n• رتبتك ↺ '..Status_Gps..'\n• رسائلك ↺ '..NumMsg..'\n• السحكات ↺ '..message_edit..' \n• تتفاعلك ↺ '..TotalMsg..'\n•  مجوهراتك ↺ '..Num_Games)  
end
else
inline = {{{text = '- اضغط هنا للحذف.',callback_data=msg.sender_user_id_..":cancelRd:del"}}, }
send_inlin_key(msg.chat_id_,'• ليس لديك صوره \n'..'\n*• ايديك ↺ '..Id..'\n• معرفك ↺* ['..UserName_User..']*\n• رتبتك ↺ '..Status_Gps..'\n• رسائلك ↺ '..NumMsg..'\n• السحكات ↺ '..message_edit..' \n• تتفاعلك ↺ '..TotalMsg..'\n•  مجوهراتك ↺ '..Num_Games..'*',inline,msg.id_)
end
else
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
inline = {{{text = '- اضغط هنا للحذف.',callback_data=msg.sender_user_id_..":cancelRd:add"}}, }
send_inlin_key(msg.chat_id_,'['..get_id..']',inline,msg.id_)
else
inline = {{{text = '- اضغط هنا للحذف.',callback_data=msg.sender_user_id_..":cancelRd:add"}}, }
send_inlin_key(msg.chat_id_,'\n*• ايديك ↺ '..Id..'\n• معرفك ↺* ['..UserName_User..']*\n• رتبتك ↺ '..Status_Gps..'\n• رسائلك ↺ '..NumMsg..'\n• السحكات ↺ '..message_edit..' \n• تتفاعلك ↺ '..TotalMsg..'\n•  مجوهراتك ↺ '..Num_Games..'*',inline,msg.id_)
end
end
end,nil)   
end,nil)   
end
end
if text == 'تعطيل التنظيف' and BasicConstructor(msg) then    
if database:get(bot_id..'Lock:delmsg'..msg.chat_id_) then
database:del(bot_id..'Lock:delmsg'..msg.chat_id_) 
Text = '\n•  تم تعطيل التنظيف' 
else
Text = '\n• بالتاكيد تم تعطيل التنظيف'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل التنظيف' and BasicConstructor(msg) then   
if not database:get(bot_id..'Lock:delmsg'..msg.chat_id_) then
database:set(bot_id..'Lock:delmsg'..msg.chat_id_,true) 
Text = '\n•  تم تفعيل التنظيف' 
else
Text = '\n• بالتاكيد تم تفعيل التنظيف'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match('^تنظيف (%d+)$') and Constructor(msg) and database:get(bot_id..'Lock:delmsg'..msg.chat_id_) then                
if not database:get(bot_id..'Mega:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then           
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
send(msg.chat_id_, msg.id_,'• لا تستطيع تنضيف اكثر من *~ 1000* رساله') 
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576
end
send(msg.chat_id_, msg.id_,'• تم تنظيف *~ '..Number..'* رساله .')  
database:setex(bot_id..'Mega:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end
end
if not database:get(bot_id..'Mega:Lock:ID:Bot'..msg.chat_id_) then
if text == 'ايدي' and tonumber(msg.reply_to_message_id_) > 0 and tonumber(msg.reply_to_message_id_) > 0 then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_Mega(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.first_name_ == false then
send(msg.chat_id_, msg.id_,'•  الحساب محذوف لا توجد معلوماته ')
return false
end
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."Mega:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
inline = {{{text = '- اضغط هنا للحذف.',callback_data=msg.sender_user_id_..":cancelRd:add"}}, }
send_inlin_key(msg.chat_id_,'*• ايديه - '..Id..'\n• رسائله - '..NumMsg..'\n• معرفه - *['..UserName_User..']*\n• تفاعله - '..TotalMsg..'\n• رتبته - '..Status_Gps..'\n• تعديلاته - '..message_edit..'\n• جهاته - '..Add_Mem..'\n• نوع الكشف - بالرد \n*',inline,msg.id_)
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
end
if not database:get(bot_id..'Mega:Lock:ID:Bot'..msg.chat_id_) then
if text and text:match("^ايدي @(.*)$") or text and text:match("^كشف @(.*)$")  then
if text:match("^ايدي @(.*)$") then
username = text:match("^ايدي @(.*)$") 
elseif text:match("^كشف @(.*)$") then
username = text:match("^كشف @(.*)$") 
end
function Function_Mega(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."Mega:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
inline = {{{text = '- اضغط هنا للحذف.',callback_data=msg.sender_user_id_..":cancelRd:add"}}, }
send_inlin_key(msg.chat_id_,'*• ايديه - '..Id..'\n• رسائله - '..NumMsg..'\n• معرفه - *['..UserName_User..']*\n• تفاعله - '..TotalMsg..'\n• رتبته - '..Status_Gps..'\n• تعديلاته - '..message_edit..'\n• جهاته - '..Add_Mem..'\n• نوع الكشف - بالمعرف \n*',inline,msg.id_)
end,nil)   
else
send(msg.chat_id_, msg.id_,'• لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
end

if text == "سمايلات" or text == "سمايل" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_)
Random = {"🍏","🍎","🍐","🍊","🍋","🍉","🍇","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","??","🍞","🥨","🍟","🧀","🥚","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🍵","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","⌔","🎗","🏵","⌔","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","??","🚛","🚜","🇮🇶","⚔","🛡","🔮","🌡","💣","⌔","📍","📓","📗","⌔","📅","📪","⌔","⌔","📭","⏰","📺","🎚","☎️","⌔"}
SM = Random[math.random(#Random)]
database:set(bot_id.."aaaZaa:Random:Sm"..msg.chat_id_,SM)
send(msg.chat_id_, msg.id_,"• اسرع واحد يدز هاذا السمايل ? ~ {`"..SM.."`}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Random:Sm"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"• الف مبروك لقد فزت \n• للعب مره اخره ارسل ~{ سمايل , سمايلات }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_,true)
return false
end 
if text == "الاسرع" or text == "ترتيب" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_)
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
database:set(bot_id.."aaaZaa:Klam:Speed"..msg.chat_id_,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
send(msg.chat_id_, msg.id_,"• اسرع واحد يرتبها ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Klam:Speed"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"• الف مبروك لقد فزت \n• للعب مره اخره ارسل ~{ الاسرع , ترتيب }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_,true)
end 

if text == "حزوره" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_)
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
database:set(bot_id.."aaaZaa:Klam:Hzor"..msg.chat_id_,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
send(msg.chat_id_, msg.id_,"• اسرع واحد يحل الحزوره ↓\n {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Klam:Hzor"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"• الف مبروك لقد فزت \n• للعب مره اخره ارسل ~{ حزوره }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_,true)
end 

if text == "معاني" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
database:set(bot_id.."aaaZaa:Maany"..msg.chat_id_,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
send(msg.chat_id_, msg.id_,"• اسرع واحد يدز معنى السمايل ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Maany"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"• الف مبروك لقد فزت \n• للعب مره اخره ارسل ~{ معاني }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_,true)
end 

if text == "حجره ورقه مقص" then  
key = {
{{text = 'العب مع البوت',callback_data=msg.sender_user_id_.."playwbotme"}},
{{text = 'اللعب مع اصدقائك',switch_inline_query=msg.sender_user_id_}},
}
send_inline_key(msg.chat_id_,'•  اهلا بك في لعبه حجر ورق مقص يمكنك العب معي او مع اصدقائك .',nil,key,msg.id_/2097152/0.5)
end

if text == "العكس" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","شريف","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
database:set(bot_id.."aaaZaa:Set:Aks:Game"..msg.chat_id_,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"شريف","كواد")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
send(msg.chat_id_, msg.id_,"• اسرع واحد يدز العكس ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Set:Aks:Game"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"• الف مبروك لقد فزت \n• للعب مره اخره ارسل ~{ العكس }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_,true)
end 

if database:get(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
send(msg.chat_id_, msg.id_,"• عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 }\n")
return false  end 
local GETNUM = database:get(bot_id.."aaaZaa:GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_,5)  
send(msg.chat_id_, msg.id_,"• مبروك فزت ويانه وخمنت الرقم الصحيح\n• تم اضافة { 5 } من النقاط \n")
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:incrby(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(database:get(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)) >= 3 then
database:del(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"• اوبس لقد خسرت في اللعبه \n• حظآ اوفر في المره القادمه \n• كان الرقم الذي تم تخمينه { "..GETNUM.." }")
else
send(msg.chat_id_, msg.id_,"• اوبس تخمينك غلط \n• ارسل رقم تخمنه مره اخرى ")
end
end
end
end
if text == "خمن" or text == "تخمين" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end   
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
Num = math.random(1,20)
database:set(bot_id.."aaaZaa:GAMES:NUM"..msg.chat_id_,Num) 
send(msg.chat_id_, msg.id_,"\n• اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n".."• ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n".."• سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ")
database:setex(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if database:get(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
send(msg.chat_id_, msg.id_,"• عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخرى\n")
return false  end 
local GETNUM = database:get(bot_id.."aaaZaa:Games:Bat"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"• مبروك فزت وطلعت المحيبس بل ايد رقم { "..NUM.." }\n🎊︙لقد حصلت على { 3 }من نقاط يمكنك استبدالهن برسائل ")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:del(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"• للاسف لقد خسرت \n• المحيبس بل ايد رقم { "..GETNUM.." }\n• حاول مره اخرى للعثور على المحيبس")
end
end
end

if text == "محيبس" or text == "بات" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then   
Num = math.random(1,6)
database:set(bot_id.."aaaZaa:Games:Bat"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊
• اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
• الفائز يحصل على { 3 } من النقاط *
]]
send(msg.chat_id_, msg.id_,TEST)
database:setex(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if text == "المختلف" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
mktlf = {"😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","👨‍⌔","🧚‍♀","🧜‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
database:del(bot_id.."aaaZaa:Set:Moktlf:Bot"..msg.chat_id_)
database:set(bot_id.."aaaZaa::Set:Moktlf"..msg.chat_id_,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟????🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍??👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍??👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍💻👩‍‍💻👩‍‍💻👩‍💻👨‍💻👩‍💻👩‍??👩‍💻")
name = string.gsub(name,"👨‍⌔","👩‍⌔👩‍⌔👩‍⌔👩‍⌔👩‍⌔👩‍⌔👨‍⌔👩‍⌔")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"??‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"??‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️??‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭??👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
send(msg.chat_id_, msg.id_,"• اسرع واحد يدز الاختلاف ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa::Set:Moktlf"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."aaaZaa:Set:Moktlf:Bot"..msg.chat_id_) then 
database:del(bot_id.."aaaZaa::Set:Moktlf"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"• الف مبروك لقد فزت \n• للعب مره اخره ارسل ~{ المختلف }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Moktlf:Bot"..msg.chat_id_,true)
end
if text == "امثله" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
database:set(bot_id.."aaaZaa:Set:Amth"..msg.chat_id_,name)
database:del(bot_id.."aaaZaa:Set:Amth:Bot"..msg.chat_id_)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
send(msg.chat_id_, msg.id_,"• اسرع واحد يكمل المثل ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Set:Amth"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."aaaZaa:Set:Amth:Bot"..msg.chat_id_) then 
database:del(bot_id.."aaaZaa:Set:Amth"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"• الف مبروك لقد فزت \n• للعب مره اخره ارسل ~{ امثله }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Amth:Bot"..msg.chat_id_,true)
end
------------------------------------------------------------------------------------------------------------------------
if text == "تعطيل الالعاب" and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end   
database:del(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"\n• تم تعطيل الالعاب") 
end
if text == "تفعيل الالعاب" and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end  
database:set(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"\n• تم تفعيل الالعاب") 
end
if text == 'الالعاب' then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Text = [[
• قائمه الالعاب الموجوده
 
• لعبة البات ↺بات
• لعبة التخمين ↺خمن
• لعبه الاسرع ↺الاسرع
• لعبة السمايلات ↺سمايلات
• لعبة المختلف ↺المختلف
• لعبة الامثله ↺امثله
• لعبة العكس ↺العكس 
• لعبة الحزوره ↺حزوره
• لعبة المعاني ↺معاني
 
• مجوهراتي ↺لعرض عدد الارباح
• بيع مجوهراتي + العدد ↺لستبدال كل مجوهره ب50 رساله
]]
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'رسائلي' then
local nummsg = database:get(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 1
local Text = '• عدد رسائلك هنا *~ '..nummsg..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح رسائلي' then
database:del(bot_id..'Mega:messageUser'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '• تم مسح جميع رسائلك '
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'سحكاتي' or text == 'تعديلاتي' then
local edit = database:get(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = '• عدد التعديلات هنا *~ '..edit..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
database:del(bot_id..'Mega:message_edit'..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, '• تم مسح جميع تعديلاتك ') 
end
if text == 'جهاتي' then
local addmem = database:get(bot_id.."Mega:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Text = '• عدد جهاتك المضافه هنا *~ '..addmem..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح جهاتي' then
database:del(bot_id..'Mega:Add:Memp'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '• تم مسح جميع جهاتك المضافه '
send(msg.chat_id_, msg.id_,Text) 
end
if text == "مجوهراتي" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
local Num = database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
if Num == 0 then 
Text = "• لم تلعب اي لعبه للحصول على جواهر"
else
Text = "• عدد جواهر التي رحبتها هي *~ { "..Num.." } مجوهره *"
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("^بيع مجوهراتي (%d+)$") then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local NUMPY = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NUMPY) == tonumber(0) then
send(msg.chat_id_,msg.id_,"\n*• لا استطيع البيع اقل من 1 *") 
return false 
end
if tonumber(database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_)) == tonumber(0) then
send(msg.chat_id_,msg.id_,"• ليس لديك جواهر من الالعاب \n• اذا كنت تريد ربح الجواهر \n• ارسل الالعاب وابدأ اللعب ! ") 
else
local NUM_GAMES = database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(msg.chat_id_,msg.id_,"\n• ليس لديك جواهر بهاذا العدد \n• لزيادة مجوهراتك في اللعبه \n• ارسل الالعاب وابدأ اللعب !") 
return false 
end
local NUMNKO = (NUMPY * 50)
database:decrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_,NUMPY)  
database:incrby(bot_id.."Mega:messageUser"..msg.chat_id_..":"..msg.sender_user_id_,NUMNKO)  
send(msg.chat_id_,msg.id_,"• تم خصم *~ { "..NUMPY.." }* من مجوهراتك \n• وتم اضافة* ~ { "..(NUMPY * 50).." } رساله الى رسالك *")
end 
return false 
end
if text ==("مسح") and Addictive(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if database:get(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id.."aaaZaa:id:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ") 
database:del(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."aaaZaa:id:user"..msg.chat_id_)  
database:del(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..msg.sender_user_id_) 
database:incrby(bot_id.."Mega:messageUser"..msg.chat_id_..":"..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"• تم اضافة له {"..numadded.."} من الرسائل")  
end
if database:get(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id.."aaaZaa:idgem:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ") 
database:del(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."aaaZaa:idgem:user"..msg.chat_id_)  
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"• تم اضافة له {"..numadded.."} من المجوهرات")  
end
------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end    
brok = text:match("^اضف رسائل (%d+)$")
database:set(bot_id.."aaaZaa:id:user"..msg.chat_id_,brok)  
database:setex(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "✉︙ارسل لي عدد الرسائل الان") 
return false
end
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end  
brok = text:match("^اضف مجوهرات (%d+)$")
database:set(bot_id.."aaaZaa:idgem:user"..msg.chat_id_,brok)  
database:setex(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "• ارسل لي عدد المجوهرات الان") 
return false
end
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عـليك الاشـتࢪاك في قنـاة البـوت اولآ . \n • قنـاة البـوت ↺  ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Num = text:match("^اضف مجوهرات (%d+)$")
function reply(extra, result, success)
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_,"• تم اضافة له {"..Num.."} من المجوهرات")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then  
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
database:del(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..result.sender_user_id_) 
database:incrby(bot_id.."Mega:messageUser"..msg.chat_id_..":"..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_, "\n• تم اضافة له {"..Num.."} من الرسائل")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
------------------------------------------------------------
if text == "تنظيف المشتركين" and DevMega(msg) then
local pv = database:smembers(bot_id..'Mega:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok" then
print('\27[30;33m↺THE USER IS SAVE ME ↓\n↺'..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m↺THE USER IS BLOCK ME ↓\n↺'..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'Mega:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'• لا يوجد مشتركين وهميين')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'*• عدد المشتركين الان ~ '..#pv..'\n• تم العثور على ~ '..sendok..' مشترك قام بحظر البوت\n• اصبح عدد المشتركين الان ~ '..ok..' مشترك *')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الكروبات" and DevMega(msg) then
local group = database:smembers(bot_id..'Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m⇠ THE BOT IS NOT ADMIN ↓\n⇠ '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m⇠ THE BOT IS LEFT GROUP ↓\n⇠ '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m⇠ THE BOT IS KICKED GROUP ↓\n⇠ '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'• لا توجد مجموعات وهميه ')   
else
local DARK = (w + q)
local sendok = #group - DARK
if q == 0 then
DARK = ''
else
DARK = '\n• تم ازالة ~ '..q..' مجموعات من البوت'
end
if w == 0 then
local Mega = ''
else
local Mega = '\n• تم ازالة ~'..w..' مجموعه لان البوت عضو'
end
send(msg.chat_id_, msg.id_,'*• عدد المجموعات الان ~ '..#group..' مجموعه '..Mega..''..DARK..'\n• اصبح عدد المجموعات الان ~ '..sendok..' مجموعات*\n')   
end
end
end,nil)
end
return false
end
if text == ("تحديث السورس") and DevMega(msg) then  
send(msg.chat_id_,msg.id_,'*• تم تحديث السورس*')
os.execute('rm -rf Mega.lua')
os.execute('rm -rf start.lua')
os.execute('wget https://raw.githubusercontent.com/secMega/Mega/master/Mega.lua')
os.execute('wget https://raw.githubusercontent.com/secMega/Mega/master/start.lua')
dofile('Mega.lua')  
return false
end

if text == "راسلني" then
rpl = {"ها هلاو","انطق","كول"};
sender = rpl[math.random(#rpl)]
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. msg.sender_user_id_ .. '&text=' .. URL.escape(sender))
end

if text == "تعطيل الزخرفه" and Owner(msg) then
send(msg.chat_id_, msg.id_, '• تم تعطيل الزخرفه')
database:set(bot_id.."Mega:zhrf_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل الزخرفه" and Owner(msg) then
send(msg.chat_id_, msg.id_,'• تم تفعيل الزخرفه')
database:set(bot_id.."Mega:zhrf_Bots"..msg.chat_id_,"open")
end
if text and text:match("^زخرفه (.*)$") and database:get(bot_id.."Mega:zhrf_Bots"..msg.chat_id_) == "open" then
local TextZhrfa = text:match("^زخرفه (.*)$")
zh = https.request('https://vvvzvv.ml/amirZhfa/Teland.php?en='..URL.escape(TextZhrfa)..'')
zx = JSON.decode(zh)
t = "\n• قائمه الزخرفه \n \n"
i = 0
for k,v in pairs(zx.ok) do
i = i + 1
t = t..i.."-  `"..v.."` \n"
end
send(msg.chat_id_, msg.id_, t..'\n• اضغط على الاسم ليتم نسخه')
end
if text == "تعطيل الابراج" and Owner(msg) then
send(msg.chat_id_, msg.id_, '•  تم تعطيل الابراج')
database:set(bot_id.."Mega:brj_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل الابراج" and Owner(msg) then
send(msg.chat_id_, msg.id_,'•  تم تفعيل الابراج')
database:set(bot_id.."Mega:brj_Bots"..msg.chat_id_,"open")
end
if text == '• تفعيل النسخه التلقائيه ' and SudoBot(msg) then  
send(msg.chat_id_, msg.id_,"*• تم تفعيل النسخه الاحتياطيه التلقائيه*") 
database:del(bot_id.."AutoFile")
end
if text == '• تعطيل النسخه التلقائيه ' and SudoBot(msg) then  
send(msg.chat_id_, msg.id_,"*• تم تعطيل النسخه الاحتياطيه التلقائيه*") 
database:set(bot_id.."AutoFile",true) 
end
if text and text:match("^برج (.*)$") and database:get(bot_id.."Mega:brj_Bots"..msg.chat_id_) == "open" then
local Textbrj = text:match("^برج (.*)$")
gk = https.request('https://black-source.tk/BlackTeAM/Horoscopes.php?br='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
send(msg.chat_id_, msg.id_, br.ok.hso)
end
if text == "تفعيل حساب العمر" and Owner(msg) then
send(msg.chat_id_, msg.id_,'•  تم تفعيل حساب العمر')
database:set(bot_id.."Mega:age_Bots"..msg.chat_id_,"open")
end
if text and text:match("^احسب (.*)$") and database:get(bot_id.."Mega:age_Bots"..msg.chat_id_) == "open" then
local Textage = text:match("^احسب (.*)$")
ge = https.request('https://black-source.tk/BlackTeAM/Calculateage.php?age='..URL.escape(Textage)..'')
ag = JSON.decode(ge)
send(msg.chat_id_, msg.id_, ag.ok.hso)
end
if text and not database:get(bot_id.."AutoFile") then
Time = database:get(bot_id.."AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then  
local list = database:smembers(bot_id..'Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'Mega Chat'
ASAS = database:smembers(bot_id.."Mega:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."Mega:Constructor"..v)
MDER = database:smembers(bot_id.."Mega:Manager"..v)
MOD = database:smembers(bot_id.."Mega:Mod:User"..v)
link = database:get(bot_id.."Mega:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"Mega":"'..NAME..'",'
else
t = t..',"'..v..'":{"Mega":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(Id_Sudo, msg.id_,'./File_Libs/'..bot_id..'.json', '• عدد مجموعات التي في البوت { '..#list..'}')
database:set(bot_id.."AutoFile:Time",os.date("%x"))
end
else 
database:set(bot_id.."AutoFile:Time",os.date("%x"))
end
end
 if text == "تعطيل الانستا" and Owner(msg) then
send(msg.chat_id_, msg.id_, '•  تم تعطيل الانستا')
database:set(bot_id.."Mega:insta_bot"..msg.chat_id_,"close")
end
if text == "تفعيل الانستا" and Owner(msg) then
send(msg.chat_id_, msg.id_,'•  تم تفعيل الانستا')
database:set(bot_id.."Mega:insta_bot"..msg.chat_id_,"open")
end
if text and text:match("^معلومات (.*)$") and database:get(bot_id.."Mega:insta_bot"..msg.chat_id_) == "open" then
local Textni = text:match("^معلومات (.*)$")
data,res = https.request('https://black-source.tk/BlackTeAM/infoInstagram.php?username='..URL.escape(Textni)..'')
if res == 200 then
muaed = json:decode(data)
if muaed.Info == true then
local msg_id = msg.id_/2097152/0.5
SendP(msg.chat_id_, msg_id,muaed.ph, muaed.info) 
end
end
end
if text == "تعطيل الافلام" and Owner(msg) then
send(msg.chat_id_, msg.id_, '•  تم تعطيل الافلام')
database:set(bot_id.."Mega:movie_bot"..msg.chat_id_,"close")
end
if text == "تفعيل الافلام" and Owner(msg) then
send(msg.chat_id_, msg.id_,'•  تم تفعيل الافلام')
database:set(bot_id.."Mega:movie_bot"..msg.chat_id_,"open")
end

if text and text:match("^فلم (.*)$") and database:get(bot_id.."Mega:movie_bot"..msg.chat_id_) == "open" then
local Textm = text:match("^فلم (.*)$")
data,res = https.request('https://black-source.tk/BlackTeAM/movie.php?serch='..URL.escape(Textm)..'')
if res == 200 then
getmo = json:decode(data)
if getmo.Info == true then
local Text ='قصه الفلم'..getmo.info
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'مشاهده الفلم بجوده 240',url=getmo.sd}},
{{text = 'مشاهده الفلم بجوده 480', url=getmo.Web},{text = 'مشاهده الفلم بجوده 1080', url=getmo.hd}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end



if text == "غنيلي" then
data,res = https.request('https://black-source.tk/BlackTeAM/audios.php')
if res == 200 then
audios = json:decode(data)
if audios.Info == true then
local Text ='• تم اختيار المقطع الصوتي لك'
inlin = {{{text = '- اضغط هنا للحذف.',callback_data=msg.sender_user_id_..":cancelRd:del"}}, }
send_inline_Media(msg.chat_id_,"sendVoice","voice",audios.info,inlin,msg.id_,Text)  
end
end
end

if text and text:match("^كول (.*)$") then
local Textxt = text:match("^كول (.*)$")
send(msg.chat_id_, msg.id_, Textxt)
end
if (msg.content_.sticker_)  and msg.reply_to_message_id_ == 0 and database:get(bot_id.."Mega:Lock:Xn"..msg.chat_id_)=="del" then      
sticker_id = msg.content_.sticker_.sticker_.persistent_id_
st = https.request('https://Mega-source.tk/Mega TeAm/ImageInfo.php?token='..token..'&url='..sticker_id.."&type=sticker")
eker = JSON.decode(st)
if eker.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."Mega:Basic:Constructor"..msg.chat_id_)
t = "•  المنشئين الاساسين تعالو مخرب \n \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• ماكو منششئين يشوفولك جاره"
end
Reply_Status(msg,msg.sender_user_id_,"reply","• قام بنشر ملصق اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if (msg.content_.photo_) and msg.reply_to_message_id_ == 0 and database:get(bot_id.."Mega:Lock:Xn"..msg.chat_id_)=="del" then
photo_id = msg.content_.photo_.sizes_[1].photo_.persistent_id_  
Srrt = https.request('https://Mega-source.tk/Mega TeAm/ImageInfo.php?token='..token..'&url='..photo_id.."&type=photo")
Sto = JSON.decode(Srrt)
if Sto.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."Mega:Basic:Constructor"..msg.chat_id_)
t = "•  المنشئين الاساسين تعالو مخرب \n \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• ماكو منششئين يشوفولك جاره"
end
Reply_Status(msg,msg.sender_user_id_,"reply","• قام بنشر صوره اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if text == 'ملصق' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.photo_ then 
local pn = result.content_.photo_.sizes_[1].photo_.persistent_id_
Addsticker(msg,msg.chat_id_,pn,msg.sender_user_id_..'.png')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'صوت' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.voice_ then 
local mr = result.content_.voice_.voice_.persistent_id_ 
Addmp3(msg,msg.chat_id_,mr,msg.sender_user_id_..'.mp3')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'بصمه' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.audio_ then 
local mr = result.content_.audio_.audio_.persistent_id_
Addvoi(msg,msg.chat_id_,mr,msg.sender_user_id_..'.ogg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'صوره' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.sticker_ then 
local Str = result.content_.sticker_.sticker_.persistent_id_ 
Addjpg(msg,msg.chat_id_,Str,msg.sender_user_id_..'.jpg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'تفعيل البوت الخدمي' and DevMega(msg) then  
database:del(bot_id..'Mega:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'• تم تفعيل البوت الخدمي ') 
end
if text == 'تعطيل البوت الخدمي' and DevMega(msg) then  
database:set(bot_id..'Mega:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'• تم تعطيل البوت الخدمي') 
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") and DevMega(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") 
database:set(bot_id..'Mega:Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,'•  تم وضع عدد الاعضاء *~'..Num..'* عضو')
end
if text =='الاحصائيات' and DevBot(msg) then
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'Mega:UsersBot')  
send(msg.chat_id_, msg.id_,'• احصائيات البوت \n\n• عدد المجموعات *~ '..Groups..'\n• عدد المشتركين ~ '..Users..'*')
end
if text == 'جلب نسخه احتياطيه' and DevMega(msg) then
local list = database:smembers(bot_id..'Mega:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'MegaChat'
ASAS = database:smembers(bot_id.."Mega:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."Mega:Constructor"..v)
MDER = database:smembers(bot_id.."Mega:Manager"..v)
MOD = database:smembers(bot_id.."Mega:Mod:User"..v)
link = database:get(bot_id.."Mega:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"Mega":"'..NAME..'",'
else
t = t..',"'..v..'":{"Mega":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '•  عدد مجموعات التي في البوت { '..#list..'}')
end

if text == "متجر الملفات" or text == 'المتجر' then
if DevMega(msg) then
local Get_Files, res = https.request("https://rew.github.com/secMega/files_Mega/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "*\n• اهلا بك في متجر ملفات فيكتو\n• يوجد في المتجر ملف الردود\n• يتم ادراج الملفات في التحديثات القادمه \n \n*"
local TextE = "*\n \n• تدل علامة (✔) الملف مفعل\n".."• تدل علامة (✖) الملف معطل\n*"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("files_Mega/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔)"
else
CeckFile = "(✖)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."↺* {`"..name..'`} ↺'..CeckFile..'\n[-  About to the file]('..Info..')\n'
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"*•  لا يوجد اتصال من ال api \n*") 
end
return false
end
end

if text and text:match("^(تعطيل ملف) (.*)(.lua)$") and DevMega(msg) then
local name_t = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("files_Mega/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*•  الملف ↺{"..file.."}\n•  تم تعطيله وحذفه بنجاح \n✓*"
else
t = "*•  بالتاكيد تم تعطيل وحذف ملف ↺{"..file.."} \n✓*"
end
local json_file, res = https.request("https://rew.github.com/secMega/files_Mega/master/files_Mega/"..file)
if res == 200 then
os.execute("rm -fr files_Mega/"..file)
send(msg.chat_id_, msg.id_,t) 
dofile('Mega.lua')  
else
send(msg.chat_id_, msg.id_,"*•  عذرا لا يوجد هاكذا ملف في المتجر *\n") 
end
return false
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") and DevMega(msg) then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("files_Mega/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*•  بالتاكيد تم تنزيل وتفعيل ملف ↺{"..file.."} \n✓*"
else
t = "*•  الملف ↺{"..file.."}\n•  تم تنزيله وتفعيله بنجاح \n*"
end
local json_file, res = https.request("https://rew.github.com/secMega/files_Mega/master/files_Mega/"..file)
if res == 200 then
local chek = io.open("files_Mega/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_,t) 
dofile('Mega.lua')  
else
send(msg.chat_id_, msg.id_,"*•  عذرا لا يوجد هاكذا ملف في المتجر *\n") 
end
return false
end
if text == "مسح جميع الملفات" and DevMega(msg) then
os.execute("rm -fr files_Mega/*")
send(msg.chat_id_,msg.id_,"• تم حذف جميع الملفات")
return false
end
if text == 'نقل الاحصائيات' and DevMega(msg) then
local Users = database:smembers('Mega:'..bot_id.."userss")
local Groups = database:smembers('Mega:'..bot_id..'groups') 
for i = 1, #Groups do
database:sadd(bot_id..'Mega:Chek:Groups',Groups[i])  
end
for i = 1, #Users do
database:sadd(bot_id..'Mega:UsersBot',Users[i])  
end
send(msg.chat_id_, msg.id_,'• تم نقل : '..#Groups..' كروب\n• تم نقل : '..#Users..' مشترك \n• من التحديث القديم الى التحديث الجديد')
end
if text == 'حذف كليشه المطور' and DevMega(msg) then
database:del(bot_id..'Mega:Text_Dev')
send(msg.chat_id_, msg.id_,'•  تم حذف كليشه المطور')
end
if text == 'وضع كليشه المطور' and DevMega(msg) then
database:set(bot_id..'Mega:Set:Text_Dev'..msg.chat_id_,true)
send(msg.chat_id_,msg.id_,'•  ارسل الكليشه الان')
return false
end
if text and database:get(bot_id..'Mega:Set:Text_Dev'..msg.chat_id_) then
if text == 'الغاء' then 
database:del(bot_id..'Mega:Set:Text_Dev'..msg.chat_id_)
send(msg.chat_id_,msg.id_,'• تم الغاء حفظ كليشة المطور')
return false
end
database:set(bot_id..'Mega:Text_Dev',text)
database:del(bot_id..'Mega:Set:Text_Dev'..msg.chat_id_)
send(msg.chat_id_,msg.id_,'• تم حفظ كليشة المطور')
return false
end
if text == 'رفع النسخه الاحتياطيه' and DevMega(msg) then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == "تحديث" and DevMega(msg) then
dofile("Mega.lua")  
send(msg.chat_id_, msg.id_, "*• تم تحديث الملفات*")
end

if text and text:match("تغيير (.*)") and msg.reply_to_message_id_ ~= 0 and Constructor(msg)then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
local namess = text:match("تغيير (.*)")
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي ') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو ⇠ ['..data.first_name_..'](t.me/'..(data.username_ or 'Mega')..') '
status  = '\n• تم تغيير لقب '..namess..''
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&custom_title="..namess)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^(تغيير) @(.*) (.*)$") then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
if not Constructor(msg) then
send(msg.chat_id_,msg.id_,'اهلا عزيزي \n عذرا الامر يخص - منشئ - منشئ اساسي فقط')
return false
end
local TextEnd = {string.match(text, "^(تغيير) @(.*) (.*)$")}
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي ') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هذا معرف قناة يرجى استخدام الامر بصوره صحيحه ")   
return false 
end      
usertext = '\n• العضو ⇠ ['..result.title_..'](t.me/'..(username or 'Mega_Source')..')'
status  = '\n• تم تغيير لقب '..TextEnd[3]..' '
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&custom_title="..TextEnd[3])
else
send(msg.chat_id_, msg.id_, '• لا يوجد حساب بهذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[2]}, start_function, nil)
return false
end
if text and text:match("ضع لقب (.*)") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then
local namess = text:match("ضع لقب (.*)")
function Function_Mega(extra, result, success)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تععين لقب")  
https.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_invite_users=True")
https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&custom_title="..namess)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^(ضع لقب) @(.*) (.*)$") and Constructor(msg) then
local username = {string.match(text, "^(ضع لقب) @(.*) (.*)$")}
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end
Reply_Status(msg,result.id_,"reply","• تم تعيين لقب")  
https.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_invite_users=True")
https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&custom_title="..username[3])
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username[2]}, Function_Mega, nil)
return false
end
if text == ("تعديل الصلاحيات") and tonumber(msg.reply_to_message_id_) ~= 0 and creatorA(msg) then
function Function_Mega(extra, result, success)
key = {
{{text = 'تعديل الصلاحيات', callback_data='amr@'..msg.sender_user_id_..'/user@'..result.sender_user_id_.."/setiinginfo"}},
}
send_inline_key(msg.chat_id_,"*• اختر تعديل الصلاحيات*",nil,key,msg.id_/2097152/0.5)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^تعديل الصلاحيات @(.*)$") and creatorA(msg) then
local username = text:match("^تعديل الصلاحيات @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end
local Text = "• اختر تعديل الصلاحيات"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تعديل الصلاحيات', callback_data='amr@'..msg.sender_user_id_..'/user@'..result.id_.."/setiinginfo"}
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text == ("رفع مشرف") and tonumber(msg.reply_to_message_id_) ~= 0 and creatorA(msg) then
function Function_Mega(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_invite_users=True")
key = {
{{text = 'تعديل الصلاحيات', callback_data='amr@'..msg.sender_user_id_..'/user@'..result.sender_user_id_.."/setiinginfo"}},
}
send_inline_key(msg.chat_id_,"*• تم رفعه مشرف*",nil,key,msg.id_/2097152/0.5)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^رفع مشرف @(.*)$") and creatorA(msg) then
local username = text:match("^رفع مشرف @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end
https.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_invite_users=True")
local Text = "• تم ترقيته مشرف"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تعديل الصلاحيات', callback_data='amr@'..msg.sender_user_id_..'/user@'..result.id_.."/setiinginfo"}
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end
if text == ("تنزيل مشرف") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then
function Function_Mega(extra, result, success)
Reply_Status(msg,result.sender_user_id_,"reply","• تم تنزيله من المشرفين")  
https.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_manage_chat=false&can_manage_voice_chats=false&can_manage_voice_chats=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Mega, nil)
return false
end
if text and text:match("^تنزيل مشرف @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل مشرف @(.*)$")
function Function_Mega(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end
Reply_Status(msg,result.id_,"reply","• تم تنزيله من المشرفين")  
https.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_manage_chat=false&can_manage_voice_chats=false&can_manage_voice_chats=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(msg.chat_id_, msg.id_,"• لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Mega, nil)
return false
end

if text == "يوتيوب" or text == "بوت يوتيوب" then
key = { 
 {{text = '-Youtube  .',url="t.me/youtubibot"}},
}
send_inline_key(msg.chat_id_,"*- Youtube VeCto .*",nil,key,msg.id_/2097152/0.5)
end


if text == 'الايدي' then
if creatorA(msg) then
local Text =[[
*•قائمه اوامر الايدي *
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تعطيل الايدي', callback_data=msg.sender_user_id_.."/unMega:Lock:ID:Bot"},{text = 'تفعيل الايدي', callback_data=msg.sender_user_id_.."/unlockIdd"},
},
{
{text = 'تعطيل الايدي بالصوره', callback_data=msg.sender_user_id_.."مسح المدراء"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end





if text == 'رابط الحذف' or text == 'رابط حذف' then
t =[[
*رابط الحذف في جميع مواقع التواصل • 
فكر قبل لا تتسرع وتروح*
ٴ*— — — — — — — — — *ٴ
 *•  رابط حذف*  [Telegram](https://my.telegram.org/auth?to=delete) ܁
 *•  رابط حذف* [instagram](https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/) ܁
 *•  رابط حذف* [Facebook](https://www.facebook.com/help/deleteaccount) ܁
 *•  رابط حذف* [Snspchat](https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount) ܁
]]
send(msg.chat_id_, msg.id_,t) 
return false
end




if text == 'الاوامر' then  
if not Addictive(msg) then
send(msg.chat_id_, msg.id_,'*• هاذا الامر خاص بالادمنيه*')
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
tdcli_function ({ID = "GetUser",user_id_ = bot_id},function(arg,data) 
local texte = "["..data.first_name_.."](T.me/"..data.username_..")"
key = {
{{text = '{آوآمر الحمايه}', callback_data=msg.sender_user_id_.."/homelocks"},{text = '{آوآمر الادمنيه}', callback_data=msg.sender_user_id_.."/help2"}},
{{text = '{آوآمر المدراء}', callback_data=msg.sender_user_id_.."/help3"},{text = '{آوآمر المنشئين}', callback_data=msg.sender_user_id_.."/help4"}},
{{text = '{آوآمر المطورين}', callback_data=msg.sender_user_id_.."/help5"},{text = '{آوآمر الاعضاء}', callback_data=msg.sender_user_id_.."/help6"}},
{{text = '• اخفاء الامر •', callback_data=msg.sender_user_id_.."/delamr"}},
}
send_inline_key(msg.chat_id_,"\nاهلا بك في بوت "..texte.."\nيمكنك استخدام هذه الاوامر",nil,key,msg.id_/2097152/0.5)
end,nil)
end




if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == 'يا سورس' then  
key = {
{{text = '- Dev VeCto .',url="t.me/Mmssds"}},
{{text = '- 𝘛𝘦𝘢𝘮 VeCto .',url="t.me/TeAm_VeCto"}},
{{text = '- TowsL Dev .',url="t.me/@Tows11bot"}},
}
send_inline_key(msg.chat_id_,"*- VeCto 𝘴𝘰𝘶𝘳𝘤𝘦 .*",nil,key,msg.id_/2097152/0.5)
end





if text == 'فويس' then
data,res = https.request('https://vvvzvv.ml/amirVois/Teland.php')
if res == 200 then
audios = json:decode(data)
if audios.Info == true then
local Text ='*• تم اختيار المقطع الصوتي لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- VeCto TeAM .',url="t.me/TeAm_VeCto"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice='..URL.escape(audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end





end ---- Chat_Type = 'GroupBot' 
end ---- Chat_Type = 'GroupBot' 

if text == 'تفعيل' and DevBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'• البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'Mega:Num:Add:Bot') or 0) and not DevMega(msg) then
send(msg.chat_id_, msg.id_,'• عدد اعضاء القروب اقل من *~ {'..(database:get(bot_id..'Mega:Num:Add:Bot') or 0)..'* عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if database:sismember(bot_id..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'\n*• المجموعة : {'..chat.title_..'}*\n*• تم تفعيلها مسبقا*')
else
local Text = '\n*• المجموعة : {'..chat.title_..'}*\n*• تم تفعيلها بنجاح*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '{رفع المالك والادمنية}',callback_data="/addadmin@"..msg.chat_id_..':'..msg.sender_user_id_},
},
{
{text = '{قفل الكل}',callback_data="/locall@"..msg.chat_id_..':'..msg.sender_user_id_},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
database:sadd(bot_id..'Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '*• تم تفعيل مجموعه جديده*'..
'\n*• اسم القروب ~ '..NameChat..'*'..
'\n*• بواسطة ~* '..Name..''..
'\n*• ايدي القروب '..IdChat..'*'..
'\n*• عدد اعضاء القروب ~ '..NumMember..'*'..
'\n*• عدد الادمنيه ~ '..data.administrator_count_..'*'..
'\n*• عدد المطرودين ~ '..data.kicked_count_..'*'..
'\n*• الوقت ~ '..os.date("%I:%M%p")..'*'..
'\n*• التاريخ ~ '..os.date("%Y/%m/%d")..'*'..
'\n*• الرابط ~* ['..LinkGp..']'
if not DevMega(msg) then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مغادرة البوت',callback_data="/leftbot@"..IdChat},
},
{
{text = URL.escape(NameChat),url=LinkGp},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. Id_Sudo .. '&text=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' and creatorA(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not database:sismember(bot_id..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'*• تم تعطيلها مسبقا ⇠* {'..chat.title_..'}')
else
Reply_Status(msg,result.id_,'reply_Add','*• تم تعطيل القروب ⇠* {'..chat.title_..'}')
database:srem(bot_id..'Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '*• تم تعطيل مجموعة جديدة*'..
'\n*• اسم القروب ~ '..NameChat..'*'..
'\n*• بواسطة ~* '..Name..''..
'\n*• ايدي القروب '..IdChat..'*'..
'\n*• عدد اعضاء القروب ~ '..NumMember..'*'..
'\n*• عدد الادمنيه ~ '..data.administrator_count_..'*'..
'\n*• عدد المطرودين ~ '..data.kicked_count_..'*'..
'\n*• الوقت ~ '..os.date("%I:%M%p")..'*'..
'\n*• التاريخ ~ '..os.date("%Y/%m/%d")..'*'..
'\n*• الرابط ~* ['..LinkGp..']'
if not creatorA(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' and not DevBot(msg) and not database:get(bot_id..'Mega:Free:Add:Bots') then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
local texte = '['..database:get(bot_id..'add:ch:username')..']'
local titlech = (database:get(bot_id..'add:ch:title') or 'آشـترگ بآلقنآ‌‏هہ ')
key = {{{text=''..titlech..'',url='https://telegram.me/'..database:get(bot_id..'add:ch:username'):gsub("@","")}}}   
send_inline_key(msg.chat_id_,"\nعذراً يجب عليك الاشتراك في "..texte.."\nليمكنك استخدام البوت بشكل كامل",nil,key,msg.id_/2097152/0.5)
end

return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'• البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'الادمن'
else 
var= 'عضو'
end
if database:sismember(bot_id..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'\n*• المجموعة : {'..chat.title_..'}*\n*• تم تفعيلها مسبقا*')
end
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'Mega:Num:Add:Bot') or 0) and not DevMega(msg) then
send(msg.chat_id_, msg.id_,'• عدد اعضاء القروب اقل من *~ {'..(database:get(bot_id..'Mega:Num:Add:Bot') or 0)..'* عضو')
else
local Text = '\n*• المجموعة : {'..chat.title_..'}*\n*• تم تفعيلها بنجاح*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '{رفع المالك والادمنيه}',callback_data="/addadmin@"..msg.chat_id_..':'..msg.sender_user_id_},
},
{
{text = '{قفل الكل}',callback_data="/locall@"..msg.chat_id_..':'..msg.sender_user_id_},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
database:sadd(bot_id..'Chek:Groups',msg.chat_id_)  
database:sadd(bot_id..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '*• تم تفعيل مجموعه جديده*'..
'\n*• اسم القروب ~ '..NameChat..'*'..
'\n*• بواسطة ~* '..Name..''..
'\n*• ايدي القروب '..IdChat..'*'..
'\n*• عدد اعضاء القروب ~ '..NumMember..'*'..
'\n*• عدد الادمنيه ~ '..data.administrator_count_..'*'..
'\n*• عدد المطرودين ~ '..data.kicked_count_..'*'..
'\n*• الوقت ~ '..os.date("%I:%M%p")..'*'..
'\n*• التاريخ ~ '..os.date("%Y/%m/%d")..'*'..
'\n*• الرابط ~* ['..LinkGp..']'
if not DevMega(msg) then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مغادرة البوت',callback_data="/leftbot@"..IdChat},
},
{
{text = URL.escape(NameChat),url=LinkGp},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. Id_Sudo .. '&text=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end

if Chat_Type == 'UserBot' then
if text == '/start' then  
if DevMega(msg) then
local Text = '• هلامطوري لحلو'
local keyboard = {
{'• الاحصائيات ','• تغيير المطور الاساسي '},
{'• تفعيل التواصل ','• تعطيل التواصل '},
{'• تنظيف الكروبات ','• تنظيف المشتركين '},
{'• تفعيل البوت الخدمي ','• تعطيل البوت الخدمي '},
{'• اذاعه خاص ','• المطورين ','• اذاعه '},
{'• اذاعه بالتوجيه ','• اذاعه بالتوجيه خاص '},
{'• تفعيل الاذاعه ','• تعطيل الاذاعه '},
{'• تفعيل المغادره ','• تعطيل المغادره '},
{'• مسح العام ','• مسح المطورين '},
{'• حذف كليشه ستارت ','• ضع كليشه ستارت '},
{'• - تعطيل الاشتراك الاجباري  .'},
{'• - تغير الاشتراك  .','• حذف رساله الاشتراك  .'},
{'• - تفعيل الاشتراك الاجباري  .'},
{'• - الاشتراك الاجباري  .'},
{'• تفعيل التعريف','• تعطيل التعريف'},
{'• تفعيل النسخه التلقائيه','• تعطيل النسخه التلقائيه'},
{'• - تعين قناة الاشتراك  .','• - تغير رساله الاشتراك  .'},
{'• تحديث السورس ','• تحديث الملفات '},
{'• العام '},
{'جلب نسخه احتياطيه'},
{'• الغاء'}
}
send_inline_key(msg.chat_id_,Text,keyboard)
else
if not database:get(bot_id..'Mega:Start:Time'..msg.sender_user_id_) then
local start = database:get(bot_id.."Start:Bot")  
if start then 
Test = start
else
tdcli_function ({ID = "GetUser",user_id_ = Sudo},function(arg,data) 
Test = '• مرحبا انا بوت حماية كروبات\n• وضيفتي حماية المجموعات من السبام والتفليش والخ...\n• لتفعيل البوت اضفني الى مجموعاتك قم برفعي مشرف ثم ارسل تفعيل \n• معرف المطور @['..data.username_..']'
end,nil)
end 
send(msg.chat_id_, msg.id_, Test) 
end
end
database:setex(bot_id..'Mega:Start:Time'..msg.sender_user_id_,60,true)
return false
end
if text and text:match("^/start ph(.*)$") then
Sf = database:get(bot_id.."Mega:Filter:msg")
local list = database:smembers(bot_id.."Mega:List:Filter:Photo"..Sf)  
for k,v in pairs(list) do
if v then
inline = {
{{text = '- الغاء المنع .',callback_data="pito"..v}},
}
send_inline_Media(msg.chat_id_,"sendPhoto","photo",v,inline) 
end
end
if #list == 0 then
send(msg.chat_id_, msg.id_,"• لا يوجد صور ممنوعه"  )  
end
Zs = {
{{text = '- اضغط هنا .',callback_data="delallph"..Sf}},
}
send_inlin_key(msg.chat_id_,"• هل تريد اللغاء منع كل الصور؟",Zs,msg.id_)
end  
if text and text:match("^/start msg(.*)$") then
sl = text:match("^/start msg(.*)$")
local list = database:smembers(bot_id.."Mega:List:Filter:text"..sl)
t = "\n• قائمة الكلمات الممنوعه \n \n"
for k,v in pairs(list) do
if v then
t = t..""..k.."- ["..v.."]\n"
end
end
if #list == 0 then
t = "• لا يوجد كلمات ممنوعه"  
end
send(msg.chat_id_, msg.id_,t)  
end  
if text and text:match("^/start gif(.*)$") then
Sf = text:match("^/start gif(.*)$")
local list = database:smembers(bot_id.."Mega:List:Filter:Animation"..Sf)
for k,v in pairs(list) do
if v then
inline = {
{{text = '- الغاء المنع .',callback_data="animation"..v.."chatid"..Sf}},
}
send_inline_Media(msg.chat_id_,"sendanimation","animation",v,inline) 
end
end
if #list == 0 then
t = "• لا يوجد متحركات ممنوعه"  
send(msg.chat_id_, msg.id_,t)  
end
ZsText = "• هل تريد اللغاء منع كل المتحركات؟"
Zs = {
{{text = '- اضغط هنا .',callback_data="delallanimation"..Sf}},
}
send_inlin_key(msg.chat_id_,ZsText,Zs,msg.id_)
end  
if text and text:match("^/start Sti(.*)$") then
Sf = text:match("^/start Sti(.*)$")
local list = database:smembers(bot_id.."Mega:List:Filter:Sticker"..Sf)
for k,v in pairs(list) do
if v then
inline = {
{{text = '- الغاء المنع .',callback_data="Sticker"..v.."chatid"..Sf}},
}
send_inline_Media(msg.chat_id_,"sendSticker","sticker",v,inline) 
end
end
if #list == 0 then
t = "• لا يوجد ملصقات ممنوعه"  
send(msg.chat_id_, msg.id_,t)  
end
ZsText = "• هل تريد اللغاء منع كل  الملصقات؟"
Zs = {
{{text = '- اضغط هنا .',callback_data="delallSticker"..Sf}},
}
send_inlin_key(msg.chat_id_,ZsText,Zs,msg.id_)
end
if not DevMega(msg) and not database:sismember(bot_id..'BaN:In:User',msg.sender_user_id_) and not database:get(bot_id..'Texting:In:Bv') and not database:get(bot_id.."Mega:Filter"..msg.sender_user_id_) then
send(msg.sender_user_id_,msg.id_,'• تمت ارسال رسالتك الى المطور')    
tdcli_function({ID ="GetChat",chat_id_=Id_Sudo},function(arg,chat)  
tdcli_function({ID ="GetChat",chat_id_=msg.sender_user_id_},function(arg,chat)  
tdcli_function({ID="ForwardMessages",chat_id_=Id_Sudo,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,ta) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
sendText(Id_Sudo,'• تم ارسال الملصق من ~ ['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end,nil);end
if DevMega(msg) and msg.reply_to_message_id_ ~= 0 then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
sendText(Id_Sudo,'•  لشخص ↺['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n•  تم حظره من التواصل ',msg.id_/2097152/0.5,'md')
database:sadd(bot_id..'BaN:In:User',data.id_)  
return false  
end 
if text =='الغاء الحظر' then
sendText(Id_Sudo,'• الشخص ↺['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n•  تم الغاء حظره من التواصل ',msg.id_/2097152/0.5,'md')
database:srem(bot_id..'BaN:In:User',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
send(msg.chat_id_, msg.id_,'\n•  فشل ارسال رسالتك لان العضو قام بحظر البوت') 
return false  
end 
if text then    
send(id_user,msg.id_,text)    
Text = '• تمت ارسال الرساله اليه .. '
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '• تمت ارسال الملصق اليه .. '
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '• تمت ارسال الصوره اليه .. '
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, msg.content_.animation_.animation_.persistent_id_)    
Text = '• تمت ارسال المتحركه اليه .. '
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, msg.content_.voice_.voice_.persistent_id_)    
Text = '• تمت ارسال البصمه اليه .. '
end     
sendText(Id_Sudo,Text..'\n'..'•  ~ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);end,nil);end,nil);end,nil);end 
if DevMega(msg) then
if text == '• تفعيل التعريف' then  
database:del(bot_id..'thebot') 
send(msg.chat_id_, msg.id_,'•  تم تفعيل التعريف ') 
end
if text == '• تعطيل التعريف' then  
database:set(bot_id..'thebot',true) 
send(msg.chat_id_, msg.id_,'•  تم تعطيل التعريف ') 
end
if text == '• تفعيل النسخه التلقائيه ' and VIP_DeV(msg) then  
send(msg.chat_id_, msg.id_,"*• تم تفعيل النسخه الاحتياطيه التلقائيه*") 
database:del(bot_id.."AutoFile")
end
if text == '• تعطيل النسخه التلقائيه ' and VIP_DeV(msg) then  
send(msg.chat_id_, msg.id_,"*• تم تعطيل النسخه الاحتياطيه التلقائيه*") 
database:set(bot_id.."AutoFile",true) 
end
if text == '• تفعيل التواصل' then  
database:del(bot_id..'Texting:In:Bv') 
send(msg.chat_id_, msg.id_,'•  تم تفعيل التواصل ') 
end
if text == '• تعطيل التواصل' then  
database:set(bot_id..'Texting:In:Bv',true) 
send(msg.chat_id_, msg.id_,'•  تم تعطيل التواصل ') 
end
if text =='• الاحصائيات' then
local Groups = database:scard(bot_id..'Mega:Chek:Groups')  
local Users = database:scard(bot_id..'Mega:UsersBot')  
send(msg.chat_id_, msg.id_,'• احصائيات البوت \n\n• عدد المجموعات *~ '..Groups..'\n• عدد المشتركين ~ '..Users..'*')
end
if text == "• تنظيف المشتركين" then
local pv = database:smembers(bot_id..'Mega:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m↺THE USER IS SAVE ME ↓\n↺'..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m↺THE USER IS BLOCK ME ↓\n↺'..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'Mega:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'• لا يوجد مشتركين وهميين')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'*• عدد المشتركين الان ~ '..#pv..'\n• تم العثور على ~ '..sendok..' مشترك قام بحظر البوت\n• اصبح عدد المشتركين الان ~ '..ok..' مشترك *')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "• تنظيف الكروبات" then
local group = database:smembers(bot_id..'Mega:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m↺THE BOT IS NOT ADMIN ↓\n↺'..group[i]..'\n\27[1;37m')
database:srem(bot_id..'Mega:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Mega:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m↺THE BOT IS LEFT GROUP ↓\n↺'..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Mega:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m↺THE BOT IS KICKED GROUP ↓\n↺'..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Mega:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'• لا توجد مجموعات وهميه ')   
else
local brok = (w + q)
local sendok = #group - brok
if q == 0 then
brok = ''
else
brok = '\n•  تم ازالة ~ '..q..' مجموعات من البوت'
end
if w == 0 then
storm = ''
else
storm = '\n•  تم ازالة ~'..w..' مجموعه لان البوت عضو'
end
send(msg.chat_id_, msg.id_,'*•  عدد المجموعات الان ~ '..#group..' مجموعه '..storm..''..brok..'\n• اصبح عدد المجموعات الان ~ '..sendok..' مجموعات*\n')   
end
end
end,nil)
end
return false
end
------------------------------------------------------------------------
if text =='• تغيير المطور الاساسي' and VIP_DeV(msg) then
send(msg.chat_id_, msg.id_,'• ارسل ايدي المطور الاساسي الجديد')
database:set(bot_id..'LACKBOTSS:Ed:DevBots',true) 
end
if text =='• تغيير المطور الاساسي' and not VIP_DeV(msg) then
send(msg.chat_id_, msg.id_,'*• دعبل*')
end
if database:get(bot_id.."LACKBOTSS:Ed:DevBots") then
if text and text:match("^(%d+)$") then
local IdDe = text:match("^(%d+)$")
send(msg.chat_id_,msg.id_, "• تم تحفظ المعلومات اضغط (• تحديث الملفات  ) للتنفيذ")
local A = io.open("sudo.lua", 'w')
A:write([[
s = "mmssds"

q = "TeAm_VeCto"

token = "]]..token..[["

Sudo = ]]..IdDe..[[  
]])
A:close()
database:del(bot_id.."LACKBOTSS:Ed:DevBots")
end
end
if text == '• تفعيل البوت الخدمي' then
database:del(bot_id..'Mega:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'\n• تم تفعيل البوت الخدمي ') 
end
if text == '• تعطيل البوت الخدمي' then
database:set(bot_id..'Mega:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'\n• تم تعطيل البوت الخدمي') 
end
if text=="• اذاعه خاص" and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."Mega:Status:Bc") and not DevMega(msg) then 
send(msg.chat_id_, msg.id_,"• الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."Mega:Mega:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي سواء ~ { ملصق, متحركه, صوره, رساله }\n• للخروج ارسل الغاء ") 
return false
end 

if text=="• اذاعه" and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."Mega:Status:Bc") and not DevMega(msg) then 
send(msg.chat_id_, msg.id_,"• الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."Mega:Mega:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي سواء ~ { ملصق, متحركه, صوره, رساله }\n• للخروج ارسل الغاء ") 
return false
end  
if text=="• اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."Mega:Status:Bc") and not DevMega(msg) then 
send(msg.chat_id_, msg.id_,"• الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."Mega:Mega:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي التوجيه الان") 
return false
end 
if text=="• اذاعه بالتوجيه خاص" and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."Mega:Status:Bc") and not DevMega(msg) then 
send(msg.chat_id_, msg.id_,"• الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."Mega:Mega:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي التوجيه الان") 
return false
end 
if text == "• تفعيل الاذاعه" then
database:del(bot_id.."Mega:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n• تم تفعيل الاذاعه " ) 
return false
end 
if text == "• تعطيل الاذاعه" then
database:set(bot_id.."Mega:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n• تم تعطيل الاذاعه") 
return false
end 
if text == "• تفعيل المغادره" then
database:del(bot_id.."Mega:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"• تم تفعيل مغادرة البوت") 
return false 
end
if text == "• تعطيل المغادره" then
database:set(bot_id.."Mega:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "• تم تعطيل مغادرة البوت") 
return false 
end
if text and database:get(bot_id..'Start:Bots') then
if text == '• الغاء' then   
send(msg.chat_id_, msg.id_,"• تم الغاء حفظ كليشه ستارت") 
database:del(bot_id..'Start:Bots') 
return false
end
database:set(bot_id.."Start:Bot",text)  
send(msg.chat_id_, msg.id_,'• تم حفظ كليشه ستارت') 
database:del(bot_id..'Start:Bots') 
return false
end
if text == '• ضع كليشه ستارت' then
database:set(bot_id..'Start:Bots',true) 
send(msg.chat_id_, msg.id_,'• ارسل لي الكليشه الان') 
return false
end
if text == '• حذف كليشه ستارت' then
database:del(bot_id..'Start:Bot') 
send(msg.chat_id_, msg.id_,'• تم حذف كليشه ستارت') 
end
if text and text:match("^-• تغير الاشتراك .$") and DevMega(msg) then  
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '• حسنآ ارسل لي معرف القناة')
return false  
end
if text and text:match("^-• تغير رساله الاشتراك .$") and DevMega(msg) then  
database:setex(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '• حسنآ ارسل لي النص الذي تريده')
return false  
end
if text == "• حذف رساله الاشتراك" and DevMega(msg) then  
database:del(bot_id..'text:ch:user')
send(msg.chat_id_, msg.id_, "• تم مسح رساله الاشتراك ")
return false  
end
if text and text:match("^- تعين قناة الاشتراك•  .$") and DevMega(msg) then  
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '• حسنآ ارسل لي معرف القناة')
return false  
end
if text == "• - تفعيل الاشتراك الاجباري  ." and DevMega(msg) then  
if database:get(bot_id..'add:ch:id') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_,"• الاشتراك الاجباري مفعل \n• على القناة ↺["..addchusername.."]")
else
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_,"• اهلا عزيزي المطور \n• ارسل الان معرف قناتك")
end
return false  
end
if text == "• - تعطيل الاشتراك الاجباري  ." and DevMega(msg) then  
database:del(bot_id..'add:ch:id')
database:del(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, "• تم تعطيل الاشتراك الاجباري ")
return false  
end
if text == "• - الاشتراك الاجباري  ." and DevMega(msg) then  
if database:get(bot_id..'add:ch:username') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, "• تم تفعيل الاشتراك الاجباري \n• على القناة ↺["..addchusername.."]")
else
send(msg.chat_id_, msg.id_, "• لا يوجد قناة في الاشتراك الاجباري ")
end
return false  
end
if database:get(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ")
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local username = string.match(text, "@[%a%d_]+") 
tdcli_function ({    
ID = "SearchPublicChat",    
username_ = username  
},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '• المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '• عذا لا يمكنك وضع معرف حسابات في الاشتراك ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,'• عذا لا يمكنك وضع معرف مجموعه بالاشتراك ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'• البوت ادمن في القناة \n• تم تفعيل الاشتراك الاجباري في \n• ايدي القناة ('..data.id_..')\n• معرف القناة ([@'..data.type_.channel_.username_..'])')
database:set(bot_id..'add:ch:id',data.id_)
database:set(bot_id..'add:ch:username','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,'• عذرآ البوت ليس ادمن بالقناه ')
end
return false  
end
end,nil)
end
if database:get(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ")
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
database:set(bot_id..'text:ch:user',texxt)
send(msg.chat_id_, msg.id_,'• تم تغيير رسالة الاشتراك ')
end
if text == ("• مسح العام") and DevMega(msg) then
database:del(bot_id.."Mega:GBan:User")
send(msg.chat_id_, msg.id_, "\n• تم مسح العام")
return false
end
if text == ("• مسح المطورين") and DevMega(msg) then
database:del(bot_id.."Mega:Sudo:User")
send(msg.chat_id_, msg.id_, "\n•  تم مسح المطورين  ")
end
if text == ("• العام") and DevMega(msg) then
local list = database:smembers(bot_id.."Mega:GBan:User")
t = "\n• قائمة المحظورين عام \n \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("• المطورين") and DevMega(msg) then
local list = database:smembers(bot_id.."Mega:Sudo:User")
t = "\n• قائمة مطورين البوت \n \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد مطورين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == 'جلب نسخه احتياطيه' and DevMega(msg) then
local list = database:smembers(bot_id..'Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'Mega Chat'
ASAS = database:smembers(bot_id.."Mega:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."Mega:Constructor"..v)
MDER = database:smembers(bot_id.."Mega:Manager"..v)
MOD = database:smembers(bot_id.."Mega:Mod:User"..v)
link = database:get(bot_id.."Mega:Link_Group"..v) or ''
sudo = database:get(bot_id.."Mega:Sudo:Rd"..v)
if sudo then
sudo = string.gsub(sudo,'"','')
sudo = string.gsub(sudo,"'",'')
sudo = string.gsub(sudo,'*','')
sudo = string.gsub(sudo,'`','')
sudo = string.gsub(sudo,'{','')
sudo = string.gsub(sudo,'}','')
sudo = string.gsub(sudo,'\n',' ')
end
pres = database:get(bot_id.."Mega:BasicConstructor:Rd"..v)
if pres then
pres = string.gsub(pres,'"','')
pres = string.gsub(pres,"'",'')
pres = string.gsub(pres,'*','')
pres = string.gsub(pres,'`','')
pres = string.gsub(pres,'{','')
pres = string.gsub(pres,'}','')
pres = string.gsub(pres,'\n',' ')
end
cons = database:get(bot_id.."Mega:Constructor:Rd"..v)
if cons then
cons = string.gsub(cons,'"','')
cons = string.gsub(cons,"'",'')
cons = string.gsub(cons,'*','')
cons = string.gsub(cons,'`','')
cons = string.gsub(cons,'{','')
cons = string.gsub(cons,'}','')
cons = string.gsub(cons,'\n',' ')
end
mang = database:get(bot_id.."Mega:Manager:Rd"..v) 
if mang then
mang = string.gsub(mang,'"','')
mang = string.gsub(mang,"'",'')
mang = string.gsub(mang,'*','')
mang = string.gsub(mang,'`','')
mang = string.gsub(mang,'{','')
mang = string.gsub(mang,'}','')
mang = string.gsub(mang,'\n',' ')
end
admin = database:get(bot_id.."Mega:Mod:Rd"..v)
if admin then
admin = string.gsub(admin,'"','')
admin = string.gsub(admin,"'",'')
admin = string.gsub(admin,'*','')
admin = string.gsub(admin,'`','')
admin = string.gsub(admin,'{','')
admin = string.gsub(admin,'}','')
admin = string.gsub(admin,'\n',' ')
end
vipe = database:get(bot_id.."Mega:Special:Rd"..v)
if vipe then
vipe = string.gsub(vipe,'"','')
vipe = string.gsub(vipe,"'",'')
vipe = string.gsub(vipe,'*','')
vipe = string.gsub(vipe,'`','')
vipe = string.gsub(vipe,'{','')
vipe = string.gsub(vipe,'}','')
vipe = string.gsub(vipe,'\n',' ')
end
memp = database:get(bot_id.."Mega:Memp:Rd"..v)
if memp then
memp = string.gsub(memp,'"','')
memp = string.gsub(memp,"'",'')
memp = string.gsub(memp,'*','')
memp = string.gsub(memp,'`','')
memp = string.gsub(memp,'{','')
memp = string.gsub(memp,'}','')
memp = string.gsub(memp,'\n',' ')
end
if k == 1 then
t = t..'"'..v..'":{"Mega":"'..NAME..'",'
else
t = t..',"'..v..'":{"Mega":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if sudo then
t = t..'"Status_Dev":"'..sudo..'",'
end
if Status_Prt then
t = t..'"Status_Prt":"'..pres..'",'
end
if pres then
t = t..'"Status_Cto":"'..cons..'",'
end
if mang then
t = t..'"Status_Own":"'..mang..'",'
end
if admin then
t = t..'"Status_Md":"'..admin..'",'
end
if vipe then
t = t..'"Status_Vip":"'..vipe..'",'
end
if memp then
t = t..'"Status_Mem":"'..memp..'",'
end
t = t..'"Dev":"DARK"}'
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '• عدد مجموعات التي في البوت { '..#list..'}')
end
if text == "• تحديث السورس" then
send(msg.chat_id_,msg.id_,'*• تم تحديث السورس*')
os.execute('rm -rf Mega.lua')
os.execute('rm -rf start.lua')
os.execute('wget https://raw.githubusercontent.com/secMega/Mega/master/Mega.lua')
os.execute('wget https://raw.githubusercontent.com/secMega/Mega/master/start.lua')
dofile('Mega.lua')  
return false
end
if text == "• تحديث الملفات" then
dofile("Mega.lua")  
send(msg.chat_id_, msg.id_, "*• تم تحديث الملفات*")
end
end
end --- Chat_Type = 'UserBot' 
end
end
function tdcli_update_callback(data)
if data.ID == "UpdateNewInlineCallbackQuery" then
local Text = data.payload_.data_
if Text and Text:match("^(%d+)cle(.*)$")  then  
local idpla  = Text:match("(%d+)")  
local OnID = Text:gsub('cle',''):gsub(idpla,'')
if tonumber(data.sender_user_id_) == tonumber(idpla) then
https.request("https://api.telegram.org/bot"..token..'/answerCallbackQuery?callback_query_id='..data.id_..'&text='..URL.escape('• انت من بدأت اللعبه انتظر من فضلك')..'&show_alert=true')
return false
end
if tonumber(data.sender_user_id_) ~= tonumber(idpla) then
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,me) 
tdcli_function ({ID = "GetUser",user_id_ = idpla},function(arg,you) 
if OnID == "faz" then
EiMsg = "👤︙الفائز : ( "..me.first_name_.." )\n🧟‍♀️︙حظ اوفر ( "..you.first_name_.." )"
elseif OnID== "lose" then
EiMsg = "👤︙الفائز : ( "..you.first_name_.." )\n🧟‍♀️︙حظ اوفر ( "..me.first_name_.." )"
elseif OnID== "tadl" then
EiMsg = "👤︙النتيجه تعادل : ( "..you.first_name_.." )|( "..me.first_name_.." ) "
end
x = {} 
x.inline_keyboard = {
{{text ="اللعب مجددا",switch_inline_query=math.random(8282828283,28383883833)}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?inline_message_id='..data.inline_message_id_..'&text='..URL.escape(EiMsg)..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(x)) 
end,nil)   
end,nil)   
end
end
end
if data.ID == "UpdateNewInlineQuery" then
local Text = data.query_
if Text then
local input_message_content = {message_text = "✂️︙ حجره ورقه مقص\n👤︙ اضغط للعب ", parse_mode = 'Markdown'}	
local resuult = {{
type = 'article',
id = math.random(1,64),
title = 'حجره',
input_message_content = input_message_content,
reply_markup = {
inline_keyboard ={
{{text ="- مقص ", callback_data = data.sender_user_id_.."clelose"},{text ="- ورقه ", callback_data = data.sender_user_id_.."clefaz"},{text ="- حجره", callback_data = data.sender_user_id_.."cletadl"}}
}
},
thumb_url = 'https://black-source.tk/geam1.jpg'
},{
type = 'article',
id = math.random(1,64),
title = 'ورقه',
input_message_content = input_message_content,
reply_markup = {
inline_keyboard ={
{{text ="- مقص ", callback_data = data.sender_user_id_.."clefaz"},{text ="- ورقه ", callback_data = data.sender_user_id_.."clelose"},{text ="- حجره", callback_data = data.sender_user_id_.."cletadl"}}
}
},
thumb_url = 'https://black-source.tk/geam2.jpg'	
},{
type = 'article',
id = math.random(1,64),
title = 'مقص',
input_message_content = input_message_content,
reply_markup = {
inline_keyboard ={
{{text ="- مقص ", callback_data = data.sender_user_id_.."cletadl"},{text ="- ورقه ", callback_data = data.sender_user_id_.."clelose"},{text ="- حجره", callback_data = data.sender_user_id_.."clefaz"}}
}
},
thumb_url = 'https://black-source.tk/geam3.jpg'	
}
}
https.request("https://api.telegram.org/bot"..token..'/answerInlineQuery?inline_query_id='..data.id_..'&switch_pm_text=اختر&switch_pm_parameter=start&results='..JSON.encode(resuult))
end
end
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
database:srem(bot_id..'Mega:Chek:Groups','-100'..data.channel_.id_)  
end
end
if data.ID == "UpdateNewCallbackQuery" then
local Chat_id = data.chat_id_
local From_id = data.id_
local Msg_id = data.message_id_
local msg_idd = Msg_id/2097152/0.5
local DAata = data.payload_.data_
local Text = data.payload_.data_

if text == 'help1' and Addictive(msg) then  
local Texti = '*\n• اعدادات المجموعه \n• علامة ال {✅} تعني مقفول\n• علامة ال {❌} تعني مفتوح*'
local mute_text = (database:get(bot_id.."Mega:Lock:text"..msg.chat_id_)  or '{❌}')
local mute_text1 = mute_text:gsub('del', '{✅}')
local lock_bots = (database:get(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_) or '{❌}')
local lock_bots1 = lock_bots:gsub('kick', '{✅}')
local mute_tgservice = (database:get(bot_id.."Mega:Lock:tagservr"..msg.chat_id_) or '{❌}')
local mute_tgservice1 = mute_tgservice:gsub('true', '{✅}')
local lock_edit = (database:get(bot_id.."Mega:Lock:edit"..msg.chat_id_) or '{❌}')
local lock_edit1 = lock_edit:gsub('true', '{✅}')
local lock_link = (database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) or '{❌}')
local lock_link1 = lock_link:gsub('del', '{✅}')
local lock_username = (database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) or '{❌}')
local lock_username1 = lock_username:gsub('del', '{✅}')
local lock_tag = (database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) or '{❌}')
local lock_tag1 = lock_tag:gsub('del', '{✅}')
local mute_sticker = (database:get(bot_id.."Mega:Lock:Sticker"..msg.chat_id_) or '{❌}')
local mute_sticker1 = mute_sticker:gsub('del', '{✅}')
local mute_gif = (database:get(bot_id.."Mega:Lock:Animation"..msg.chat_id_) or '{❌}')
local mute_gif1 = mute_gif:gsub('del', '{✅}')
local mute_video = (database:get(bot_id.."Mega:Lock:Video"..msg.chat_id_) or '{❌}')
local mute_video1 = mute_video:gsub('del', '{✅}')
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = URL.escape(mute_text1) , callback_data="h"},{text = 'قفل الدردشه ', callback_data=msg.sender_user_id_.."/mute_text"},{text = 'فتح الدردشه', callback_data=msg.sender_user_id_.."/unmute_text"},
},
{
{text = URL.escape(lock_bots1) , callback_data="h"},{text = 'قفل البوتات', callback_data=msg.sender_user_id_.."/lock_bots"},{text = 'فتح البوتات', callback_data=msg.sender_user_id_.."/unlock_bots"},
},
{
{text = URL.escape(mute_tgservice1) , callback_data="h"},{text = 'قفل الاشعارات', callback_data=msg.sender_user_id_.."/mute_tgservice"},{text = 'فتح الاشعارات', callback_data=msg.sender_user_id_.."/unmute_tgservice"},
},
{
{text = URL.escape(lock_edit1) , callback_data="h"},{text = 'قفل التعديل', callback_data=msg.sender_user_id_.."/lock_edit"},{text = 'فتح التعديل', callback_data=msg.sender_user_id_.."/unlock_edit"},
},
{
{text = URL.escape(lock_link1) , callback_data="h"},{text = 'قفل الروابط', callback_data=msg.sender_user_id_.."/lock_link"},{text = 'فتح الروابط', callback_data=msg.sender_user_id_.."/unlock_link"},
},
{
{text = URL.escape(lock_username1) , callback_data="h"},{text = 'قفل المعرفات', callback_data=msg.sender_user_id_.."/lock_username"},{text = 'فتح المعرفات', callback_data=msg.sender_user_id_.."/unlock_username"},
},
{
{text = URL.escape(lock_tag1) , callback_data="h"},{text = 'قفل التاك', callback_data=msg.sender_user_id_.."/lock_tag"},{text = 'فتح التاك', callback_data=msg.sender_user_id_.."/unlock_tag"},
},
{
{text = URL.escape(mute_gif1) , callback_data="h"},{text = 'قفل المتحركه', callback_data=msg.sender_user_id_.."/mute_gif"},{text = 'فتح المتحركه', callback_data=msg.sender_user_id_.."/unmute_gif"},
},
{
{text = URL.escape(mute_sticker1) , callback_data="h"},{text = 'قفل الملصقات', callback_data=msg.sender_user_id_.."/mute_sticker"},{text = 'فتح الملصقات', callback_data=msg.sender_user_id_.."/unmute_sticker"},
},
{
{text = URL.escape(mute_video1) , callback_data="h"},{text = 'قفل الفيديو', callback_data=msg.sender_user_id_.."/mute_video"},{text = 'فتح الفيديو', callback_data=msg.sender_user_id_.."/unmute_video"},
},
{
{text = 'التالي ...', callback_data=msg.sender_user_id_.."/homelocks1"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Texti).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == '/add' then
local Texti = 'تستطيع تفعيل وتعطيل عبر الازرار'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تفعيل الطرد ', callback_data=msg.sender_user_id_.."/Ban:Cheking"},{text = 'تعطيل الطرد', callback_data=msg.sender_user_id_.."/unBan:Cheking"},
},
{
{text = 'تفعيل الرفع', callback_data=msg.sender_user_id_.."/Add:Group:Cheking"},{text = 'تعطيل الرفع', callback_data=msg.sender_user_id_.."/unAdd:Group:Cheking"},
},
{
{text = 'تفعيل الرابط', callback_data=msg.sender_user_id_.."/Mega:Link_Group"},{text = 'تعطيل الرابط', callback_data=msg.sender_user_id_.."/unMega:Link_Group"},
},
{
{text = 'تفعيل الترحيب', callback_data=msg.sender_user_id_.."/Mega:Chek:Welcome"},{text = 'تعطيل الترحيب', callback_data=msg.sender_user_id_.."/unMega:Chek:Welcome"},
},
{
{text = 'تفعيل ردود المدير', callback_data=msg.sender_user_id_.."/Mega:Reply:Manager"},{text = 'تعطيل ردود المدير', callback_data=msg.sender_user_id_.."/unMega:Reply:Manager"},
},
{
{text = 'تفعيل ردود المطور', callback_data=msg.sender_user_id_.."/Mega:Reply:Sudo"},{text = 'تعطيل ردود المطور', callback_data=msg.sender_user_id_.."/unMega:Reply:Sudo"},
},
{
{text = 'تفعيل اطردني', callback_data=msg.sender_user_id_.."/Mega:Kick:Me"},{text = 'تعطيل اطردني', callback_data=msg.sender_user_id_.."/unMega:Kick:Me"},
},
{
{text = 'تفعيل المغادره', callback_data=msg.sender_user_id_.."/Mega:Left:Bot"},{text = 'تعطيل المغادره', callback_data=msg.sender_user_id_.."/unMega:Left:Bot"},
},
{
{text = 'تفعيل الاذاعه', callback_data=msg.sender_user_id_.."/Mega:Status:Bc"},{text = 'تعطيل الاذاعه', callback_data=msg.sender_user_id_.."/unMega:Status:Bc"},
},
{
{text = 'تفعيل اوامر التحشيش', callback_data=msg.sender_user_id_.."/Mega:Fun_Bots"},{text = 'تعطيل اوامر التحشيش', callback_data=msg.sender_user_id_.."/unMega:Fun_Bots"},
},
{
{text = 'تفعيل الايدي ', callback_data=msg.sender_user_id_.."/Mega:Lock:ID:Bot"},{text = 'تعطيل الايدي', callback_data=msg.sender_user_id_.."/unMega:Lock:ID:Bot"},
},
{
{text = 'تفعيل الايدي بالصوره', callback_data=msg.sender_user_id_.."/Mega:Lock:ID:Bot:Photo"},{text = 'تعطيل الايدي بالصوره', callback_data=msg.sender_user_id_.."/unMega:Lock:ID:Bot:Photo"},
},
{
{text = 'تفعيل التنظيف', callback_data=msg.sender_user_id_.."/Lock:delmsg"},{text = 'تعطيل التنظيف', callback_data=msg.sender_user_id_.."/unLock:delmsg"},
},
{
{text = 'تفعيل الالعاب', callback_data=msg.sender_user_id_.."/Mega:Lock:Games"},{text = 'تعطيل الالعاب', callback_data=msg.sender_user_id_.."/unMega:Lock:Games"},
},
{
{text = 'تفعيل تاك للكل', callback_data=msg.sender_user_id_.."/Cick:all"},{text = 'تعطيل تاك للكل', callback_data=msg.sender_user_id_.."/unCick:all"},
},
{
{text = 'تفعيل للزخرفه', callback_data=msg.sender_user_id_.."/Mega:zhrf_Bots"},{text = 'تعطيل الزخرفه', callback_data=msg.sender_user_id_.."/unMega:zhrf_Bots"},
},
{
{text = 'تفعيل الابراج', callback_data=msg.sender_user_id_.."/Mega:brj_Bots"},{text = 'تعطيل الابراج', callback_data=msg.sender_user_id_.."/unMega:brj_Bots"},
},
{
{text = 'تفعيل حساب العمر', callback_data=msg.sender_user_id_.."/Mega:age_Bots"},{text = 'تعطيل حساب للعمر', callback_data=msg.sender_user_id_.."/unMega:age_Bots"},
},
{
{text = 'تفعيل الافلام', callback_data=msg.sender_user_id_.."/Mega:movie_bot"},{text = 'تعطيل الافلام', callback_data=msg.sender_user_id_.."/unMega:movie_bot"},
},
{
{text = 'تفعيل البوت الخدمي', callback_data=msg.sender_user_id_.."/Mega:Free:Add:Bots"},{text = 'تعطيل البوت الخدمي', callback_data=msg.sender_user_id_.."/unMega:Free:Add:Bots"},
},
{
{text = 'تفعيل الانستا', callback_data=msg.sender_user_id_.."/Mega:insta_bot"},{text = 'تعطيل الانستا', callback_data=msg.sender_user_id_.."/unMega:insta_bot"},
},

}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Texti).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if Text and Text:match('(.*)/unktm(.*)') then
local Userid = {Text:match('(.*)/unktm(.*)')}
if tonumber(Userid[1]) == tonumber(data.sender_user_id_) then
database:srem(bot_id.."Mega:Muted:User"..data.chat_id_, Userid[2])
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم الغاء الكتم عنه*')..'&message_id='..msg_idd..'&parse_mode=markdown') 
end
end
if Text and Text:match('(.*)/unban(.*)') then
local Userid = {Text:match('(.*)/unban(.*)')}
if tonumber(Userid[1]) == tonumber(data.sender_user_id_) then
database:srem(bot_id.."Mega:Ban:User"..data.chat_id_, Userid[2])
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم الغاء الحظر عنه*')..'&message_id='..msg_idd..'&parse_mode=markdown') 
end
end
if Text and Text:match('(.*)/unkkid(.*)') then
local Userid = {Text:match('(.*)/unkkid(.*)')}
if tonumber(Userid[1]) == tonumber(data.sender_user_id_) then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. data.chat_id_ .. "&user_id=" .. Userid[2] .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم الغاء التقييد عنه*')..'&message_id='..msg_idd..'&parse_mode=markdown') 
end
end
if Text and Text:match('(.*)/unktm(.*)') then
local Userid = {Text:match('(.*)/unktm(.*)')}
if tonumber(Userid[1]) == tonumber(data.sender_user_id_) then
database:srem(bot_id.."Mega:Muted:User"..data.chat_id_, Userid[2])
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم الغاء الكتم عنه*')..'&message_id='..msg_idd..'&parse_mode=markdown') 
end
end
if Text and Text:match('(.*)/unban(.*)') then
local Userid = {Text:match('(.*)/unban(.*)')}
if tonumber(Userid[1]) == tonumber(data.sender_user_id_) then
database:srem(bot_id.."Mega:Ban:User"..data.chat_id_, Userid[2])
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم الغاء الحظر عنه*')..'&message_id='..msg_idd..'&parse_mode=markdown') 
end
end
if Text and Text:match('(.*)/unkkid(.*)') then
local Userid = {Text:match('(.*)/unkkid(.*)')}
if tonumber(Userid[1]) == tonumber(data.sender_user_id_) then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. data.chat_id_ .. "&user_id=" .. Userid[2] .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم الغاء التقييد عنه*')..'&message_id='..msg_idd..'&parse_mode=markdown') 
end
end

if Text and Text:match('(.*)/del1gif') then
if tonumber(Text:match('(.*)/del1gif')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:Gif"..v..data.chat_id_) then
database:del(bot_id.."Mega:Add:Rd:Manager:Gif"..v..data.chat_id_)   
database:srem(bot_id.."Mega:List:Manager"..data.chat_id_,v)
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم مسح ردود المتحركه*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/del1stik') then
if tonumber(Text:match('(.*)/del1stik')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:Stekrs"..v..data.chat_id_) then
database:del(bot_id.."Mega:Add:Rd:Manager:Stekrs"..v..data.chat_id_)   
database:srem(bot_id.."Mega:List:Manager"..data.chat_id_,v)
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم مسح ردود الملصقات*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/del1text') then
if tonumber(Text:match('(.*)/del1text')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:Text"..v..data.chat_id_) then
database:del(bot_id.."Mega:Add:Rd:Manager:Text"..v..data.chat_id_)   
database:srem(bot_id.."Mega:List:Manager"..data.chat_id_,v)
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم مسح ردود النصيه*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/del1mp3') then
if tonumber(Text:match('(.*)/del1mp3')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:File"..v..data.chat_id_) then
database:del(bot_id.."Mega:Add:Rd:Manager:File"..v..data.chat_id_)   
database:srem(bot_id.."Mega:List:Manager"..data.chat_id_,v)
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم مسح ردود Mp3*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/del1ogg') then
if tonumber(Text:match('(.*)/del1ogg')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:Vico"..v..data.chat_id_) then
database:del(bot_id.."Mega:Add:Rd:Manager:Vico"..v..data.chat_id_)   
database:srem(bot_id.."Mega:List:Manager"..data.chat_id_,v)
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('*- تم مسح ردود البصمات*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/golistmderreply') then
if tonumber(Text:match('(.*)/golistmderreply')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
if #list == 0 then
text = "• لا يوجد ردود للمدير"
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(text)..'&message_id='..msg_idd..'&parse_mode=markdown') 
end
local texte = '- ردود المجموعه'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'المتحركه', callback_data=data.sender_user_id_.."/delereplygif"},{text = 'النصيه', callback_data=data.sender_user_id_.."/delereplytext"},
},
{
{text = 'الملصقات', callback_data=data.sender_user_id_.."/delereplystickar"},{text = 'الصوتيات', callback_data=data.sender_user_id_.."/delereplyogg"},
},
{
{text = 'ال mp3', callback_data=data.sender_user_id_.."/delereplymp3"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(texte)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/delereplygif') then
if tonumber(Text:match('(.*)/delereplygif')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
if #list == 0 then
text = "• لا يوجد ردود للمدير"
return send(data.chat_id_, Msg_id,"["..text.."]")
end
text = ""
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:Gif"..v..data.chat_id_) then
text = text..""..k.." - "..v.." \n"
else
text = text.."• لا يوجد ردود متحركه"
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مسح ردود المتحركه', callback_data=data.sender_user_id_.."/del1gif"},
},
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/delereplytext') then
if tonumber(Text:match('(.*)/delereplytext')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
if #list == 0 then
text = "• لا يوجد ردود للمدير"
return send(data.chat_id_, Msg_id,"["..text.."]")
end
text = ""
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:Text"..v..data.chat_id_) then
text = text..""..k.." - "..v.." \n"
else
text = text.."• لا يوجد ردود نصيه"
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مسح ردود النصيه', callback_data=data.sender_user_id_.."/del1text"},
},
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/delereplystickar') then
if tonumber(Text:match('(.*)/delereplystickar')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
if #list == 0 then
text = "• لا يوجد ردود للمدير"
return send(data.chat_id_, Msg_id,"["..text.."]")
end
text = ""
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:Stekrs"..v..data.chat_id_) then
text = text..""..k.." - "..v.." \n"
else
text = text.."• لا يوجد ردود ملصقات"
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مسح ردود الملصقات', callback_data=data.sender_user_id_.."/del1stik"},
},
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/delereplyogg') then
if tonumber(Text:match('(.*)/delereplyogg')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
if #list == 0 then
text = "• لا يوجد ردود للمدير"
return send(data.chat_id_, Msg_id,"["..text.."]")
end
text = ""
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:Gif"..v..data.chat_id_) then
text = text..""..k.." - "..v.." \n"
else
text = text.."• لا يوجد ردود بصمات"
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مسح ردود البصمات', callback_data=data.sender_user_id_.."/del1ogg"},
},
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(.*)/delereplymp3') then
if tonumber(Text:match('(.*)/delereplymp3')) == tonumber(data.sender_user_id_) then
local list = database:smembers(bot_id.."Mega:List:Manager"..data.chat_id_)
if #list == 0 then
text = "• لا يوجد ردود للمدير"
return send(data.chat_id_, Msg_id,"["..text.."]")
end
text = ""
for k,v in pairs(list) do
if database:get(bot_id.."Mega:Add:Rd:Manager:File"..v..data.chat_id_) then
text = text..""..k.." - "..v.." \n"
else
text = text.."• لا يوجد ردود Mp3"
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مسح ردود الMp3', callback_data=data.sender_user_id_.."/del1mp3"},
},
{
{text = 'العوده', callback_data=data.sender_user_id_.."/golistmderreply"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end

if Text and Text:match('(.*)/delDevv') and VIP_DeV(data) then
if tonumber(Text:match('(.*)/delDevv')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."DEV:Sudo:T")
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح قائمة الثانويين")
end
end
if Text and Text:match('(.*)/delsudos') and VIP_DeV(data) then
if tonumber(Text:match('(.*)/delsudos')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Sudo:User")
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح قائمة المطورين")
end
end
if Text and Text:match('(.*)/deldelcreatorr') and DevBot(data) then
if tonumber(Text:match('(.*)/delcreatorr')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."creator"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المالكين في المجموعة")
end
end
if Text and Text:match('(.*)/delassaseen') and DevBot(data) then
if tonumber(Text:match('(.*)/delassaseen')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Basic:Constructor"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المنشئين الاساسيين في المجموعه")
end
end
if Text and Text:match('(.*)/delmnsh') and BasicConstructor(data) then
if tonumber(Text:match('(.*)/delmnsh')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Constructor"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المنشئين في المجموعه")
end
end
if Text and Text:match('(.*)/delmoder') and Constructor(data) then
if tonumber(Text:match('(.*)/delmoder')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Manager"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المدراء في المجموعه")
end
end
if Text and Text:match('(.*)/deladmin') and Owner(data) then
if tonumber(Text:match('(.*)/deladmin')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Mod:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح الادمنيه في المجموعه")
end
end
if Text and Text:match('(.*)/delvips') and Addictive(data) then
if tonumber(Text:match('(.*)/delvips')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Special:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المميزين في المجموعه")
end
end
if Text and Text:match('(.*)/delCmdd') and Addictive(data) then
if tonumber(Text:match('(.*)/delCmdd')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:List:Cmd:Group:New"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح الاوامر المضافه في المجموعه")
end
end
if Text and Text:match('(.*)/delcleanerr') and Addictive(data) then
if tonumber(Text:match('(.*)/delcleanerr')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:MN:TF"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المنظفين في المجموعه")
end
end
if Text and Text:match('(.*)/delbanall') and DevBot(data) then
if tonumber(Text:match('(.*)/delbanall')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:GBan:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المحظورين عام من البوت")
end
end
if Text and Text:match('(.*)/delban') and Addictive(data) then
if tonumber(Text:match('(.*)/delban')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Ban:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المحظورين في المجموعه")
end
end
if Text and Text:match('(.*)/delktm') and Addictive(data) then
if tonumber(Text:match('(.*)/delktm')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Muted:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المكتومين في المجموعه")
end
end
if Text and Text:match('(.*)/delrd') and Addictive(data) then
if tonumber(Text:match('(.*)/delrd')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم الغاء الامر")
end
end


if Text and Text:match('(.*)/mute_text') then
if tonumber(Text:match('(.*)/mute_text')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:text"..data.chat_id_,true) 
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/lock_bots') then
if tonumber(Text:match('(.*)/lock_bots')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Bot:kick"..data.chat_id_,"kick")  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_tgservice') then
if tonumber(Text:match('(.*)/mute_tgservice')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:tagservr"..data.chat_id_,true)  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/lock_edit') then
if tonumber(Text:match('(.*)/lock_edit')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:edit"..data.chat_id_,true) 
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/lock_link') then
if tonumber(Text:match('(.*)/lock_link')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Link"..data.chat_id_,"del")  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/lock_username') then
if tonumber(Text:match('(.*)/lock_username')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:User:Name"..data.chat_id_,"del")  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/lock_tag') then
if tonumber(Text:match('(.*)/lock_tag')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:hashtak"..data.chat_id_,"del")  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_sticker') then
if tonumber(Text:match('(.*)/mute_sticker')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Sticker"..data.chat_id_,"del")  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_gif') then
if tonumber(Text:match('(.*)/mute_gif')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Animation"..data.chat_id_,"del")  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_video') then
if tonumber(Text:match('(.*)/mute_video')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Video"..data.chat_id_,"del")  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_photo') then
if tonumber(Text:match('(.*)/mute_photo')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Photo"..data.chat_id_,"del")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_voice') then
if tonumber(Text:match('(.*)/mute_voice')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:vico"..data.chat_id_,"del")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_audio') then
if tonumber(Text:match('(.*)/mute_audio')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Audio"..data.chat_id_,"del")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_forward') then
if tonumber(Text:match('(.*)/mute_forward')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:forward"..data.chat_id_,"del")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_document') then
if tonumber(Text:match('(.*)/mute_document')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Document"..data.chat_id_,"del")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_contact') then
if tonumber(Text:match('(.*)/mute_contact')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Contact"..data.chat_id_,"del")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/lock_spam') then
if tonumber(Text:match('(.*)/lock_spam')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Spam"..data.chat_id_,"del")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/lock_flood') then
if tonumber(Text:match('(.*)/lock_flood')) == tonumber(data.sender_user_id_) then
database:hset(bot_id.."Mega:flooding:settings:"..data.chat_id_ ,"flood","del")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/mute_inline') then
if tonumber(Text:match('(.*)/mute_inline')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Inlen"..data.chat_id_,"del")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
end
if Text and Text:match('(.*)/unmute_text') then
if tonumber(Text:match('(.*)/unmute_text')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:text"..data.chat_id_) 
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unlock_bots') then
if tonumber(Text:match('(.*)/unlock_bots')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Bot:kick"..data.chat_id_)  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_tgservice') then
if tonumber(Text:match('(.*)/unmute_tgservice')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:tagservr"..data.chat_id_)  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unlock_edit') then
if tonumber(Text:match('(.*)/unlock_edit')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:edit"..data.chat_id_) 
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unlock_link') then
if tonumber(Text:match('(.*)/unlock_link')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Link"..data.chat_id_)  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unlock_username') then
if tonumber(Text:match('(.*)/unlock_username')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:User:Name"..data.chat_id_)  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unlock_tag') then
if tonumber(Text:match('(.*)/unlock_tag')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:hashtak"..data.chat_id_)  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_sticker') then
if tonumber(Text:match('(.*)/unmute_sticker')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Sticker"..data.chat_id_)  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_gif') then
if tonumber(Text:match('(.*)/unmute_gif')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Animation"..data.chat_id_)  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_video') then
if tonumber(Text:match('(.*)/unmute_video')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Video"..data.chat_id_)  
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_photo') then
if tonumber(Text:match('(.*)/unmute_photo')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Photo"..data.chat_id_)  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_voice') then
if tonumber(Text:match('(.*)/unmute_voice')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:vico"..data.chat_id_)  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_audio') then
if tonumber(Text:match('(.*)/unmute_audio')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Audio"..data.chat_id_)  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_forward') then
if tonumber(Text:match('(.*)/unmute_forward')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:forward"..data.chat_id_)  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_document') then
if tonumber(Text:match('(.*)/unmute_document')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Document"..data.chat_id_)  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_contact') then
if tonumber(Text:match('(.*)/unmute_contact')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Contact"..data.chat_id_)  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unlock_spam') then
if tonumber(Text:match('(.*)/unlock_spam')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Spam"..data.chat_id_)  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unlock_flood') then
if tonumber(Text:match('(.*)/unlock_flood')) == tonumber(data.sender_user_id_) then
database:hdel(bot_id.."Mega:flooding:settings:"..data.chat_id_ ,"flood")  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/unmute_inline') then
if tonumber(Text:match('(.*)/unmute_inline')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Inlen"..data.chat_id_)  
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/homelocks1') then
if tonumber(Text:match('(.*)/homelocks1')) == tonumber(data.sender_user_id_) then
sendin(Chat_id,msg_idd,data.sender_user_id_)
end
elseif Text and Text:match('(.*)/homelocks') then
if tonumber(Text:match('(.*)/homelocks')) == tonumber(data.sender_user_id_) then
sendin1(Chat_id,msg_idd,data.sender_user_id_)
end
end


if Text and Text:match('(.*)/Ban:Cheking') and Constructor(data) then
if tonumber(Text:match('(.*)/Ban:Cheking')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Ban:Cheking"..data.chat_id_)
local Textedit = '• تم تفعيل الطرد '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Add:Group:Cheking') and Constructor(data) then
if tonumber(Text:match('(.*)/Add:Group:Cheking')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Add:Group:Cheking"..data.chat_id_)
local Textedit = '• تم تفعيل الرفع '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Link_Group') then
if tonumber(Text:match('(.*)/Mega:Link_Group')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Link_Group"..data.chat_id_,true) 
local Textedit = '• تم تفعيل جلب الرابط '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Chek:Welcome') then
if tonumber(Text:match('(.*)/Mega:Chek:Welcome')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Chek:Welcome"..data.chat_id_,true) 
local Textedit = '• تم تفعيل الترحيب '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Reply:Manager') and Owner(data) then
if tonumber(Text:match('(.*)/Mega:Reply:Manager')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Reply:Manager"..data.chat_id_)  
local Textedit = '• تم تفعيل ردود المدير '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Reply:Sudo') and Owner(data) then
if tonumber(Text:match('(.*)/Mega:Reply:Sudo')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Reply:Sudo"..data.chat_id_)  
local Textedit = '• تم تفعيل ردود المطور '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Kick:Me') then
if tonumber(Text:match('(.*)/Mega:Kick:Me')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Kick:Me"..data.chat_id_)  
local Textedit = '• تم تفعيل اطردني '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Left:Bot') and DevMega(data) then  
if tonumber(Text:match('(.*)/Mega:Left:Bot')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Left:Bot"..data.chat_id_)  
local Textedit = '• تم تفعيل المغادره '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Status:Bc') and DevMega(data) then  
if tonumber(Text:match('(.*)/Mega:Status:Bc')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Status:Bc") 
local Textedit = '• تم تفعيل الاذاعه '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Fun_Bots') and Owner(data) then    
if tonumber(Text:match('(.*)/Mega:Fun_Bots')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Fun_Bots"..data.chat_id_)
local Textedit = '• تم تفعيل اوامر التحشيش '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Lock:ID:Bot') and Owner(data) then  
if tonumber(Text:match('(.*)/Mega:Lock:ID:Bot')) == tonumber(data.sender_user_id_) then
database:del(bot_id..'Mega:Lock:ID:Bot'..data.chat_id_) 
local Textedit = '• تم تفعيل الايدي '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Lock:ID:Bot:Photo') and Owner(data) then  
if tonumber(Text:match('(.*)/Mega:Lock:ID:Bot:Photo')) == tonumber(data.sender_user_id_) then
database:del(bot_id..'Mega:Lock:ID:Bot:Photo'..data.chat_id_) 
local Textedit = '• تم تفعيل الايدي بالصوره '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Lock:delmsg') and BasicConstructor(data) then   
if tonumber(Text:match('(.*)/Lock:delmsg')) == tonumber(data.sender_user_id_) then
database:set(bot_id..'Lock:delmsg'..data.chat_id_,true) 
local Textedit = '• تم تفعيل التنظيف '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Lock:Games') and Owner(data) then  
if tonumber(Text:match('(.*)/Mega:Lock:Games')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:Games"..data.chat_id_,true) 
local Textedit = '• تم تفعيل الالعاب '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Cick:all') and Constructor(data) then  
if tonumber(Text:match('(.*)/Cick:all')) == tonumber(data.sender_user_id_) then
database:del(bot_id..'Cick:all'..data.chat_id_)  
local Textedit = '• تم تفعيل التاك للكل '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:zhrf_Bots') and Owner(data) then
if tonumber(Text:match('(.*)/Mega:zhrf_Bots')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:zhrf_Bots"..data.chat_id_,"open")
local Textedit = '• تم تفعيل الزخرفه '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:brj_Bots') and Owner(data) then
if tonumber(Text:match('(.*)/Mega:brj_Bots')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:brj_Bots"..data.chat_id_,"open")
local Textedit = '• تم تفعيل الابراج '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:age_Bots') and Owner(data) then
if tonumber(Text:match('(.*)/Mega:age_Bots')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:age_Bots"..data.chat_id_,"open")
local Textedit = '• تم تفعيل حساب العمر '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:movie_bot') and Owner(data) then
if tonumber(Text:match('(.*)/Mega:movie_bot')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:movie_bot"..data.chat_id_,"open")
local Textedit = '• تم تفعيل الافلام '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:Free:Add:Bots') and DevMega(data) then  
if tonumber(Text:match('(.*)/Mega:Free:Add:Bots')) == tonumber(data.sender_user_id_) then
database:del(bot_id..'Mega:Free:Add:Bots') 
local Textedit = '• تم تفعيل البوت الخدمي '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/Mega:insta_bot') and Owner(data) then
if tonumber(Text:match('(.*)/Mega:insta_bot')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:insta_bot"..data.chat_id_,"open")
local Textedit = '• تم تفعيل الانستا '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
end
if Text and Text:match('(.*)/unBan:Cheking') and Constructor(data) then
if tonumber(Text:match('(.*)/unBan:Cheking')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Ban:Cheking"..data.chat_id_,"true")
local Textedit = '*• تم تعطيل الطرد*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/loMega:Lock:ID:Bot') and Owner(data) then  
if tonumber(Text:match('(.*)/loMega:Lock:ID:Bot')) == tonumber(msg.sender_user_id_) then
database:set(bot_id..'Mega:Lock:ID:Bot'..data.chat_id_,true) 
local Textedit = '• تم تعطيل الايدي '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '- اضغط هنا للحذف.',callback_data=msg.sender_user_id_..":cancelRd:del"},
},
}
return https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)

end
elseif Text and Text:match('(.*)/unAdd:Group:Cheking') and Constructor(data) then
if tonumber(Text:match('(.*)/unAdd:Group:Cheking')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Add:Group:Cheking"..data.chat_id_,"true")
local Textedit = '*• تم تعطيل الرفع* '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Link_Group') then
if tonumber(Text:match('(.*)/unMega:Link_Group')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Link_Group"..data.chat_id_) 
local Textedit = '• تم تعطيل جلب الرابط '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Chek:Welcome') then
if tonumber(Text:match('(.*)/unMega:Chek:Welcome')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Chek:Welcome"..data.chat_id_) 
local Textedit = '• تم تعطيل الترحيب '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Reply:Manager') and Owner(data) then
if tonumber(Text:match('(.*)/unMega:Reply:Manager')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Reply:Manager"..data.chat_id_,true)  
local Textedit = '• تم تعطيل ردود المدير '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Reply:Sudo') and Owner(data) then
if tonumber(Text:match('(.*)/unMega:Reply:Sudo')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Reply:Sudo"..data.chat_id_,true)   
local Textedit = '• تم تعطيل ردود المطور '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Kick:Me') then
if tonumber(Text:match('(.*)/unMega:Kick:Me')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Kick:Me"..data.chat_id_,true)  
local Textedit = '• تم تعطيل اطردني '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Left:Bot') and DevMega(data) then  
if tonumber(Text:match('(.*)/unMega:Left:Bot')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Left:Bot"..data.chat_id_,true)   
local Textedit = '• تم تعطيل المغادره '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Status:Bc') and DevMega(data) then  
if tonumber(Text:match('(.*)/unMega:Status:Bc')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Status:Bc",true) 
local Textedit = '• تم تعطيل الاذاعه '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Fun_Bots') and Owner(data) then    
if tonumber(Text:match('(.*)/unMega:Fun_Bots')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Fun_Bots"..data.chat_id_,"true")
local Textedit = '• تم تعطيل اوامر التحشيش '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Lock:ID:Bot') and Owner(data) then  
if tonumber(Text:match('(.*)/unMega:Lock:ID:Bot')) == tonumber(data.sender_user_id_) then
database:set(bot_id..'Mega:Lock:ID:Bot'..data.chat_id_,true) 
local Textedit = '• تم تعطيل الايدي '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Lock:ID:Bot:Photo') and Owner(data) then  
if tonumber(Text:match('(.*)/unMega:Lock:ID:Bot:Photo')) == tonumber(data.sender_user_id_) then
database:set(bot_id..'Mega:Lock:ID:Bot:Photo'..data.chat_id_,true) 
local Textedit = '• تم تعطيل الايدي بالصوره '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unLock:delmsg') and BasicConstructor(data) then   
if tonumber(Text:match('(.*)/unLock:delmsg')) == tonumber(data.sender_user_id_) then
database:del(bot_id..'Lock:delmsg'..data.chat_id_) 
local Textedit = '• تم تعطيل التنظيف '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Lock:Games') and Owner(data) then  
if tonumber(Text:match('(.*)/unMega:Lock:Games')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Lock:Games"..data.chat_id_) 
local Textedit = '• تم تعطيل الالعاب '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unCick:all') and Constructor(data) then  
if tonumber(Text:match('(.*)/unCick:all')) == tonumber(data.sender_user_id_) then
database:set(bot_id..'Cick:all'..data.chat_id_,true)  
local Textedit = '• تم تعطيل تاك للكل '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:zhrf_Bots') and Owner(data) then
if tonumber(Text:match('(.*)/unMega:zhrf_Bots')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:zhrf_Bots"..data.chat_id_,"close")
local Textedit = '• تم تعطيل الزخرفه '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:brj_Bots') and Owner(data) then
if tonumber(Text:match('(.*)/unMega:brj_Bots')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:brj_Bots"..data.chat_id_,"close")
local Textedit = '• تم تعطيل الابراج '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:age_Bots') and Owner(data) then
if tonumber(Text:match('(.*)/unMega:age_Bots')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:age_Bots"..data.chat_id_,"close")
local Textedit = '• تم تعطيل حساب العمر '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:movie_bot') and Owner(data) then
if tonumber(Text:match('(.*)/unMega:movie_bot')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:movie_bot"..data.chat_id_,"close")
local Textedit = '• تم تعطيل الافلام '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:Free:Add:Bots') and DevMega(data) then  
if tonumber(Text:match('(.*)/unMega:Free:Add:Bots')) == tonumber(data.sender_user_id_) then
database:set(bot_id..'Mega:Free:Add:Bots',true) 
local Textedit = '• تم تعطيل البوت الخدمي '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/unMega:insta_bot') and Owner(data) then
if tonumber(Text:match('(.*)/unMega:insta_bot')) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:insta_bot"..data.chat_id_,"close")
local Textedit = '• تم تعطيل الانستا '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data=data.sender_user_id_.."/homeaddwd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  

end
elseif Text and Text:match('(.*)/homeaddwd')  then
if tonumber(Text:match('(.*)/homeaddwd')) == tonumber(data.sender_user_id_) then
local Textedit = '• اوامر التحكم في التفعيل والتعطيل '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تفعيل الطرد ', callback_data=data.sender_user_id_.."/Ban:Cheking"},{text = 'تعطيل الطرد', callback_data=data.sender_user_id_.."/unBan:Cheking"},
},
{
{text = 'تفعيل الرفع', callback_data=data.sender_user_id_.."/Add:Group:Cheking"},{text = 'تعطيل الرفع', callback_data=data.sender_user_id_.."/unAdd:Group:Cheking"},
},
{
{text = 'تفعيل الرابط', callback_data=data.sender_user_id_.."/Mega:Link_Group"},{text = 'تعطيل الرابط', callback_data=data.sender_user_id_.."/unMega:Link_Group"},
},
{
{text = 'تفعيل الترحيب', callback_data=data.sender_user_id_.."/Mega:Chek:Welcome"},{text = 'تعطيل الترحيب', callback_data=data.sender_user_id_.."/unMega:Chek:Welcome"},
},
{
{text = 'تفعيل ردود المدير', callback_data=data.sender_user_id_.."/Mega:Reply:Manager"},{text = 'تعطيل ردود المدير', callback_data=data.sender_user_id_.."/unMega:Reply:Manager"},
},
{
{text = 'تفعيل ردود المطور', callback_data=data.sender_user_id_.."/Mega:Reply:Sudo"},{text = 'تعطيل ردود المطور', callback_data=data.sender_user_id_.."/unMega:Reply:Sudo"},
},
{
{text = 'تفعيل اطردني', callback_data=data.sender_user_id_.."/Mega:Kick:Me"},{text = 'تعطيل اطردني', callback_data=data.sender_user_id_.."/unMega:Kick:Me"},
},
{
{text = 'تفعيل المغادره', callback_data=data.sender_user_id_.."/Mega:Left:Bot"},{text = 'تعطيل المغادره', callback_data=data.sender_user_id_.."/unMega:Left:Bot"},
},
{
{text = 'تفعيل الاذاعه', callback_data=data.sender_user_id_.."/Mega:Status:Bc"},{text = 'تعطيل الاذاعه', callback_data=data.sender_user_id_.."/unMega:Status:Bc"},
},
{
{text = 'تفعيل اوامر التحشيش', callback_data=data.sender_user_id_.."/Mega:Fun_Bots"},{text = 'تعطيل اوامر التحشيش', callback_data=data.sender_user_id_.."/unMega:Fun_Bots"},
},
{
{text = 'تفعيل الايدي ', callback_data=data.sender_user_id_.."/Mega:Lock:ID:Bot"},{text = 'تعطيل الايدي', callback_data=data.sender_user_id_.."/unMega:Lock:ID:Bot"},
},
{
{text = 'تفعيل الايدي بالصوره', callback_data=data.sender_user_id_.."/Mega:Lock:ID:Bot:Photo"},{text = 'تعطيل الايدي بالصوره', callback_data=data.sender_user_id_.."/unMega:Lock:ID:Bot:Photo"},
},
{
{text = 'تفعيل التنظيف', callback_data=data.sender_user_id_.."/Lock:delmsg"},{text = 'تعطيل التنظيف', callback_data=data.sender_user_id_.."/unLock:delmsg"},
},
{
{text = 'تفعيل الالعاب', callback_data=data.sender_user_id_.."/Mega:Lock:Games"},{text = 'تعطيل الالعاب', callback_data=data.sender_user_id_.."/unMega:Lock:Games"},
},
{
{text = 'تفعيل تاك للكل', callback_data=data.sender_user_id_.."/Cick:all"},{text = 'تعطيل تاك للكل', callback_data=data.sender_user_id_.."/unCick:all"},
},
{
{text = 'تفعيل للزخرفه', callback_data=data.sender_user_id_.."/Mega:zhrf_Bots"},{text = 'تعطيل الزخرفه', callback_data=data.sender_user_id_.."/unMega:zhrf_Bots"},
},
{
{text = 'تفعيل الابراج', callback_data=data.sender_user_id_.."/Mega:brj_Bots"},{text = 'تعطيل الابراج', callback_data=data.sender_user_id_.."/unMega:brj_Bots"},
},
{
{text = 'تفعيل حساب العمر', callback_data=data.sender_user_id_.."/Mega:age_Bots"},{text = 'تعطيل حساب للعمر', callback_data=data.sender_user_id_.."/unMega:age_Bots"},
},
{
{text = 'تفعيل الافلام', callback_data=data.sender_user_id_.."/Mega:movie_bot"},{text = 'تعطيل الافلام', callback_data=data.sender_user_id_.."/unMega:movie_bot"},
},
{
{text = 'تفعيل البوت الخدمي', callback_data=data.sender_user_id_.."/Mega:Free:Add:Bots"},{text = 'تعطيل البوت الخدمي', callback_data=data.sender_user_id_.."/unMega:Free:Add:Bots"},
},
{
{text = 'تفعيل الانستا', callback_data=data.sender_user_id_.."/Mega:insta_bot"},{text = 'تعطيل الانستا', callback_data=data.sender_user_id_.."/unMega:insta_bot"},
},
{
{text = '• رجوع •', callback_data=data.sender_user_id_.."/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
end

if Text and Text:match('amr@(%d+)/user@(%d+)/setiinginfo') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/setiinginfo$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end 
end
if Text and Text:match('amr@(%d+)/user@(%d+)/voicetrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/voicetrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = '&can_manage_voice_chats=True'..manage..infoo..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/voicefalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/voicefalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = '&can_manage_voice_chats=false'..manage..infoo..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/managetrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/managetrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..'&can_manage_chat=True'..infoo..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/managefalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/managefalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..'&can_manage_chat=false'..infoo..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/addadmintrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/addadmintrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage..infoo..deletee..invitee..restrictt..pinn..'&can_promote_members=true' 
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/chenginfotrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/chenginfotrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage..'&can_change_info=True' ..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/delmsggtrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/delmsggtrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..'&can_delete_messages=True' ..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/banusertrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/banusertrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..invitee..'&can_restrict_members=True' ..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/pinmsgtrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/pinmsgtrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..invitee..restrictt..'&can_pin_messages=True' ..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/addlinktrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/addlinktrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..'&can_invite_users=True' ..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end


if Text and Text:match('amr@(%d+)/user@(%d+)/addadminfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/addadminfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
if manage then
local ListGruoup = voice..manage.. infoo..deletee..invitee..restrictt..pinn..'&can_promote_members=false'
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
end
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/chenginfofalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/chenginfofalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. '&can_change_info=false' ..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/delmsggfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/delmsggfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..'&can_delete_messages=false'..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/banuserfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/banuserfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..invitee..'&can_restrict_members=false' ..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/pinmsgfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/pinmsgfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..invitee..restrictt..'&can_pin_messages=false' ..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/addlinkfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/addlinkfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..'&can_invite_users=false'  ..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin11(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end


if Text and Text:match('/locall@(.*):(.*)') then
local Userid = {Text:match('/locall@(.*):(.*)')}
if tonumber(Userid[2]) == tonumber(data.sender_user_id_) then
database:set(bot_id.."Mega:Lock:tagservrbot"..Userid[1],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'Mega:'..lock..Userid[1],"del")    
end
https.request("https://api.telegram.org/bot"..token..'/answerCallbackQuery?callback_query_id='..data.id_..'&text='..URL.escape('تم قفل الكل')..'&show_alert=true')
end
end

if Text and Text:match('/fulsbot@(.*):(.*)') then
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'• البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'Mega:Num:Add:Bot') or 0) and not DevMega(msg) then
send(msg.chat_id_, msg.id_,'• عدد اعضاء القروب اقل من *~ {'..(database:get(bot_id..'Mega:Num:Add:Bot') or 0)..'* عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if database:sismember(bot_id..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'\n*• المجموعة : {'..chat.title_..'}*\n*• تم تفعيلها مسبقا*')
else
local Text = '\n*• المجموعة : {'..chat.title_..'}*\n*• تم تفعيلها بنجاح*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '{رفع المالك والادمنية}',callback_data="/addadmin@"..msg.chat_id_..':'..msg.sender_user_id_},
},
{
{text = '{قفل الكل}',callback_data="/locall@"..msg.chat_id_..':'..msg.sender_user_id_},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
database:sadd(bot_id..'Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '*• تم تفعيل مجموعه جديده*'..
'\n*• اسم القروب ~ '..NameChat..'*'..
'\n*• بواسطة ~* '..Name..''..
'\n*• ايدي القروب '..IdChat..'*'..
'\n*• عدد اعضاء القروب ~ '..NumMember..'*'..
'\n*• عدد الادمنيه ~ '..data.administrator_count_..'*'..
'\n*• عدد المطرودين ~ '..data.kicked_count_..'*'..
'\n*• الوقت ~ '..os.date("%I:%M%p")..'*'..
'\n*• التاريخ ~ '..os.date("%Y/%m/%d")..'*'..
'\n*• الرابط ~* ['..LinkGp..']'
if not DevMega(msg) then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مغادرة البوت',callback_data="/leftbot@"..IdChat},
},
{
{text = URL.escape(NameChat),url=LinkGp},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. Id_Sudo .. '&text=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end,nil) 
end,nil) 
end,nil)
end
if Text and Text:match('/addadmin@(.*):(.*)') then
local Userid = {Text:match('/addadmin@(.*):(.*)')}
if tonumber(Userid[2]) == tonumber(data.sender_user_id_) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = Userid[1]:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."Mod:User"..Userid[1], admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."Mod:User"..Userid[1], admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."Mod:User"..Userid[1], admins[i].user_id_)
end
end
end,nil)   
tdcli_function ({ID = "GetChannelMembers",channel_id_ = Userid[1]:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
return false  
end
local UserName = (b.username_ or "TeAm_VeCto")
database:sadd(bot_id.."Basic:Constructor"..Userid[1],b.id_)
end,nil)   
end,nil)   
https.request("https://api.telegram.org/bot"..token..'/answerCallbackQuery?callback_query_id='..data.id_..'&text='..URL.escape('تم رفع الادمنيه والمالك')..'&show_alert=true')
end
end
if Text and Text:match('/leftbot@(.*)') then
local Userid = Text:match('/leftbot@(.*)')
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=Userid,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
https.request("https://api.telegram.org/bot"..token..'/answerCallbackQuery?callback_query_id='..data.id_..'&text='..URL.escape('تم مغادرة البوت')..'&show_alert=true')
end


if Text and Text:match('(.*)/delDevv') and VIP_DeV(data) then
if tonumber(Text:match('(.*)/delDevv')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."DEV:Sudo:T")
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح قائمة الثانويين")
end
end
if Text and Text:match('(.*)/delsudos') and VIP_DeV(data) then
if tonumber(Text:match('(.*)/delsudos')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Sudo:User")
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح قائمة المطورين")
end
end
if Text and Text:match('(.*)/deldelcreatorr') and DevBot(data) then
if tonumber(Text:match('(.*)/delcreatorr')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."creator"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المالكين في المجموعة")
end
end
if Text and Text:match('(.*)/delassaseen') and DevBot(data) then
if tonumber(Text:match('(.*)/delassaseen')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Basic:Constructor"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المنشئين الاساسيين في المجموعه")
end
end
if Text and Text:match('(.*)/delmnsh') and BasicConstructor(data) then
if tonumber(Text:match('(.*)/delmnsh')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Constructor"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المنشئين في المجموعه")
end
end
if Text and Text:match('(.*)/delmoder') and Constructor(data) then
if tonumber(Text:match('(.*)/delmoder')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Manager"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المدراء في المجموعه")
end
end
if Text and Text:match('(.*)/deladmin') and Owner(data) then
if tonumber(Text:match('(.*)/deladmin')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Mod:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح الادمنيه في المجموعه")
end
end
if Text and Text:match('(.*)/delvips') and Addictive(data) then
if tonumber(Text:match('(.*)/delvips')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Special:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المميزين في المجموعه")
end
end
if Text and Text:match('(.*)/delCmdd') and Addictive(data) then
if tonumber(Text:match('(.*)/delCmdd')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:List:Cmd:Group:New"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح الاوامر المضافه في المجموعه")
end
end
if Text and Text:match('(.*)/delcleanerr') and Addictive(data) then
if tonumber(Text:match('(.*)/delcleanerr')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:MN:TF"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المنظفين في المجموعه")
end
end
if Text and Text:match('(.*)/delbanall') and DevBot(data) then
if tonumber(Text:match('(.*)/delbanall')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:GBan:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المحظورين عام من البوت")
end
end
if Text and Text:match('(.*)/delban') and Addictive(data) then
if tonumber(Text:match('(.*)/delban')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Ban:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المحظورين في المجموعه")
end
end
if Text and Text:match('(.*)/delktm') and Addictive(data) then
if tonumber(Text:match('(.*)/delktm')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Muted:User"..data.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم مسح المكتومين في المجموعه")
end
end
if Text and Text:match('(.*)/delrd') and Addictive(data) then
if tonumber(Text:match('(.*)/delrd')) == tonumber(data.sender_user_id_) then
database:del(bot_id.."Mega:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
Edit_Msgees("sendok",data.chat_id_,data.sender_user_id_,data.message_id_, "• تم الغاء الامر")
end
end

if Text and Text:match('(.*)/delamr') then
local Userid = Text:match('(.*)/delamr')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
DeleteMessage(data.chat_id_, {[0] = Msg_id})  
end

if DAata and DAata:match("^animation(.*)$") and Addictive(data) then  
idch = DAata:match("-100(%d+)")
local idchci = "-100"..idch
local animation = DAata:match("^animation(.*)$"):gsub('chatid',''):gsub('chatid',''):gsub(idch,''):gsub('-100','')
local Text ="• تم اللغاء منعها بنجاح"
inline = {
{{text = '•  VeCto 𝖲𝗈𝗎𝗋𝖼𝖾 .  .',url='http://t.me/TeAm_VeCto'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
database:srem(bot_id.."Mega:List:Filter:Animation"..idchci,animation)  
end
if DAata and DAata:match("^pito(.*)$") and Addictive(data) then  
local idchci = database:get(bot_id.."Mega:Filter:msg")
local photo = DAata:match("^pito(.*)$")
local Text ="• تم اللغاء منعها بنجاح"
inline = {
{{text = '•  VeCto 𝖲𝗈??𝗋𝖼𝖾 .  .',url='http://t.me/TeAm_VeCto'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
database:srem(bot_id.."Mega:List:Filter:Photo"..idchci,photo)  
end
if DAata and DAata:match("^Sticker(.*)$") and Addictive(data) then  
idch = DAata:match("-100(%d+)")
local idchci = "-100"..idch
local Sticker = DAata:match("^Sticker(.*)$"):gsub('chatid',''):gsub('chatid',''):gsub(idch,''):gsub('-100','')
local Text ="• تم اللغاء منعه بنجاح"
inline = {
{{text = '•  VeCto 𝖲𝗈𝗎𝗋𝖼𝖾 .  .',url='http://t.me/TeAm_VeCto'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
database:srem(bot_id.."Mega:List:Filter:Sticker"..idchci,Sticker)  
end
if DAata and DAata:match("^delallSticker(.*)$") and Addictive(data) then  
local delallSticker = DAata:match("^delallSticker(.*)$")
local Text ="• تم اللغاء منع كل المتحركات"
inline = {
{{text = '•  VeCto 𝖲𝗈𝗎𝗋𝖼𝖾  .',url='http://t.me/TeAm_VeCto'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
local listSticker = database:smembers(bot_id.."Mega:List:Filter:Sticker"..delallSticker)  
for k,v in pairs(listSticker) do  
database:srem(bot_id.."Mega:List:Filter:Sticker"..delallSticker,v)  
end  
end
if DAata and DAata:match("^delallanimation(.*)$") and Addictive(data) then  
local delallmation = DAata:match("^delallanimation(.*)$")
local Text ="• تم اللغاء منع كل المتحركات"
inline = {
{{text = '•  VeCto 𝖲𝗈𝗎𝗋𝖼𝖾 .  .',url='http://t.me/TeAm_VeCto'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
local listAnimation = database:smembers(bot_id.."Mega:List:Filter:Animation"..delallmation)  
for k,v in pairs(listAnimation) do  
database:srem(bot_id.."Mega:List:Filter:Animation"..delallmation,v)  
end  
end
if DAata and DAata:match("^delallph(.*)$") and Addictive(data) then  
local delallph = DAata:match("^delallph(.*)$")
local Text ="• تم اللغاء منع كل الصور"
inline = {
{{text = '•  VeCto 𝖲𝗈𝗎𝗋𝖼𝖾 .  .',url='http://t.me/TeAm_VeCto'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
local listPhoto = database:smembers(bot_id.."Mega:List:Filter:Photo"..delallph)  
for k,v in pairs(listPhoto) do  
database:srem(bot_id.."Mega:List:Filter:Photo"..delallph,v)  
end  
end
if DAata and DAata:match("^(%d+):searchVid(.*)$") then
id_from_user  = DAata:match("(%d+)")  
local OnVid = DAata:gsub(':searchVid',''):gsub(id_from_user,'')
msgidrp  = OnVid:match("(%d+)")
local id_from_vid = DAata:gsub(':',''):gsub('searchVid',''):gsub(id_from_user,''):gsub(msgidrp,'')
if tonumber(data.sender_user_id_) ~= tonumber(id_from_user) then  
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
object = https.request('https://google7x.ml/API/hhmhhh.php?url=https://www.youtube.com/watch?v='..URL.escape(id_from_vid))
objectend = JSON.decode(object)
infovid = "*•  اختر صيغه التنزيل الان*\n"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'فيديو', callback_data=id_from_user..":DownloadVid:"..msgidrp..":"..id_from_vid..":Mp4"},{text = 'صوت', callback_data=id_from_user..":DownloadVid:"..msgidrp..":"..id_from_vid..":mp3"},{text = 'بصمه', callback_data=id_from_user..":DownloadVid:"..msgidrp..":"..id_from_vid..":ogg"}},
{{text = '•  VeCto 𝖲𝗈𝗎𝗋𝖼𝖾  .',url='http://t.me/TeAm_VeCto'}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(infovid)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
InfoVid = https.request('https://black-source.tk/Api/BotYoutube.php?Id='..URL.escape(id_from_vid))
InfoVidend = JSON.decode(InfoVid)
if InfoVidend.Info.video == "not" then  
https.request("https://asdxxcv.ml/API/Test/search.php?V="..URL.escape(id_from_vid).."&ch=do")
end
end
if DAata and DAata:match("^(%d+):DownloadVid(.*)$") then
local notId  = DAata:match("(%d+)")  
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
https.request("https://asdxxcv.ml/API/Test/search.php?search="..token.."&chat_id="..Chat_id.."&data="..URL.escape(DAata).."&n=do")
end


if Text and Text:match('(.*)/help2') then
if tonumber(Text:match('(.*)/help2')) == tonumber(data.sender_user_id_) then
local Teext =[[*
• اوامر ادمنية المجموعه ...
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• رفع، تنزيل ⇠ مميز
• تاك للكل ، عدد الكروب
• كتم ، حظر ، طرد ، تقيد
• الغاء كتم ، الغاء حظر ، الغاء تقيد
• منع ، الغاء منع 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• عرض القوائم كما يلي ...
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• المكتومين
• المميزين 
• قائمه المنع
• الصلاحيات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• تثبيت ، الغاء تثبيت
• الرابط ، الاعدادات
• الترحيب ، القوانين
• تفعيل ، تعطيل ⇠ الترحيب
• تفعيل ، تعطيل ⇠ الرابط
• اضف صلاحيه ، مسح صلاحيه 
• جهاتي ،ايدي ، رسائلي
• سحكاتي ، مجوهراتي
• كشف البوتات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• وضع ، ضع ⇠ الاوامر التاليه 
• اسم ، رابط ، صوره
• قوانين ، وصف ، ترحيب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• حذف ، مسح ⇠ الاوامر التاليه
• قائمه المنع ، المحظورين 
• المميزين ، المكتومين ، القوانين
• المطرودين ، البوتات ، الصوره
• الصلاحيات ، الرابط
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• Carbon ≻≻  * ]].. UserName..[[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '{آوآمر الحمايه}', callback_data=data.sender_user_id_.."/help1"},{text = '{آوآمر الادمنيه}', callback_data=data.sender_user_id_.."/help2"},
},
{
{text = '{آوآمر المدراء}', callback_data=data.sender_user_id_.."/help3"},{text = '{آوآمر المنشئين}', callback_data=data.sender_user_id_.."/help4"},
},
{
{text = '{آوآمر المطورين}', callback_data=data.sender_user_id_.."/help5"},{text = '{آوآمر الاعضاء}', callback_data=data.sender_user_id_.."/help6"},
},
{
{text = '𓍹 اخفاء الامر 𓍻', callback_data=msg.sender_user_id_.."/delamr"},{text = '• رجوع •', callback_data=data.sender_user_id_.."/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
elseif Text and Text:match('(.*)/help3') then  
if tonumber(Text:match('(.*)/help3')) == tonumber(data.sender_user_id_) then
local Teext =[[*
• اوامر المدراء في المجموعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• رفع ، تنزيل ⇠ ادمن
• الادمنيه 
• رفع، كشف ⇠ القيود
• تنزيل الكل ⇠ { بالرد ، بالمعرف }
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• لتغيير رد الرتب في البوت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• تغير رد ⇠ {اسم الرتبه والنص} 
• المطور ، المنشئ الاساسي
• المنشئ ، المدير ، الادمن
• المميز ، العضو
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• تفعيل ، تعطيل ⇠ الاوامر التاليه ↓
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• الايدي ، الايدي بالصوره
• ردود المطور ، ردود المدير
• اطردني ، الالعاب ، الرفع
• الحظر ، الرابط ، اوامر التحشيش
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• تعين ، مسح ⇠{ الايدي }
• رفع الادمنيه ، مسح الادمنيه
• ردود المدير ، مسح ردود المدير
• اضف ، حذف ⇠ { رد }
• تنظيف ⇠ { عدد }
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• Carbon ≻≻  * ]].. UserName..[[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '{آوآمر الحمايه}', callback_data=data.sender_user_id_.."/help1"},{text = '{آوآمر الادمنيه}', callback_data=data.sender_user_id_.."/help2"},
},
{
{text = '{آوآمر المدراء}', callback_data=data.sender_user_id_.."/help3"},{text = '{آوآمر المنشئين}', callback_data=data.sender_user_id_.."/help4"},
},
{
{text = '{آوآمر المطورين}', callback_data=data.sender_user_id_.."/help5"},{text = '{آوآمر الاعضاء}', callback_data=data.sender_user_id_.."/help6"},
},
{
{text = '𓍹 اخفاء الامر 𓍻', callback_data=msg.sender_user_id_.."/delamr"},{text = '• رجوع •', callback_data=data.sender_user_id_.."/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
elseif Text and Text:match('(.*)/help4') then  
if tonumber(Text:match('(.*)/help4')) == tonumber(data.sender_user_id_) then
local Teext =[[*
• اوامر المنشئ الاساسي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• رفع ، تنزيل ⇠{ منشئ }
• المنشئين ، مسح المنشئين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• اوامر المنشئ المجموعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• رفع ، تنزيل ⇠ { مدير }
• المدراء ، مسح المدراء
• اضف رسائل ⇠ { بالرد او الايدي }
• اضف مجوهرات ⇠ { بالرد او الايدي }
• اضف ، حذف ⇠ { امر }
• الاوامر المضافه ، مسح الاوامر المضافه
• تنزيل جميع الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• Carbon ≻≻  * ]].. UserName..[[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '{آوآمر الحمايه}', callback_data=data.sender_user_id_.."/help1"},{text = '{آوآمر الادمنيه}', callback_data=data.sender_user_id_.."/help2"},
},
{
{text = '{آوآمر المدراء}', callback_data=data.sender_user_id_.."/help3"},{text = '{آوآمر المنشئين}', callback_data=data.sender_user_id_.."/help4"},
},
{
{text = '{آوآمر المطورين}', callback_data=data.sender_user_id_.."/help5"},{text = '{آوآمر الاعضاء}', callback_data=data.sender_user_id_.."/help6"},
},
{
{text = '𓍹 اخفاء الامر 𓍻', callback_data=msg.sender_user_id_.."/delamr"},{text = '• رجوع •', callback_data=data.sender_user_id_.."/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
elseif Text and Text:match('(.*)/help5') then
if tonumber(Text:match('(.*)/help5')) == tonumber(data.sender_user_id_) then
local Teext =[[*
• اوامر المطور الاساسي  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• حظر عام ، الغاء العام
• اضف ، حذف ⇠ { مطور } 
• قائمه العام ، مسح قائمه العام
• المطورين ، مسح المطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• اضف ، حذف ⇠ { رد للكل }
• وضع ، حذف ⇠ { كليشه المطور } 
• مسح ردود المطور ، ردود المطور 
• تحديث ،  تحديث السورس 
• تعين عدد الاعضاء ⇠ { العدد }
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• تفعيل ، تعطيل ⇠ { الاوامر التاليه ↓}
• البوت الخدمي ، المغادرة ، الاذاعه
• ملف ⇠ { اسم الملف }
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• مسح جميع الملفات 
• المتجر ، الملفات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• اوامر المطور في البوت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• تفعيل ، تعطيل ، الاحصائيات
• رفع، تنزيل ⇠ { منشئ اساسي }
• مسح الاساسين ، المنشئين الاساسين 
• غادر ، غادر ⇠ { والايدي }
• اذاعه ، اذاعه بالتوجيه ، اذاعه بالتثبيت
• اذاعه خاص ، اذاعه خاص بالتوجيه 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• Carbon ≻≻  * ]].. UserName..[[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '{آوآمر الحمايه}', callback_data=data.sender_user_id_.."/help1"},{text = '{آوآمر الادمنيه}', callback_data=data.sender_user_id_.."/help2"},
},
{
{text = '{آوآمر المدراء}', callback_data=data.sender_user_id_.."/help3"},{text = '{آوآمر المنشئين}', callback_data=data.sender_user_id_.."/help4"},
},
{
{text = '{آوآمر المطورين}', callback_data=data.sender_user_id_.."/help5"},{text = '{آوآمر الاعضاء}', callback_data=data.sender_user_id_.."/help6"},
},
{
{text = '{آوآمر التسليه}', callback_data=data.sender_user_id_.."/helpst"},{text = '{الالعاب}', callback_data=data.sender_user_id_.."/game"},
},
{
{text = '𓍹 اخفاء الامر 𓍻', callback_data=msg.sender_user_id_.."/delamr"},{text = '• رجوع •', callback_data=data.sender_user_id_.."/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
elseif Text and Text:match('(.*)/help6') then
if tonumber(Text:match('(.*)/help6')) == tonumber(data.sender_user_id_) then
local Teext =[[*
• اوامر الاعضاء 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• السورس • موقعي • رتبتي • معلوماتي 
• رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
• ميمز • متحركه ‹ صوره › ريمكس • فلم • مسلسل • انمي
• رسائلي • حذف رسائلي • اسمي • معرفي 
• ايدي •ايديي • جهاتي • راسلني • الالعاب 
• مجوهراتي • بيع مجوهراتي • القوانين • زخرفه 
• رابط الحذف • نزلني • اطردني • المطور 
• منو ضافني • مشاهدات المنشور • الرابط 
• ايدي المجموعه • معلومات المجموعه 
• نسبه الحب • نسبه الكره • نسبه الغباء 
• نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• لقبه + بالرد
• كول + الكلمه
• زخرفه + اسمك
• برج + نوع البرج
• معنى اسم + الاسم
• بوسه • بوسها ⇠ بالرد
• احسب + تاريخ ميلادك
• صلاحياته ⇠ بالرد • بالمعرف • بالايدي
• ايدي • كشف  ⇠ بالرد • بالمعرف • بالايدي
• تحويل + بالرد ⇠ صوره • ملصق • صوت • بصمه
• انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '{آوآمر الحمايه}', callback_data=data.sender_user_id_.."/help1"},{text = '{آوآمر الادمنيه}', callback_data=data.sender_user_id_.."/help2"},
},
{
{text = '{آوآمر المدراء}', callback_data=data.sender_user_id_.."/help3"},{text = '{آوآمر المنشئين}', callback_data=data.sender_user_id_.."/help4"},
},
{
{text = '{آوآمر المطورين}', callback_data=data.sender_user_id_.."/help5"},{text = '{آوآمر الاعضاء}', callback_data=data.sender_user_id_.."/help6"},
},
{
{text = '𓍹 اخفاء الامر 𓍻', callback_data=msg.sender_user_id_.."/delamr"},{text = '• رجوع •', callback_data=data.sender_user_id_.."/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
elseif Text and Text:match('(.*)/help') then
if tonumber(Text:match('(.*)/help')) == tonumber(data.sender_user_id_) then
local Teext =[[
اهلا بك في بوت "..texte.."\nيمكنك استخدام هذه الاوامر
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '{آوآمر الحمايه}', callback_data=data.sender_user_id_.."/homelocks"},{text = '{آوآمر الادمنيه}', callback_data=data.sender_user_id_.."/help2"},
},
{
{text = '{آوآمر المدراء}', callback_data=data.sender_user_id_.."/help3"},{text = '{آوآمر المنشئين}', callback_data=data.sender_user_id_.."/help4"},
},
{
{text = '{آوآمر المطورين}', callback_data=data.sender_user_id_.."/help5"},{text = '{آوآمر الاعضاء}', callback_data=data.sender_user_id_.."/help6"},
},
{
{text = '𓍹 اخفاء الامر 𓍻', callback_data=msg.sender_user_id_.."/delamr"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end


if DAata and DAata:match("^(%d+):cancelRd(.*)$") then
local notId  = DAata:match("(%d+)")  
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if database:get(bot_id.."Mega:Set:Manager:rd"..data.sender_user_id_..":"..data.chat_id_) then
database:del(bot_id.."Mega:Set:Manager:rd"..data.sender_user_id_..":"..data.chat_id_)
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("• تم الغاء الامر بنجاح").."&show_alert=true")
else
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
end
end
if DAata and DAata:match("^(%d+)playwbot(.*)$") then
local notId  = DAata:match("(%d+)")  
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
x = {} 
x.inline_keyboard = {
{{text ="- مقص ",callback_data=data.sender_user_id_.."gmemqs"},{text ="- ورقه ",callback_data=data.sender_user_id_.."gmewra"},{text ="- حجره",callback_data=data.sender_user_id_.."gmehjra"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("✂️︙ حجره ورقه مقص\n👤︙ اضغط للعب معي ")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(x)) 
end
if DAata and DAata:match("^(%d+)gme(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('gme',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
x = {} 
x.inline_keyboard = {
{{text = '•  العب مجددا',callback_data=data.sender_user_id_.."playwbotme"}},
}
local r = {"mqs","hjra","wra","hjra","mqs","wra"} 
btme = r[math.random(#r)]
if OnID == btme then
rr="🧟‍♀️︙النتيجه تعادل"
elseif OnID=="hjra" and btme=="mqs" or OnID=="mqs" and btme=="wra" or OnID=="wra" and btme=="hjra" then
rr="🤴︙انت الفائز"
elseif OnID=="mqs" and btme=="hjra" or OnID=="hjra" and btme=="wra"  or OnID=="wra" and btme=="mqs" then
rr="🧙🏻‍♂️︙انا فزت حظ اوفر لك"
end
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(rr)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(x)) 
end
end

if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local text = msg.content_.text_
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("OLD MESSAGE")
return false
end
if msg.sender_user_id_ and Muted_Groups(msg.chat_id_,msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if tonumber(msg.sender_user_id_) ~= tonumber(bot_id) then  
if msg.sender_user_id_ and Ban_Groups(msg.chat_id_,msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_Groups(msg.chat_id_,msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Ban_All_Groups(msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_All_Groups(msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
end 
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == "MessagePinMessage" or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatChangeTitle" or msg.content_.ID == "MessageChatDeleteMember" then   
if database:get(bot_id.."Mega:Lock:tagservr"..msg.chat_id_) then  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false
end    
end   
if text and not database:sismember(bot_id..'Mega:Spam:Group'..msg.sender_user_id_,text) then
database:del(bot_id..'Mega:Spam:Group'..msg.sender_user_id_) 
end
------------------------------------------------------------------------
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
database:set(bot_id..'Mega:User:Name'..msg.sender_user_id_,data.username_)
end;end,nil)   
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
database:set(bot_id.."Mega:Who:Added:Me"..msg.chat_id_..":"..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."Mega:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "del" then   
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
------------------------------------------------------------------------
if text and database:get(bot_id.."Mega:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = database:get(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
database:del(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
database:del(bot_id.."Mega:Set:Cmd:Group:New"..msg.chat_id_)
database:srem(bot_id.."Mega:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"• تم ازالة الامر من القروب")  
else
send(msg.chat_id_, msg.id_,"• لا يوجد امر بهاذا الاسم تاكد من الامر واعد المحاوله")  
end
database:del(bot_id.."Mega:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
------------------------------------------------------------------------
if data.message_.content_.text_ then
local NewCmmd = database:get(bot_id.."Mega:Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
local Name_Bot = (database:get(bot_id.."Mega:Name:Bot") or "فيكتو")
if not database:get(bot_id.."Mega:Fun_Bots"..msg.chat_id_) then
if text ==  ""..Name_Bot..' شنو رئيك بهاذا' and tonumber(msg.reply_to_message_id_) > 0 then     
function FunBot(extra, result, success) 
local Fun = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله ??','يلعب ع البنات 🙄', 'ولد زايعته الكاع ??🙊','صاك يخبل ومعضل ','محلو وشواربه جنها مكناسه 😂??🏼‍♀️','اموت عليه 🌝','هوه غير الحب مال اني ❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات  ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️','مو خوش ولد 🤓' } 
send(msg.chat_id_, result.id_,''..Fun[math.random(#Fun)]..'')   
end   
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end  
if text == ""..Name_Bot..' شنو رئيك بهاي' and tonumber(msg.reply_to_message_id_) > 0 then    
function FunBot(extra, result, success) 
local Fun = {'الكبد مال اني هيه ','ختولي ماحبها ','خانتني ويه صديقي 😔','بس لو الكفها اله اعضها 💔','خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒','جذابه ومنافقه سوتلي مشكله ويه الحب مالتي ','ئووووووووف اموت ع ربها ','ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفون 7 ','صديقتي وختي وروحي وحياتي ','فد وحده منحرفه 😥','ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐','ام سحوره سحرت اخويا وعلكته 6 سنوات 🤕','ماحبها 🙁','بله هاي جهره تسئل عليها ؟ ','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🏼','ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹' } 
send(msg.chat_id_,result.id_,''..Fun[math.random(#Fun)]..'') 
end  
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end    
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
------------------------------------------------------------------------
Mega_Started_Bot(msg,data)
files_Mega(msg)
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
database:incr(bot_id..'Mega:message_edit'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if database:get(bot_id.."Mega:Lock:edit"..msg.chat_id_) and not Text and not BasicConstructor(result) then
local list = database:smembers(bot_id.."Mega:Basic:Constructor"..msg.chat_id_)
t = "•  المنشئين الاساسين تعالو مخرب \n \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Mega:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• ماكو منششئين يشوفولك جاره"
end
Reply_Status(result,result.sender_user_id_,"reply","• قام بالتعديل على الميديا"..t)  
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
end
local text = result.content_.text_
if not Addictive(result) then
------------------------------------------------------------------------
if text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("[hH][tT][tT][pP][sT]") or text and text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if database:get(bot_id.."Mega:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)") then
if database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("@") then
if database:get(bot_id.."Mega:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)") then
if database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("#") then
if database:get(bot_id.."Mega:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("/") then
if database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text and text:match("(.*)(/)(.*)") then
if database:get(bot_id.."Mega:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local Mega_Msg = database:sismember(bot_id.."Mega:List:Filter:text"..result.chat_id_,text) 
if Mega_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","• الكلمه ممنوعه من القروب")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
if msg.content_.ID == 'MessageAnimation' then    
local Animation_Msg = database:sismember(bot_id.."Mega:List:Filter:Animation"..result.chat_id_,result.content_.animation_.animation_.persistent_id_) 
if Animation_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","• المتحركه ممنوعه من القروب")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
if msg.content_.ID == 'MessagePhoto' then    
local Photo_Msg = database:sismember(bot_id.."Mega:List:Filter:Photo"..result.chat_id_,result.content_.photo_.sizes_[1].photo_.persistent_id_) 
if Photo_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","• الصوره ممنوعه من القروب")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
if msg.content_.ID == 'MessageSticker' then    
local Sticker_Msg = database:sismember(bot_id.."Mega:List:Filter:Sticker"..result.chat_id_,result.content_.sticker_.sticker_.persistent_id_) 
if Sticker_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","• الملصق ممنوع من القروب")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = database:get(bot_id..'Mega:Msg:Pin:Chat'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;database:del(bot_id..'Mega:Msg:Pin:Chat'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'Mega:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'Mega:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'Mega:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
end
end
if (data.ID == "UpdateOption" and data.value_.value_ == "Ready") then
print("\27[34m"..[[
>> The Bot is Running
>> Bot source > Mega
>>Source channel > @TeAm_VeCto
>>Source developer > @mmssds


]].."\27[m")
local list = database:smembers(bot_id..'Mega:UsersBot')  
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local list = database:smembers(bot_id..'Mega:Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
database:srem(bot_id..'Mega:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Mega:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Mega:Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Mega:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id..'Mega:Chek:Groups',v)  
end end,nil)
end;CleangGroups();end;end
