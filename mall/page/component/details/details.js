var app = getApp();
Page({
  data:{
    id: '',
    new:[],
    goods: {
      // image: '/image/goods1.png',
      // title: '新鲜梨花带雨',
      // price: 0.01,
      // stock: '有货',
      // detail: '这里是梨花带雨详情。',
      // parameter: '125g/个',
      // service: '不支持退货'
    },
    num: 1,
    totalNum: 0,
    hasCarts: false,
    curIndex: 0,
    show: false,
    scaleCart: false
  },
  tocart(){
getApp().globalData.id = this.data.id;
getApp().globalData.nums = this.data.totalNum;

  wx.switchTab({
    url: '../cart/cart',
  }),
  wx.request({
    url: 'http://localhost:3000/cartadd',
    data:{
      id:this.data.id,
      nums:this.data.totalNum
    },
    success:res=>{
      // console.log(res)
    }
  })
  },
  // 接受id
  onLoad: function(options) {
    // console.log(options)
    this.setData({
      id: options.id,
    })

    let that = this
    wx.request({
      url: 'http://localhost:3000/newbyid',
      data:{
        id:this.data.id
      },
      success:res => {
      // console.log(res)
      that.setData({
        new : res.data[0]
      })
      console.log(res.data[0])

      }
    })

  },

  addCount() {
    let num = this.data.num;
    num++;
    this.setData({
      num : num
    })
  },

  addToCart() {
    const self = this;
    const num = this.data.num;
    let total = this.data.totalNum;

    self.setData({
      show: true
    })
    setTimeout( function() {
      self.setData({
        show: false,
        scaleCart : true
      })
      setTimeout( function() {
        self.setData({
          scaleCart: false,
          hasCarts : true,
          totalNum: num + total
        })
      }, 200)
    }, 300)
   

  },

  bindTap(e) {
    const index = parseInt(e.currentTarget.dataset.index);
    this.setData({
      curIndex: index
    })
  }
 
})