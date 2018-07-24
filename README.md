# 项目说明

通过UUID+KEYCHAIN的方式获取ios的唯一设备id.

如果使用AdSupport,请尝试另外一种获取方式：

https://github.com/jasonz1987/cordova-plugin-keychain-idfa



具体文档说明请参考：http://www.jason-z.com/post/22



# DEMO


https://github.com/jasonz1987/ionic-keychain-uuid-demo



# 安装

```
cordova plugin add cordova-plugin-keychain-uuid
```

# 调用

## 从keychain中获取设备ID

```
var args = {
  'key':'com.jason-z.test.uuid'
};

KeychainUUID.getDeviceID((id)=>{
 console.log(id);   
},(err)=>{
    console.log(err);
})
```

##  从keychain中删除设备ID

```
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


# 赞赏

如果我的插件帮助到了你，欢迎赞赏。

![赞赏](donate.png)

