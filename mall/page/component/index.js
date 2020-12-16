Page({
  data: {
    new:[],
    imgUrls: [
      '/image/list1.png'  
    ],
    indicatorDots: false,
    autoplay: false,
    interval: 3000,
    duration: 800,
  },
  onLoad: function (options) {
    let that = this;
wx.request({
  url: 'http://localhost:3000/new',
  success: res => {
    console.log(res)
    that.setData({
      new : res.data
    })
  }
})
  },
})