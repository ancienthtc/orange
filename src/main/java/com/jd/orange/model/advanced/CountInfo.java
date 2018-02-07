package com.jd.orange.model.advanced;

public class CountInfo {

    private Integer goodsCount;//商品数量

    private Integer goodsCountUnder;//商品数量(下架)

    private Integer goodsCountLoad;//商品数量(上架)

    private Integer goodsFormatCount;//总规格数

    private Double goodsAllSales;//总销量

    private Integer orderCountNoSure;//订单数量(未确认)

    private Integer orderCountNoPay;//订单数量(未付款)

    private Integer orderCountNoSend;//订单数量(未发货)

    private Integer orderCountFinish;//订单数量(已完成)

    private Integer orderCountCancel;//订单数量(已取消)

    public CountInfo()
    {

    }

    public CountInfo(CountInfo countInfo)
    {
        this.goodsCount = countInfo.goodsCount;
        this.goodsCountUnder = countInfo.goodsCountUnder;
        this.goodsCountLoad = countInfo.goodsCountLoad;
        this.goodsFormatCount = countInfo.goodsFormatCount;
        this.goodsAllSales = countInfo.goodsAllSales;
        this.orderCountNoSure = countInfo.orderCountNoSure;
        this.orderCountNoPay = countInfo.orderCountNoPay;
        this.orderCountNoSend = countInfo.orderCountNoSend;
        this.orderCountFinish = countInfo.orderCountFinish;
        this.orderCountCancel = countInfo.orderCountCancel;
    }

    public CountInfo(Integer goodsCount, Integer goodsCountUnder, Integer goodsCountLoad, Integer goodsFormatCount,
                     Double goodsAllSales, Integer orderCountNoSure, Integer orderCountNoPay, Integer orderCountNoSend,
                     Integer orderCountFinish, Integer orderCountCancel)
    {
        this.goodsCount = goodsCount;
        this.goodsCountUnder = goodsCountUnder;
        this.goodsCountLoad = goodsCountLoad;
        this.goodsFormatCount = goodsFormatCount;
        this.goodsAllSales = goodsAllSales;
        this.orderCountNoSure = orderCountNoSure;
        this.orderCountNoPay = orderCountNoPay;
        this.orderCountNoSend = orderCountNoSend;
        this.orderCountFinish = orderCountFinish;
        this.orderCountCancel = orderCountCancel;
    }

    public Integer getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(Integer goodsCount) {
        this.goodsCount = goodsCount;
    }

    public Integer getGoodsCountUnder() {
        return goodsCountUnder;
    }

    public void setGoodsCountUnder(Integer goodsCountUnder) {
        this.goodsCountUnder = goodsCountUnder;
    }

    public Integer getGoodsCountLoad() {
        return goodsCountLoad;
    }

    public void setGoodsCountLoad(Integer goodsCountLoad) {
        this.goodsCountLoad = goodsCountLoad;
    }

    public Integer getGoodsFormatCount() {
        return goodsFormatCount;
    }

    public void setGoodsFormatCount(Integer goodsFormatCount) {
        this.goodsFormatCount = goodsFormatCount;
    }

    public Double getGoodsAllSales() {
        return goodsAllSales;
    }

    public void setGoodsAllSales(Double goodsAllSales) {
        this.goodsAllSales = goodsAllSales;
    }

    public Integer getOrderCountNoSure() {
        return orderCountNoSure;
    }

    public void setOrderCountNoSure(Integer orderCountNoSure) {
        this.orderCountNoSure = orderCountNoSure;
    }

    public Integer getOrderCountNoPay() {
        return orderCountNoPay;
    }

    public void setOrderCountNoPay(Integer orderCountNoPay) {
        this.orderCountNoPay = orderCountNoPay;
    }

    public Integer getOrderCountNoSend() {
        return orderCountNoSend;
    }

    public void setOrderCountNoSend(Integer orderCountNoSend) {
        this.orderCountNoSend = orderCountNoSend;
    }

    public Integer getOrderCountFinish() {
        return orderCountFinish;
    }

    public void setOrderCountFinish(Integer orderCountFinish) {
        this.orderCountFinish = orderCountFinish;
    }

    public Integer getOrderCountCancel() {
        return orderCountCancel;
    }

    public void setOrderCountCancel(Integer orderCountCancel) {
        this.orderCountCancel = orderCountCancel;
    }

    public CountInfo add(CountInfo countInfo)
    {
        //商品
        if (countInfo.goodsAllSales !=null)
        {
            this.goodsAllSales = countInfo.goodsAllSales;
        }
        if (countInfo.goodsCount !=null)
        {
            this.goodsCount = countInfo.goodsCount;
        }
        if (countInfo.goodsCountLoad !=null)
        {
            this.goodsCountLoad = countInfo.goodsCountLoad;
        }
        if (countInfo.goodsCountUnder !=null)
        {
            this.goodsCountUnder = countInfo.goodsCountUnder;
        }
        if (countInfo.goodsFormatCount !=null)
        {
            this.goodsFormatCount = countInfo.goodsFormatCount;
        }
        //订单
        if (countInfo.orderCountNoSure !=null)
        {
            this.orderCountNoSure = countInfo.orderCountNoSure;
        }
        if (countInfo.orderCountNoPay !=null)
        {
            this.orderCountNoPay = countInfo.orderCountNoPay;
        }
        if (countInfo.orderCountNoSend !=null)
        {
            this.orderCountNoSend = countInfo.orderCountNoSend;
        }
        if (countInfo.orderCountFinish !=null)
        {
            this.orderCountFinish = countInfo.orderCountFinish;
        }
        if (countInfo.orderCountCancel !=null)
        {
            this.orderCountCancel = countInfo.orderCountCancel;
        }
        return CountInfo.this;
    }

    @Override
    public String toString() {
        return "CountInfo{" +
                "goodsCount=" + goodsCount +
                ", goodsCountUnder=" + goodsCountUnder +
                ", goodsCountLoad=" + goodsCountLoad +
                ", goodsFormatCount=" + goodsFormatCount +
                ", goodsAllSales=" + goodsAllSales +
                ", orderCountNoSure=" + orderCountNoSure +
                ", orderCountNoPay=" + orderCountNoPay +
                ", orderCountNoSend=" + orderCountNoSend +
                ", orderCountFinish=" + orderCountFinish +
                ", orderCountCancel=" + orderCountCancel +
                '}';
    }
}
