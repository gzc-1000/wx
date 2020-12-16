// page/component/orders/orders.js
Page({
  data:{
    address:{},
    hasAddress: false,
    total:0,
    orders:[
        {id:1,title:'新鲜芹菜 半斤',image:'/image/s5.png',num:4,price:0.01}
        
      ]
  },

  onReady() {
    this.getTotalPrice();
  },
  
  onShow:function(){
    const self = this;
    wx.getStorage({
      key:'address',
      success(res) {
        self.setData({
          address: res.data,
          hasAddress: true
        })
      }
    })
  },

  /**
   * 计算总价
   */
  getTotalPrice() {
    let orders = this.data.orders;
    let total = 0;
    for(let i = 0; i < orders.length; i++) {
      total += orders[i].num * orders[i].price;
    }
    this.setData({
      total: total
    })
  },

  toPay() {
    wx.showModal({
      title: '提示',
      content: '支付成功',
      text:'center',
      complete() {
        wx.switchTab({
          url: '/page/component/user/user'
        })
      }
    })
  }
})