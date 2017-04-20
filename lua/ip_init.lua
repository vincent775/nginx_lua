-- 去除字符串两边的空格  
function trim(s)   
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))  
end 

--读取黑名单文件
function getip()
    file = io.open("/usr/local/nginx/lua/ip.txt","r")
    --ngx.log("1111111111111111111111111111111")
    ls={}
    i=0
    for l in file:lines() do
      if l ~= nil then    
        ls[i]=trim(l)
        i=i+1
      end
    end
    file:close()   
    return ls
end


--获取ip
function getclientip()
   IP = ngx.var.remote_addr
   if IP == nil then
      IP = "unknown"
   end
   return IP
end


--黑名单
function blackip()
   iplist ={} 
   iplist=getip()         
   if next(iplist) ~= nil then
      for _,ip in pairs(iplist) do
          if getclientip()== ip then
             --ngx.exit(403)
             ngx.say("this ip is Blacklist")
             return true    
          end
      end
   end
      return false
end


--blackip()  
