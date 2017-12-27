package com.jd.orange.model.advanced;

public class CountInfo {

    private Integer goodsCount;//商品数量

    private Integer goodsCountUnder;//商品数量(下架)

    private Integer goodsCountLoad;//商品数量(上架)

    private Integer getGoodsCountRec;//商品数量(推荐)

    private Integer orderCount;//订单总数量

    private Integer orderCountNoSure;//订单数量(未确认)

    private Integer orderCountNoPay;//订单数量(未付款)

    private Integer orderCountNoSend;//订单数量(未发货)

    private Integer orderCountNoReceived;//订单数量(未收货)

    private Integer orderCountFinish;//订单数量(已完成)

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

    public Integer getGetGoodsCountRec() {
        return getGoodsCountRec;
    }

    public void setGetGoodsCountRec(Integer getGoodsCountRec) {
        this.getGoodsCountRec = getGoodsCountRec;
    }

    public Integer getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
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

    public Integer getOrderCountNoReceived() {
        return orderCountNoReceived;
    }

    public void setOrderCountNoReceived(Integer orderCountNoReceived) {
        this.orderCountNoReceived = orderCountNoReceived;
    }

    public Integer getOrderCountFinish() {
        return orderCountFinish;
    }

    public void setOrderCountFinish(Integer orderCountFinish) {
        this.orderCountFinish = orderCountFinish;
    }
}
