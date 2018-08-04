# 项目说明

通过**UUID+KEYCHAIN**的方式获取ios的唯一设备id.

如果使用IDFA,请尝试 [KEYCHAIN+IDFA](https://github.com/jasonz1987/cordova-plugin-keychain-idfa)，

详细说明请参考：http://www.jason-z.com/post/22



# 示例


[Ionic3 Demo](https://github.com/jasonz1987/ionic-keychain-uuid-demo)



# 安装

```bash
cordova plugin add cordova-plugin-keychain-uuid
```



# 使用



### 从keychain中获取设备ID

```javascript
var args = {
  'key':'com.jason-z.test.uuid'
};

KeychainUUID.getDeviceID((id)=>{
 console.log(id);   
},(err)=>{
    console.log(err);
})
```



###  从keychain中删除设备ID

```javascript
var args = {
  'key':'com.jason-z.test.uuid'
};

KeychainUUID.deleteDeviceID((id)=>{
 console.log(id);   
},(err)=>{
    console.log(err);
})
```

*此处的key是用来标识keychain存储的键值，根据自己定义。*




# 注意事项

由于KEYCHAIN默认是存放在私有区内的，如果想要在不同APP（同一开发者账号下）之间内数据共享，需要开启

`KEYCHAIN SHARE`, 具体设置：Xcode->Capabilities->Keychain Sharing，添加相同的group即可。

![截图](screenshot-1.png)



# 赞赏

如果我的插件帮助到了你，欢迎赞赏。

![赞赏](donate.png)

