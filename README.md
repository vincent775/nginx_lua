# nginx_lua
nginx服务器使用lua语言进行安全验证


lua文件夹为lua文件，进行黑名单验证
 在nginx的配置文件nginx.conf的http模块 添加
   lua_package_path "/usr/local/nginx/lua/?.lua";  #lua文件的匹配目录，就是在这个文件夹下面查找lua文件
   init_by_lua_file "lua/ip_init.lua";  #预加载lua文件选项，进行大文件预加载，节省时间
    access_by_lua_file "lua/ip_black.lua";   #访问的时候验证lua文件地址，安全验证和防攻击在这个时候验证最合适
