# yk-project

所学技术练习

> 获取授权码
 http://localhost:3711/oauth/authorize?response_type=code&client_id=yk&scope=all&redirect_uri=http://www.baidu.com
> 通过授权码获取token
 http://localhost:3711/oauth/token
 - client_id=yk
 - client_secret=secret
 - redirect_uri=http://www.baidu.com
 - code=上一步获取的授权码
 - grant_type=authorization_code
 获取token之后拿着token去访问资源服务器
 token放在head里面
 名字：Authorization=Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYmxvZyJdLCJ1c2VyX25hbWUiOiJ1c2VyIiwic2NvcGUiOlsiYWxsIl0sImV4cCI6MTYxMjg2MDMzMywiYXV0aG9yaXRpZXMiOlsicDIiXSwianRpIjoiTG5ZR0IzV2xWVGM0UE0yNy8xNzdUVUI2VHVNPSIsImNsaWVudF9pZCI6InlrIn0.q1hp7OnC9X7IdU4so6Y0SUZU7j_UppnrifDuBnmcLWw
