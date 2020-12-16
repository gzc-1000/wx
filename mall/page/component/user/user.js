const app = getApp()

Page({
  data:{
    userInfo: {},
    hasUserInfo: false,
    thumb:'',
    nickname:'',
    orders:[],
    hasAddress:false,
    address:{}
  },
  getUserInfo: function (e) {
    console.log(e.detail.userInfo)
    if (e.detail.userInfo) {
      this.setData({
        userInfo: e.detail.userInfo,
        hasUserInfo: true
      })
    }
    // 加入缓存
    wx.setStorage({
      key: 'address',
      data: {
        name:this.data.userInfo.nickName,
        phone:'请绑定手机号',
        detail:this.data.userInfo.city
      },
      success(res){
        console.log(res)
      }
    })
  },
  onLoad(){
    let that =this;
    if (app.globalData.userInfo) {
      that.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else {
      app.userInfoReadyCallback = res => {
        that.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    }
    
    // var self = this;
    /**
     * 获取用户信息
     */
    // wx.getUserInfo({
    //   success: function(res){
    //     self.setData({
    //       thumb: res.userInfo.avatarUrl,
    //       nickname: res.userInfo.nickName
    //     })
    //   }
    // }),

    /**
     * 发起请求获取订单列表信息
     */
    wx.request({
      url: 'http://www.gdfengshuo.com/api/wx/orders.txt',
      success(res){
        that.setData({
          orders: res.data
        })
      }
    })
  },
  onShow(){
    var self = this;
    /**
     * 获取本地缓存 地址信息
     */
    wx.getStorage({
      key: 'address',
      success: function(res){
        self.setData({
          hasAddress: true,
          address: res.data
        })
      }
    })
  },
  /**
   * 发起支付请求
   */
  payOrders(){
    wx.requestPayment({
      timeStamp: 'String1',
      nonceStr: 'String2',
      package: 'String3',
      signType: 'MD5',
      paySign: 'String4',
      success: function(res){
        console.log(res)
      },
      fail: function(res) {
        wx.showModal({
          title:'支付提示',
          content:'<text>',
          showCancel: false
        })
      }
    })
  }
})