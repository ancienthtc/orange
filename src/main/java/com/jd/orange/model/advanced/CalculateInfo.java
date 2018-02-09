package com.jd.orange.model.advanced;

public class CalculateInfo {

    //本月销量
    private Double this_sales;

    //本月成交量(完成)
    private Double this_finish;

    //上月销量
    private Double last_sales;

    //上月成交量(完成)
    private Double last_finish;

    //销量增长率
    private Double rate_sales;

    //成交量增长率
    private Double rate_finish;

    public Double getThis_sales() {
        return this_sales;
    }

    public void setThis_sales(Double this_sales) {
        this.this_sales = this_sales;
    }

    public Double getThis_finish() {
        return this_finish;
    }

    public void setThis_finish(Double this_finish) {
        this.this_finish = this_finish;
    }

    public Double getLast_sales() {
        return last_sales;
    }

    public void setLast_sales(Double last_sales) {
        this.last_sales = last_sales;
    }

    public Double getLast_finish() {
        return last_finish;
    }

    public void setLast_finish(Double last_finish) {
        this.last_finish = last_finish;
    }

    public Double getRate_sales() {
        return rate_sales;
    }

    public void setRate_sales(Double rate_sales) {
        this.rate_sales = rate_sales;
    }

    public Double getRate_finish() {
        return rate_finish;
    }

    public void setRate_finish(Double rate_finish) {
        this.rate_finish = rate_finish;
    }
}
